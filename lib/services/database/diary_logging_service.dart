import 'dart:async';

import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/add_food/food_log.dart';
import 'package:calorietracker/models/collection/add_diary_entry_request.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/meal_entries_list.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/diary_entry_service.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DiaryLoggingService {
  final ValueNotifier<Map<Meal, bool>> mealsLoading = ValueNotifier({});

  Future<bool> copyFromYesterday({Meal? meal}) async {
    _updateLoadingState(meal, true);

    final diaryService = locator<DiaryService>();
    final selectedDay = DateTime.tryParse(diaryService.selectedDay.value);
    if (selectedDay == null) {
      locator<LoggingService>().info('Could not copy meal or day. Selected diary day was null.');
      _updateLoadingState(meal, false);
      return false;
    } else {
      final yesterdayEntries = await diaryService.fetchDiaryEntries(
        date: selectedDay.subtract(const Duration(days: 1)),
        meal: meal,
      );
      if (yesterdayEntries.isEmpty) {
        _updateLoadingState(meal, false);
        return false;
      } else {
        _updateLoadingState(meal, false);
        return copyDiaryEntries(mealsEntries: yesterdayEntries, toDate: selectedDay);
      }
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

  Future<void> createDiaryEntry(int? remoteFoodId, String userId, FoodLog foodLog, int? localFoodId) async {
    if (remoteFoodId != null) {
      final collectionApiService = await locator.getAsync<CollectionApiService>();
      await collectionApiService
          .createDiaryEntry(
        body: AddDiaryEntryRequest(
          entryDate: locator<DateFormattingService>().format(
            dateTime: foodLog.date.toString(),
            format: collectionApiDateFormat,
          ),
          userId: userId,
          foodUnitId: gramsUnitId,
          meal: foodLog.meal,
          foodId: remoteFoodId,
          servingQuantity: foodLog.servingQuantity,
        ),
      )
          .then((_) {
        unawaited(locator<DiaryService>().fetchDiary());
      }).catchError((error, stackTrace) async {
        if (error is DioException && error.isConnectionError) {
          await saveDiaryEntryLocally(foodLog, userId);
        } else {
          locator<LoggingService>().handle(error, stackTrace);
          throw error;
        }
      });
    } else {
      await saveDiaryEntryLocally(foodLog.copyWith(localFoodId: localFoodId), userId);
    }
  }

  Future<void> saveDiaryEntryLocally(FoodLog foodLog, String? username) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final foodService = await locator.getAsync<FoodService>();
    final localFoodId = foodLog.localFoodId ?? await foodService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      locator<LoggingService>().info('Could not save local diary entry. Missing local food id.');
      throw Exception('Could not save local diary entry with missing local food id.');
    } else {
      final localDiaryFood = foodLog.food.localFood..id = localFoodId;
      await diaryEntriesService
          .upsertDiaryEntry(localDiaryEntry: _getLocalDiaryEntry(localDiaryFood, foodLog, username))
          .then((_) async {
        unawaited(locator<DiaryService>().fetchDiary(date: foodLog.date));
      }).catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        throw error;
      });
    }
  }

  LocalDiaryEntry _getLocalDiaryEntry(LocalFood localDiaryFood, FoodLog foodLog, String? userId) => LocalDiaryEntry()
    ..localFood.value = localDiaryFood
    ..entryDate = foodLog.date
    ..servingQuantity = foodLog.servingQuantity
    ..meal = foodLog.meal
    ..unitId = gramsUnitId
    ..username = userId!;

  // TODO: call API to copy from date to date, given meal or the whole day, if online
  Future<bool> copyDiaryEntries({
    required List<MealEntriesList> mealsEntries,
    required DateTime toDate,
  }) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final username = locator<UserService>().selectedUser.value?.username;
    if (username == null) {
      return false;
    } else {
      final entriesToCopy = mealsEntries.expand((mealEntries) => mealEntries.diaryEntries).toList();
      final entries = await diaryEntriesService.getDiaryEntriesByIds(entries: entriesToCopy);

      await diaryEntriesService.upsertDiaryEntries(
          pushFoods: true,
          localEntries: entries.map((entry) {
            final copiedEntry = LocalDiaryEntry()
              ..entryDate = toDate
              ..username = entry.username
              ..unitId = entry.unitId
              ..servingQuantity = entry.servingQuantity
              ..meal = entry.meal
              ..localFood.value = entry.localFood.value;
            return copiedEntry;
          }).toList());
      await locator<DiaryService>().fetchDiary(date: toDate);
      return true;
    }
  }
}
