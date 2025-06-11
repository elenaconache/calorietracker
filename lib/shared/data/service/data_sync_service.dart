import 'dart:async';
import 'dart:io';
import 'package:calorietracker/shared/data/model/collection/add_local_data_error.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_error_response.dart';
import 'package:calorietracker/shared/data/model/collection/add_local_data_response.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/service/database/diary_entry_service.dart';
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

  DataSyncService(this._diaryEntryService, this._collectionApiService, this._loggingService, this._foodService);

  Future<void> uploadLocalData() async {
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

    _loggingService.info('Local data upload done: ${DateTime.now()}');

    // unawaited(getIt<DiaryService>().fetchDiary());// TODO: db stream should trigger updates from diary bloc
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
      await _diaryEntryService.deleteDiaryEntries(
          localEntries: uploadReadyEntries.where((entry) => entry.deletedEntry && entry.entryId != null).map((entry) => entry.localId).toList());
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
}
