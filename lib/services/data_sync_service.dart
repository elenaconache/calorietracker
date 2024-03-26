import 'dart:async';
import 'dart:io';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/add_local_data_error.dart';
import 'package:calorietracker/models/collection/add_local_data_error_response.dart';
import 'package:calorietracker/models/collection/add_local_data_response.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/database/diary_entry_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

class DataSyncService {
  bool isUploadInProgress = false;

  Future<void> uploadLocalData() async {
    if (isUploadInProgress) {
      return;
    }
    isUploadInProgress = true;
    locator<LoggingService>().info('Local data upload started: ${DateTime.now()}');
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final foodService = await locator.getAsync<FoodService>();
    final pendingFoods = await foodService.getFoods(filterPending: true);
    final addedFoods = await _uploadFoods(pendingFoods: pendingFoods);
    await _markPushedLocalFoods(pendingFoods: pendingFoods, addedFoods: addedFoods);

    final pendingEntries = await diaryEntriesService.getDiaryEntries(filterPending: true);
    await _updateLocalDiaryFoods(pendingEntries: pendingEntries, addedFoods: addedFoods);
    final uploadReadyEntries = await diaryEntriesService.getDiaryEntries(filterUploadReady: true);
    final uploadedEntriesIds = await _pushDiary(uploadReadyEntries: uploadReadyEntries);
    await _markPushedLocalDiary(addedEntries: uploadedEntriesIds, pendingEntries: uploadReadyEntries);

    locator<LoggingService>().info('Local data upload done: ${DateTime.now()}');

    unawaited(locator<DiaryService>().fetchDiary());
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

    final foodService = await locator.getAsync<FoodService>();
    await foodService.upsertFoods(localFoods: foodsToUpdate.toList());
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
      (pendingDiaryEntry) =>
          addedEntriesSet.any((addedEntry) => addedEntry.localResourceId == pendingDiaryEntry.localId),
    );
    for (final diaryEntry in entriesToUpdate) {
      diaryEntry.pushedEntry = true;
      diaryEntry.errorPushingEntry = false;
      diaryEntry.entryId = addedEntriesSet
          .firstWhereOrNull((addedEntry) => addedEntry.localResourceId == diaryEntry.localId)
          ?.resourceId;
    }

    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    await diaryEntriesService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
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
          (food) => food.localResourceId == entry.localFood.value?.id,
        ));
    for (final entry in entriesToUpdate) {
      entry.localFood.value?.foodId = addedFoodsSet
          .firstWhereOrNull(
            (food) => food.localResourceId == entry.localFood.value?.id,
          )
          ?.resourceId;
    }

    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    await diaryEntriesService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }

  Future<List<AddLocalDataResponse>> _uploadFoods({required List<LocalFood> pendingFoods}) async {
    if (pendingFoods.isEmpty) {
      return [];
    }

    final requestFoods = pendingFoods.map((localFood) => localFood.addLocalFoodRequest).toList();
    final apiService = await locator.getAsync<CollectionApiService>();
    final addedFoods = await (apiService.createFoods(localFoods: requestFoods).catchError((error, stackTrace) async {
      if (_isPartiallyInvalid(error)) {
        locator<LoggingService>().info('Invalid food error while calling foods bulk insert API.'
            ' Response: ${error.response?.data}');
        final errorResponse = AddLocalDataErrorResponse.fromJson(error.response?.data);
        _markInvalidLocalFoods(pendingFoods: pendingFoods, errors: errorResponse.errors ?? []);
        return _retryUploadValidFoods(errorResponse, pendingFoods);
      } else {
        locator<LoggingService>().handle(error, stackTrace);
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
    final apiService = await locator.getAsync<CollectionApiService>();
    final entriesToDelete = uploadReadyEntries
        .where((entry) => entry.deletedEntry && entry.entryId != null)
        .map((entry) => entry.entryId!)
        .toList();
    if (entriesToDelete.isEmpty) {
      return;
    }
    unawaited(apiService.deleteDiaryEntries(ids: entriesToDelete).then((_) async {
      final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
      await diaryEntriesService.deleteDiaryEntries(
          localEntries: uploadReadyEntries
              .where((entry) => entry.deletedEntry && entry.entryId != null)
              .map((entry) => entry.localId)
              .toList());
    }).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    }));
  }

  Future<List<AddLocalDataResponse>> _createRemoteDiaryEntries(List<LocalDiaryEntry> uploadReadyEntries) async {
    final apiService = await locator.getAsync<CollectionApiService>();
    final entriesToCreate = uploadReadyEntries
        .whereNot((entry) => entry.deletedEntry)
        .map((localDiaryEntry) => localDiaryEntry.addLocalDiaryEntryRequest)
        .toList();
    if (entriesToCreate.isEmpty) {
      return [];
    }
    final createdEntriesIds =
        await (apiService.createDiaryEntries(localDiaryEntries: entriesToCreate).catchError((error, stackTrace) {
      if (_isPartiallyInvalid(error)) {
        locator<LoggingService>()
            .info('Conflict while calling diary bulk insert API. Response: ${error.response?.data}');
        final errorResponse = AddLocalDataErrorResponse.fromJson(error.response?.data);
        _markInvalidLocalDiaryEntries(pendingEntries: uploadReadyEntries, errors: errorResponse.errors ?? []);
        return _retryUploadValidDiaryEntries(errorResponse, uploadReadyEntries);
      } else {
        locator<LoggingService>().handle(error, stackTrace);
        return <AddLocalDataResponse>[];
      }
    }));
    return createdEntriesIds;
  }

  bool _isPartiallyInvalid(error) =>
      error is DioException &&
      [HttpStatus.conflict, HttpStatus.badRequest, HttpStatus.notFound].contains(error.response?.statusCode);

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

    final apiService = await locator.getAsync<CollectionApiService>();
    final addedFoods = await (apiService.createFoods(localFoods: retryRequestFoods)
      ..catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
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
    final retryRequestEntries =
        entriesToRetry.map((localDiaryEntry) => localDiaryEntry.addLocalDiaryEntryRequest).toList();

    final apiService = await locator.getAsync<CollectionApiService>();
    final addedEntries = await (apiService.createDiaryEntries(localDiaryEntries: retryRequestEntries)
      ..catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
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

    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final pendingDiaryEntries = await diaryEntriesService.getDiaryEntries(filterPending: true);
    final diaryEntriesWithFoodError = pendingDiaryEntries
        .where(
          (entry) => foodsToUpdate.any((localFood) => entry.localFood.value?.id == localFood.id),
        )
        .toList();
    for (final entry in diaryEntriesWithFoodError) {
      entry.errorPushingEntry = true;
    }
    await diaryEntriesService.upsertDiaryEntries(localEntries: diaryEntriesWithFoodError);
    final foodService = await locator.getAsync<FoodService>();
    await foodService.upsertFoods(localFoods: foodsToUpdate.toList());
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

    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    await diaryEntriesService.upsertDiaryEntries(localEntries: entriesToUpdate.toList());
  }
}
