import 'dart:async';
import 'dart:io';
import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_error.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_error_response.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_response.dart';
import 'package:calorietracker/shared/data/model/collection/meal_entries_response.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
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

  DataSyncService(this._diaryEntryService, this._collectionApiService, this._loggingService, this._foodService,
      {required DateFormattingService dateFormattingService, required AuthRepository authRepository})
      : _authRepository = authRepository,
        _dateFormattingService = dateFormattingService;

  Future<void> uploadLocalData({DateTime? selectedDay}) async {
    if (isUploadInProgress) {
      return;
    }
    isUploadInProgress = true;
    _loggingService.info('Local data upload started: ${DateTime.now()}');
    final pendingFoods = await _foodService.getFoodsPendingUpload();
    final addedFoods = await _uploadFoods(pendingFoods: pendingFoods);
    await _markPushedLocalFoods(pendingFoods: pendingFoods, addedFoods: addedFoods);

    final pendingEntries = await _diaryEntryService.getDiaryEntries(filterPending: true);
    await _updateLocalDiaryFoods(pendingEntries: pendingEntries, addedFoods: addedFoods);
    final uploadReadyEntries = await _diaryEntryService.getDiaryEntries(filterUploadReady: true);
    final uploadedEntriesIds = await _pushDiary(uploadReadyEntries: uploadReadyEntries);
    await _markPushedLocalDiary(addedEntries: uploadedEntriesIds, pendingEntries: uploadReadyEntries);

    final user = _authRepository.selectedUser;
    if (user != null) {
      await _fetchRemoteDiary(user: user, date: selectedDay);
    } else {
      _loggingService.info('Could not pull remote diary, user was null');
    }

    _loggingService.info('Local data upload done: ${DateTime.now()}');
    isUploadInProgress = false;
  }

  Future<void> _markPushedLocalFoods({
    required List<LocalFood> pendingFoods,
    required List<AddLocalDataResponse> addedFoods,
  }) async {
    if (addedFoods.isEmpty) {
      return;
    }

    final addedFoodsSet = Set<AddLocalDataResponse>.from(addedFoods);
    final foodsToUpdate = pendingFoods.where(
      (pendingFood) => addedFoodsSet.any((addedFood) => addedFood.localResourceId == pendingFood.id),
    );
    for (final food in foodsToUpdate) {
      food.pushed = true;
      food.errorPushing = false;
      food.foodId = addedFoodsSet.firstWhereOrNull((addedFood) => addedFood.localResourceId == food.id)?.resourceId;
    }

    await _foodService.upsertFoods(localFoods: foodsToUpdate.toList());
  }

  Future<void> _markPushedLocalDiary({
    required List<LocalDiaryEntry> pendingEntries,
    required List<AddLocalDataResponse> addedEntries,
  }) async {
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

  Future<void> _updateLocalDiaryFoods({
    required List<LocalDiaryEntry> pendingEntries,
    required List<AddLocalDataResponse> addedFoods,
  }) async {
    if (pendingEntries.isEmpty) {
      return;
    }

    final addedFoodsSet = Set<AddLocalDataResponse>.from(addedFoods);
    final entriesToUpdate = pendingEntries.where((entry) => addedFoodsSet.any(
          (food) => food.localResourceId == entry.localFood.targetId,
        ));
    for (final entry in entriesToUpdate) {
      entry.localFood.target?.foodId = addedFoodsSet
          .firstWhereOrNull(
            (food) => food.localResourceId == entry.localFood.targetId,
          )
          ?.resourceId;
    }

    await _diaryEntryService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }

  Future<List<AddLocalDataResponse>> _uploadFoods({required List<LocalFood> pendingFoods}) async {
    if (pendingFoods.isEmpty) {
      return [];
    }

    final requestFoods = pendingFoods.map((localFood) => localFood.addLocalFoodRequest).toList();
    final addedFoods = await (_collectionApiService.createFoods(localFoods: requestFoods).catchError((error, stackTrace) async {
      if (_isPartiallyInvalid(error)) {
        _loggingService.info('Invalid food error while calling foods bulk insert API.'
            ' Response: ${error.response?.data}');
        final errorResponse = AddLocalDataErrorResponse.fromJson(error.response?.data);
        _markInvalidLocalFoods(pendingFoods: pendingFoods, errors: errorResponse.errors ?? []);
        return _retryUploadValidFoods(errorResponse, pendingFoods);
      } else {
        _loggingService.handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }
    }));
    return addedFoods;
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
    unawaited(_collectionApiService.deleteDiaryEntries(ids: entriesToDelete).then((_) async {
      _diaryEntryService.deleteDiaryEntries(
        uploadReadyEntries.where((entry) => entry.deletedEntry && entry.entryId != null).map((entry) => entry.localId).toList(),
      );
    }).catchError((error, stackTrace) {
      _loggingService.handle(error, stackTrace);
    }));
  }

  Future<List<AddLocalDataResponse>> _createRemoteDiaryEntries(List<LocalDiaryEntry> uploadReadyEntries) async {
    final entriesToCreate =
        uploadReadyEntries.whereNot((entry) => entry.deletedEntry).map((localDiaryEntry) => localDiaryEntry.addLocalDiaryEntryRequest).toList();
    if (entriesToCreate.isEmpty) {
      return [];
    }
    final createdEntriesIds = await (_collectionApiService.createDiaryEntries(localDiaryEntries: entriesToCreate).catchError((error, stackTrace) {
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

  Future<List<AddLocalDataResponse>> _retryUploadValidFoods(
    AddLocalDataErrorResponse errorResponse,
    List<LocalFood> pendingFoods,
  ) async {
    final invalidFoods = Set<AddLocalDataError>.from(errorResponse.errors ?? <AddLocalDataError>[]);
    final foodsToRetry = pendingFoods.where(
      (pendingFood) => !invalidFoods.any((invalidFood) => invalidFood.localId == pendingFood.id),
    );
    if (foodsToRetry.isEmpty) {
      return [];
    }
    final retryRequestFoods = foodsToRetry.map((localFood) => localFood.addLocalFoodRequest).toList();

    final addedFoods = await (_collectionApiService.createFoods(localFoods: retryRequestFoods)
      ..catchError((error, stackTrace) {
        _loggingService.handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }));
    return addedFoods;
  }

  Future<List<AddLocalDataResponse>> _retryUploadValidDiaryEntries(
    AddLocalDataErrorResponse errorResponse,
    List<LocalDiaryEntry> pendingEntries,
  ) async {
    final invalidEntries = Set<AddLocalDataError>.from(errorResponse.errors ?? <AddLocalDataError>[]);
    final entriesToRetry = pendingEntries.where(
      (pendingEntry) => !invalidEntries.any((invalidEntry) => invalidEntry.localId == pendingEntry.localId),
    );
    if (entriesToRetry.isEmpty) {
      return [];
    }
    final retryRequestEntries = entriesToRetry.map((localDiaryEntry) => localDiaryEntry.addLocalDiaryEntryRequest).toList();

    final addedEntries = await (_collectionApiService.createDiaryEntries(localDiaryEntries: retryRequestEntries)
      ..catchError((error, stackTrace) {
        _loggingService.handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }));
    return addedEntries;
  }

  Future<void> _markInvalidLocalFoods({
    required List<LocalFood> pendingFoods,
    required List<AddLocalDataError> errors,
  }) async {
    if (errors.isEmpty) {
      return;
    }

    final errorFoodsSet = Set<AddLocalDataError>.from(errors);
    final foodsToUpdate = pendingFoods.where(
      (pendingFood) => errorFoodsSet.any((error) => error.localId == pendingFood.id),
    );
    for (final food in foodsToUpdate) {
      food.errorPushing = true;
    }

    final pendingDiaryEntries = await _diaryEntryService.getDiaryEntries(filterPending: true);
    final diaryEntriesWithFoodError = pendingDiaryEntries
        .where(
          (entry) => foodsToUpdate.any((localFood) => entry.localFood.targetId == localFood.id),
        )
        .toList();
    for (final entry in diaryEntriesWithFoodError) {
      entry.errorPushingEntry = true;
    }
    await _diaryEntryService.upsertDiaryEntries(localEntries: diaryEntriesWithFoodError);
    await _foodService.upsertFoods(localFoods: foodsToUpdate.toList());
  }

  Future<void> _markInvalidLocalDiaryEntries({
    required List<LocalDiaryEntry> pendingEntries,
    required List<AddLocalDataError> errors,
  }) async {
    if (errors.isEmpty) {
      return;
    }

    final errorDiaryEntries = Set<AddLocalDataError>.from(errors);
    final entriesToUpdate = pendingEntries.where(
      (pendingEntry) => errorDiaryEntries.any((error) => error.localId == pendingEntry.localId),
    );
    for (final entry in entriesToUpdate) {
      entry.errorPushingEntry = true;
    }

    await _diaryEntryService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }

  Future<void> _fetchRemoteDiary({required User user, DateTime? date}) async {
    try {
      // TODO: check if it makes sense to have a repository handling date format and fetch from API
      final day = (date ?? DateTime.now()).toString();
      final diary = await _collectionApiService.getDiaryEntries(username: user.username, date: day);
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
    final localDisplayDiary = await _diaryEntryService.getDisplayDiaryEntries(
      date: diaryDate.toString(),
      filterPending: true,
    );

    await (_upsertLocalDiary(remoteDiary, userId));
    await (_deleteMissingPushedLocalDiaryEntries(remoteDiary, diaryDate));

    var result = <MealEntriesList>[];
    for (final meal in Meal.values) {
      final remoteDiaryEntries =
          remoteDiary.where((list) => list.meal == meal).map((element) => element.diaryEntries).expand((element) => element).toList();
      final localDiaryEntries =
          localDisplayDiary.where((list) => list.meal == meal).map((element) => element.diaryEntries).expand((element) => element).toList();
      result.add(MealEntriesList(
        meal: meal,
        diaryEntries: [
          ...remoteDiaryEntries,
          ...localDiaryEntries,
        ],
      ));
    }
  }

  Future<void> _upsertLocalDiary(List<MealEntriesList> remoteDiary, String userId) async {
    final pushedLocalEntries = await _diaryEntryService.getDiaryEntries(filterPushed: true);
    var mappedEntries = <LocalDiaryEntry>[];
    for (final remoteMealEntriesList in remoteDiary) {
      for (final entry in remoteMealEntriesList.diaryEntries) {
        if (!pushedLocalEntries.any((localEntry) => localEntry.entryId == entry.collectionId)) {
          mappedEntries.add(LocalDiaryEntry.withParams(
            entryId: entry.collectionId,
            pushedEntry: true,
            servingQuantity: entry.servingQuantity,
            unitId: entry.unitId,
            entryDate: _dateFormattingService.parse(
              formattedDate: entry.date,
              format: collectionApiDateFormat,
            ),
            localFoodId: entry.food.localFood.id,
            username: userId,
            deletedEntry: false,
            errorPushingEntry: false,
          )..meal = remoteMealEntriesList.meal);
        }
      }
    }
    if (mappedEntries.isNotEmpty) {
      _diaryEntryService.upsertDiaryEntries(localEntries: mappedEntries, pushFoods: true);
    }
  }

  Future<void> _deleteMissingPushedLocalDiaryEntries(List<MealEntriesList> remoteDiary, DateTime diaryDate) async {
    final pushedLocalEntries = await _diaryEntryService.getDiaryEntries(filterPushed: true, excludeDeleted: true);
    final remoteEntries = remoteDiary.expand((mealEntriesList) => mealEntriesList.diaryEntries).toList();
    var discardedDiaryEntriesIds = <int>[];

    for (final localEntry in pushedLocalEntries) {
      if (localEntry.entryDate == diaryDate && remoteEntries.none((remoteEntry) => localEntry.entryId == remoteEntry.collectionId)) {
        discardedDiaryEntriesIds.add(localEntry.localId);
      }
    }
    if (discardedDiaryEntriesIds.isNotEmpty) {
      _diaryEntryService.deleteDiaryEntries(discardedDiaryEntriesIds);
    }
  }
}
