import 'dart:async';

import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/model/collection/add_diary_entry_request.dart';
import 'package:calorietracker/shared/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/model/local/local_food.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/model/meal_entries_list.dart';
import 'package:calorietracker/shared/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/service/database/diary_entry_service.dart';
import 'package:calorietracker/shared/service/database/food_service.dart';
import 'package:calorietracker/shared/service/date_formatting_service.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/shared/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DiaryLoggingService {
  final ValueNotifier<Map<Meal, bool>> mealsLoading = ValueNotifier({});

  Future<bool> copyDiary({Meal? meal, DateTime? fromDate, DateTime? toDate}) async {
    _updateLoadingState(meal, true);
    final DateTime copiedDate;
    final diaryService = locator<DiaryService>();
    final selectedDay = diaryService.selectedDayDateTime;
    if (selectedDay == null) {
      locator<LoggingService>().info('Could not copy meal or day. Selected diary day was null.');
      _updateLoadingState(meal, false);
      return false;
    }
    copiedDate = fromDate ?? selectedDay;
    final dateEntries = await diaryService.fetchDiaryEntries(
      date: copiedDate,
      meal: meal,
    );
    if (dateEntries.isEmpty) {
      _updateLoadingState(meal, false);
      return false;
    } else {
      final dateToCopyTo = toDate ?? selectedDay;
      final result = await copyDiaryEntries(mealsEntries: dateEntries, toDate: dateToCopyTo);
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

  Future<void> createDiaryEntry({
    int? remoteFoodId,
    required String username,
    required FoodLog foodLog,
    int? localFoodId,
  }) async {
    if (remoteFoodId != null) {
      final collectionApiService = await locator.getAsync<CollectionApiService>();
      await collectionApiService
          .createDiaryEntry(
        body: AddDiaryEntryRequest(
          entryDate: locator<DateFormattingService>().format(
            dateTime: foodLog.date.toString(),
            format: collectionApiDateFormat,
          ),
          userId: username,
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
          await saveDiaryEntryLocally(foodLog, username);
        } else {
          locator<LoggingService>().handle(error, stackTrace);
          throw error;
        }
      });
    } else {
      await saveDiaryEntryLocally(foodLog.copyWith(localFoodId: localFoodId), username);
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

  LocalDiaryEntry _getLocalDiaryEntry(LocalFood localDiaryFood, FoodLog foodLog, String? userId) => LocalDiaryEntry.withParams(
    localFoodId:  localDiaryFood.id,
    entryDate : foodLog.date,
    servingQuantity: foodLog.servingQuantity,
    unitId : gramsUnitId,
    username : userId!,
  )..meal = foodLog.meal;

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
            final copiedEntry = LocalDiaryEntry.withParams(
              entryDate : toDate,
              username : entry.username,
              unitId : entry.unitId,
              servingQuantity : entry.servingQuantity,
              localFoodId: entry.localFood.targetId,
            )..meal = entry.meal;
            return copiedEntry;
          }).toList());
      await locator<DiaryService>().fetchDiary(date: toDate);
      return true;
    }
  }
}
