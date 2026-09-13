import 'dart:async';

import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/service/database/diary_entry_repository.dart';
import 'package:calorietracker/shared/data/service/database/food_repository.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/meal_entries_list.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/extension/local_diary_entry_list_extension.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DiaryLoggingService {
  final ValueNotifier<Map<Meal, bool>> mealsLoading = ValueNotifier({});
  final AuthRepository _authRepository;
  final DiaryEntryRepository _diaryEntryRepository;
  final FoodRepository _foodRepository;

  DiaryLoggingService(
    this._authRepository,
    this._diaryEntryRepository,
    this._foodRepository,
  );

  Future<bool> copyDiary({
    Meal? meal,
    DateTime? fromDate,
    DateTime? toDate,
    required DateTime selectedDay,
  }) async {
    _updateLoadingState(meal, true);
    final copiedDate = fromDate ?? selectedDay;

    final username = _authRepository.selectedUser?.username;
    if (username == null) {
      return false;
    }

    final dayDiary = _diaryEntryRepository
        .getDisplayDiaryEntries(date: copiedDate, username: username)
        .mealEntriesList;
    final mealDiary = dayDiary
        .where((mealEntriesList) => mealEntriesList.meal == meal)
        .toList();

    if (mealDiary.isEmpty) {
      _updateLoadingState(meal, false);
      return false;
    } else {
      final dateToCopyTo = toDate ?? selectedDay;
      final result = await copyDiaryEntries(
        mealsEntries: mealDiary,
        toDate: dateToCopyTo,
      );
      _updateLoadingState(meal, false);
      return result;
    }
  }

  void _updateLoadingState(Meal? meal, bool loading) {
    final mealsLoadingState = Map.of(mealsLoading.value);
    if (meal != null) {
      mealsLoadingState[meal] = loading;
    } else {
      for (var element in Meal.values) {
        mealsLoadingState[element] = loading;
      }
    }
    mealsLoading.value = mealsLoadingState;
  }

  Future<void> saveDiaryEntryLocally(FoodLog foodLog, String? username) async {
    final localFoodId =
        foodLog.localFoodId ?? _foodRepository.upsert(foodLog.food.localFood);

    final localDiaryFood = (foodLog.food.localFood..id = localFoodId);

    _diaryEntryRepository.upsert(
      localDiaryEntry: _getLocalDiaryEntry(localDiaryFood, foodLog, username),
    );
  }

  void markDeletedDiaryEntryLocally({required int localId}) {
    var localDiaryEntry = _diaryEntryRepository.getSingle(
      localDiaryEntryId: localId,
    );
    if (localDiaryEntry != null) {
      localDiaryEntry.deletedEntry = true;
      _diaryEntryRepository.upsert(localDiaryEntry: localDiaryEntry);
    }
  }

  Future<void> updateDiaryEntryLocally({
    required int localId,
    required FoodLog foodLog,
    String? username,
  }) async {
    markDeletedDiaryEntryLocally(localId: localId);
    await saveDiaryEntryLocally(foodLog, username);
  }

  Future<void> deleteDiaryEntries({required List<DiaryEntry> entries}) async {
    var localEntries = _diaryEntryRepository.getListByIds(entries);
    var pushed = localEntries.where((element) => element.pushedEntry).toList();

    var pending = localEntries
        .whereNot((element) => element.pushedEntry)
        .toList();

    for (var entry in pushed) {
      if (entry.pushedEntry) {
        entry.deletedEntry = true;
      }
    }

    getIt<LoggingService>().info(
      'deleting entries $entries, by local ids ${localEntries.map((e) => e.localId)}',
    );

    _diaryEntryRepository.upsertList(localEntries: pushed);

    _diaryEntryRepository.deleteList(pending.map((e) => e.localId).toList());
  }

  LocalDiaryEntry _getLocalDiaryEntry(
    LocalFood localDiaryFood,
    FoodLog foodLog,
    String? userId,
  ) => LocalDiaryEntry.withParams(
    localFoodId: localDiaryFood.id,
    entryDate: foodLog.date,
    servingQuantity: foodLog.servingQuantity,
    unitId: collectionGramsUnitId,
    username: userId!,
  )..meal = foodLog.meal;

  Future<bool> copyDiaryEntries({
    required List<MealEntriesList> mealsEntries,
    required DateTime toDate,
  }) async {
    final username = _authRepository.selectedUser?.username;
    if (username == null) {
      return false;
    } else {
      final entriesToCopy = mealsEntries
          .expand((mealEntries) => mealEntries.diaryEntries)
          .toList();
      final entries = _diaryEntryRepository.getListByIds(entriesToCopy);

      _diaryEntryRepository.upsertList(
        localEntries: entries.map((entry) {
          final copiedEntry = LocalDiaryEntry.withParams(
            entryDate: toDate,
            username: entry.username,
            unitId: entry.unitId,
            servingQuantity: entry.servingQuantity,
            localFoodId: entry.localFood.targetId,
          )..meal = entry.meal;
          return copiedEntry;
        }).toList(),
      );
      return true;
    }
  }
}
