import 'dart:async';
import 'dart:io';
import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_error.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_error_response.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_response.dart';
import 'package:calorietracker/shared/data/model/collection/base_collection_error.dart';
import 'package:calorietracker/shared/data/model/collection/base_collection_error_response.dart';
import 'package:calorietracker/shared/data/model/collection/create_food_error.dart';
import 'package:calorietracker/shared/data/model/collection/meal_entries_response.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/meal_entries_list.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/service/database/diary_entry_service.dart';
import 'package:calorietracker/shared/data/service/date_formatting_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DataSyncService {
  bool isUploadInProgress = false;

  final DiaryEntryService _diaryEntryService;
  final CollectionApiService _collectionApiService;
  final LoggingService _loggingService;
  final FoodService _foodService;
  final DateFormattingService _dateFormattingService;
  final AuthRepository _authRepository;

  StreamSubscription? _userSubscription;

  DataSyncService(
    this._diaryEntryService,
    this._collectionApiService,
    this._loggingService,
    this._foodService, {
    required DateFormattingService dateFormattingService,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       _dateFormattingService = dateFormattingService;

  Future<void> uploadLocalData({DateTime? selectedDay}) async {
    if (isUploadInProgress) {
      return;
    }
    isUploadInProgress = true;
    _loggingService.info('Local data upload started: ${DateTime.now()}');
    final pendingFoods = await _foodService.getFoodsPendingUpload();
    await _uploadFoods(pendingFoods: pendingFoods);

    final pendingEntries = await _diaryEntryService.getDiaryEntries(filterPending: true);
    await _updateLocalDiaryFoods(pendingEntries: pendingEntries);
    final uploadReadyEntries = await _diaryEntryService.getDiaryEntries(filterUploadReady: true);
    final uploadedEntriesIds = await _pushDiary(uploadReadyEntries: uploadReadyEntries);
    await _markPushedLocalDiary(addedEntries: uploadedEntriesIds, pendingEntries: uploadReadyEntries);

    final user = _authRepository.selectedUser;
    if (user != null) {
      await _fetchRemoteDiary(user: user, date: selectedDay);
    } else {
      _loggingService.info('Could not pull remote diary, user was null');
      _userSubscription = _authRepository.selectedUserStream.listen((_) {
        _userSubscription?.cancel();
        uploadLocalData();
      });
    }

    _loggingService.info('Local data upload done: ${DateTime.now()}');
    isUploadInProgress = false;
  }

  Future<void> _markPushedLocalDiary({required List<LocalDiaryEntry> pendingEntries, required List<AddLocalDataResponse> addedEntries}) async {
    if (addedEntries.isEmpty) {
      return;
    }

    final addedEntriesSet = Set<AddLocalDataResponse>.from(addedEntries);
    final entriesToUpdate = pendingEntries.where(
      (pendingDiaryEntry) => addedEntriesSet.any((addedEntry) => addedEntry.localResourceId == pendingDiaryEntry.localId),
    );
    for (final diaryEntry in entriesToUpdate) {
      diaryEntry.pushedEntry = true;
      diaryEntry.errorPushingEntry = false;
      diaryEntry.entryId = addedEntriesSet.firstWhereOrNull((addedEntry) => addedEntry.localResourceId == diaryEntry.localId)?.resourceId;
    }

    await _diaryEntryService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }

  Future<void> _updateLocalDiaryFoods({required List<LocalDiaryEntry> pendingEntries}) async {
    if (pendingEntries.isEmpty) {
      return;
    }

    final entriesToUpdate = pendingEntries.where(
      // Diary entry has no remote food id set
      (entry) => (entry.localFood.target?.foodId ?? 0) == 0,
    );
    for (final entry in entriesToUpdate) {
      entry.localFood.target = await _foodService.findLocalFoodById(id: entry.localFood.target!.id);
    }

    await _diaryEntryService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }

  Future<void> _uploadFoods({required List<LocalFood> pendingFoods}) async {
    if (pendingFoods.isEmpty) {
      return;
    }

    final requestFoods = pendingFoods.map((localFood) => localFood.addLocalFoodRequest).toList();
    try {
      final addedFoods = await _collectionApiService.createFoods(localFoods: requestFoods);
      if (addedFoods.isNotEmpty) {
        for (final food in addedFoods) {
          final foundFood = await _foodService.findLocalFoodById(id: food.localResourceId);
          if (foundFood == null) {
            _loggingService.info('Added food not found in local foods $food');
            continue;
          } else {
            foundFood.pushed = true;
            foundFood.foodId = food.resourceId;
            _foodService.upsertFood(localFood: foundFood);
          }
        }
      }
    } catch (error, stackTrace) {
      if (_isPartiallyInvalid(error)) {
        _loggingService.info('Invalid food error while calling foods bulk insert API ${(error as DioException).response?.data}');
        final data = error.response?.data;
        final existingResourceErrors = <CreateFoodError>[];
        final localDataErrors = <AddLocalDataError>[];
        if (data is Map<String, dynamic>) {
          final errorResponse = BaseCollectionErrorResponse.fromJson(data);
          for (final error in errorResponse.errors) {
            error.maybeWhen(orElse: () {}, createFood: (e) => existingResourceErrors.add(e), addLocalData: (e) => localDataErrors.add(e));
          }
          await _upsertExistingPendingFoods(pendingFoods: pendingFoods, errors: existingResourceErrors);
          await _markInvalidLocalFoods(pendingFoods: pendingFoods, errors: localDataErrors);
          await _retryUploadValidFoods(errorResponse, pendingFoods);
        }
      } else {
        _loggingService.handle(error, stackTrace);
      }
    }
  }

  Future<void> _upsertExistingPendingFoods({required List<LocalFood> pendingFoods, required List<CreateFoodError> errors}) async {
    if (errors.isEmpty) {
      return;
    }

    final foodsToUpdate = pendingFoods.where((pendingFood) => errors.any((error) => error.localId == pendingFood.id));
    for (final food in foodsToUpdate) {
      food.foodId = errors.firstWhere((element) => element.localId == food.id).resource.id;
      food.pushed = true;
    }
    await _foodService.upsertFoods(localFoods: foodsToUpdate.toList());
  }

  Future<List<AddLocalDataResponse>> _pushDiary({required List<LocalDiaryEntry> uploadReadyEntries}) async {
    if (uploadReadyEntries.isEmpty) {
      return [];
    }

    final createdEntriesIds = await _createRemoteDiaryEntries(uploadReadyEntries);
    await _deleteRemoteDiaryEntries(uploadReadyEntries);

    return createdEntriesIds;
  }

  Future<void> _deleteRemoteDiaryEntries(List<LocalDiaryEntry> uploadReadyEntries) async {
    final entriesToDelete = uploadReadyEntries.where((entry) => entry.deletedEntry && entry.entryId != null).map((entry) => entry.entryId!).toList();
    if (entriesToDelete.isEmpty) {
      return;
    }
    await _collectionApiService
        .deleteDiaryEntries(ids: entriesToDelete)
        .then((_) async {
          _diaryEntryService.deleteDiaryEntries(
            uploadReadyEntries.where((entry) => entry.deletedEntry && entry.entryId != null).map((entry) => entry.localId).toList(),
          );
        })
        .catchError((error, stackTrace) {
          _loggingService.handle(error, stackTrace);
        });
  }

  Future<List<AddLocalDataResponse>> _createRemoteDiaryEntries(List<LocalDiaryEntry> uploadReadyEntries) async {
    final entriesToCreate = uploadReadyEntries
        .whereNot((entry) => entry.deletedEntry)
        .map((localDiaryEntry) => localDiaryEntry.addLocalDiaryEntryRequest)
        .toList();
    if (entriesToCreate.nonNulls.isEmpty) {
      return [];
    }
    final createdEntriesIds = await (_collectionApiService.createDiaryEntries(localDiaryEntries: entriesToCreate.nonNulls.toList()).catchError((
      error,
      stackTrace,
    ) {
      if (_isPartiallyInvalid(error)) {
        _loggingService.info('Conflict while calling diary bulk insert API. Response: ${error.response?.data}');
        final errorResponse = AddLocalDataErrorResponse.fromJson(error.response?.data);
        _markInvalidLocalDiaryEntries(pendingEntries: uploadReadyEntries, errors: errorResponse.errors ?? []);
        return _retryUploadValidDiaryEntries(errorResponse, uploadReadyEntries);
      } else {
        _loggingService.handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }
    }));
    return createdEntriesIds;
  }

  bool _isPartiallyInvalid(error) =>
      error is DioException && [HttpStatus.conflict, HttpStatus.badRequest, HttpStatus.notFound].contains(error.response?.statusCode);

  Future<void> _retryUploadValidFoods(BaseCollectionErrorResponse errorResponse, List<LocalFood> pendingFoods) async {
    final invalidFoods = Set<BaseCollectionError>.from(errorResponse.errors);
    final foodsToRetry = pendingFoods.where(
      (pendingFood) => !invalidFoods.any(
        (invalidFood) =>
            invalidFood is AddLocalDataApiError && invalidFood.error.localId == pendingFood.id ||
            invalidFood is CreateFoodApiError && invalidFood.error.localId == pendingFood.id,
      ),
    );
    if (foodsToRetry.isEmpty) {
      return;
    }

    _loggingService.info('Foods to retry: ${foodsToRetry.map((e) => '${e.name} ${e.nutrition.calories}cal per 100g')}');
    final retryRequestFoods = foodsToRetry.map((localFood) => localFood.addLocalFoodRequest).toList();

    final addedFoods = await (_collectionApiService.createFoods(localFoods: retryRequestFoods)
      ..catchError((error, stackTrace) {
        _loggingService.handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }));

    if (addedFoods.isEmpty) {
      return;
    }
    final foodsToUpdate = pendingFoods.where((pendingFood) => addedFoods.any((addedFood) => addedFood.localResourceId == pendingFood.id));
    for (final food in foodsToUpdate) {
      food.pushed = true;
      food.errorPushing = false;
      food.foodId = addedFoods.firstWhereOrNull((addedFood) => addedFood.localResourceId == food.id)?.resourceId;
    }

    await _foodService.upsertFoods(localFoods: foodsToUpdate.toList());
  }

  Future<List<AddLocalDataResponse>> _retryUploadValidDiaryEntries(
    AddLocalDataErrorResponse errorResponse,
    List<LocalDiaryEntry> pendingEntries,
  ) async {
    final invalidEntries = Set<AddLocalDataError>.from(errorResponse.errors ?? <AddLocalDataError>[]);
    final entriesToRetry = pendingEntries.where(
      (pendingEntry) => !invalidEntries.any((invalidEntry) => invalidEntry.localId == pendingEntry.localId),
    );
    final retryRequestEntries = entriesToRetry.map((localDiaryEntry) => localDiaryEntry.addLocalDiaryEntryRequest).toList();
    if (retryRequestEntries.nonNulls.isEmpty) {
      return [];
    }

    final addedEntries = await (_collectionApiService.createDiaryEntries(localDiaryEntries: retryRequestEntries.nonNulls.toList())
      ..catchError((error, stackTrace) {
        _loggingService.handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }));
    return addedEntries;
  }

  Future<void> _markInvalidLocalFoods({required List<LocalFood> pendingFoods, required List<AddLocalDataError> errors}) async {
    if (errors.isEmpty) {
      return;
    }

    final errorFoodsSet = Set<AddLocalDataError>.from(errors);
    final foodsToUpdate = pendingFoods.where((pendingFood) => errorFoodsSet.any((error) => error.localId == pendingFood.id));
    for (final food in foodsToUpdate) {
      food.errorPushing = true;
    }
    await _foodService.upsertFoods(localFoods: foodsToUpdate.toList());

    final pendingDiaryEntries = await _diaryEntryService.getDiaryEntries(filterPending: true);
    final diaryEntriesWithFoodError = pendingDiaryEntries
        .where((entry) => foodsToUpdate.any((localFood) => entry.localFood.targetId == localFood.id))
        .toList();
    for (final entry in diaryEntriesWithFoodError) {
      entry.errorPushingEntry = true;
    }
    await _diaryEntryService.upsertDiaryEntries(localEntries: diaryEntriesWithFoodError);
  }

  Future<void> _markInvalidLocalDiaryEntries({required List<LocalDiaryEntry> pendingEntries, required List<AddLocalDataError> errors}) async {
    if (errors.isEmpty) {
      return;
    }

    final errorDiaryEntries = Set<AddLocalDataError>.from(errors);
    final entriesToUpdate = pendingEntries.where((pendingEntry) => errorDiaryEntries.any((error) => error.localId == pendingEntry.localId));
    for (final entry in entriesToUpdate) {
      entry.errorPushingEntry = true;
    }

    await _diaryEntryService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }

  Future<void> _fetchRemoteDiary({required User user, DateTime? date}) async {
    try {
      // TODO: check if it makes sense to have a repository handling date format and fetch from API
      final day = (date ?? DateTime.now());
      final formattedDay = _dateFormattingService.format(dateTime: day.toString(), format: collectionApiDateFormat);
      final diary = await _collectionApiService.getDiaryEntries(username: user.username, date: formattedDay);
      await _pullCollectionLocally(collectionDiary: diary, diaryDate: date ?? DateTime.now(), userId: user.username);
    } catch (error, stackTrace) {
      _loggingService.handle(error, stackTrace);
    }
  }

  Future<void> _pullCollectionLocally({
    required List<MealEntriesResponse> collectionDiary,
    required DateTime diaryDate,
    required String userId,
  }) async {
    var remoteDiary = collectionDiary.map((mealEntriesResponse) => mealEntriesResponse.mealEntriesList).toList();

    await _upsertLocalDiary(remoteDiary, userId);
    await _deleteMissingPushedLocalDiaryEntries(remoteDiary, diaryDate);
  }

  Future<void> _upsertLocalDiary(List<MealEntriesList> remoteDiary, String userId) async {
    var mappedEntries = <LocalDiaryEntry>[];
    var foodsToUpsert = <LocalFood>[];

    for (final remoteMealEntriesList in remoteDiary) {
      for (final entry in remoteMealEntriesList.diaryEntries) {
        final foodId = entry.food.id;
        if (foodId == null) {
          _loggingService.info('Pulling food with null id $entry');
          continue;
        }
        foodsToUpsert.add(entry.food.localFood);
      }
    }

    final existingLocalFoodsMatchingPulled = await _foodService.findLocalFoodsByRemoteIds(ids: foodsToUpsert.map((e) => e.foodId!).toList());
    final mappedToUpsertFoods = foodsToUpsert.map((food) {
      return food..id = existingLocalFoodsMatchingPulled.firstWhereOrNull((local) => local.foodId == food.foodId)?.id ?? 0;
    }).toList();
    await _foodService.upsertFoods(localFoods: mappedToUpsertFoods);
    final updatedLocalFoods = await _foodService.findLocalFoodsByRemoteIds(ids: foodsToUpsert.map((e) => e.foodId!).toList());

    for (final remoteMealEntriesList in remoteDiary) {
      for (final entry in remoteMealEntriesList.diaryEntries) {
        final localEntry = await _diaryEntryService.getDiaryEntry(collectionId: entry.collectionId);
        final localFoodId = updatedLocalFoods.firstWhereOrNull((element) => element.foodId == entry.food.id)?.id;
        if (localFoodId == null) {
          _loggingService.info('Missing local food, skipping diary entry $entry');
          continue;
        }
        mappedEntries.add(
          LocalDiaryEntry.withParams(
            entryId: entry.collectionId,
            localId: localEntry?.localId ?? 0,
            pushedEntry: true,
            servingQuantity: entry.servingQuantity,
            unitId: entry.unitId,
            entryDate: _dateFormattingService.parse(formattedDate: entry.date, format: collectionApiDateFormat),
            localFoodId: localFoodId,
            username: userId,
            deletedEntry: false,
            errorPushingEntry: false,
          )..meal = remoteMealEntriesList.meal,
        );
      }
    }
    if (mappedEntries.isNotEmpty) {
      await _diaryEntryService.upsertDiaryEntries(localEntries: mappedEntries);
    }
  }

  Future<void> _deleteMissingPushedLocalDiaryEntries(List<MealEntriesList> remoteDiary, DateTime diaryDate) async {
    final pushedLocalEntries = await _diaryEntryService.getDiaryEntries(filterPushed: true, excludeDeleted: true);
    final remoteEntries = remoteDiary.expand((mealEntriesList) => mealEntriesList.diaryEntries).toList();
    var discardedDiaryEntriesIds = <int>[];

    for (final localEntry in pushedLocalEntries) {
      if (localEntry.entryDate.day == diaryDate.day &&
          localEntry.entryDate.month == diaryDate.month &&
          localEntry.entryDate.year == diaryDate.year &&
          remoteEntries.none((entry) => entry.collectionId == localEntry.entryId)) {
        // Local diary entry found for the same date that was fetched from remote
        // And no remote entry matches the id
        discardedDiaryEntriesIds.add(localEntry.localId);
      }
    }
    if (discardedDiaryEntriesIds.isNotEmpty) {
      _diaryEntryService.deleteDiaryEntries(discardedDiaryEntriesIds);
    }
  }
}
