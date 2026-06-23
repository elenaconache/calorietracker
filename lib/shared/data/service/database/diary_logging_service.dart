import 'dart:async';

import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/meal_entries_list.dart';
import 'package:calorietracker/shared/data/service/database/diary_entry_service.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/service/date_formatting_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DiaryLoggingService {
  final ValueNotifier<Map<Meal, bool>> mealsLoading = ValueNotifier({});
  final AuthRepository _authRepository;

  DiaryLoggingService(this._authRepository);

  Future<bool> copyDiary({Meal? meal, DateTime? fromDate, DateTime? toDate, required DateTime selectedDay}) async {
    _updateLoadingState(meal, true);
    final copiedDate = fromDate ?? selectedDay;
    final diaryEntriesService = getIt.get<DiaryEntryService>();
    final dayDiary = await diaryEntriesService.getDisplayDiaryEntries(
      date: getIt<DateFormattingService>().format(dateTime: copiedDate.toString(), format: collectionApiDateFormat),
    );
    final mealDiary = dayDiary.where((mealEntriesList) => mealEntriesList.meal == meal).toList();

    if (mealDiary.isEmpty) {
      _updateLoadingState(meal, false);
      return false;
    } else {
      final dateToCopyTo = toDate ?? selectedDay;
      final result = await copyDiaryEntries(mealsEntries: mealDiary, toDate: dateToCopyTo);
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

  // Future<void> saveDiaryEntry({
  //   int? remoteFoodId,
  //   required String username,
  //   required FoodLog foodLog,
  //   int? localFoodId,
  // }) async {
  //   if (remoteFoodId != null) {
  //     final collectionApiService = await getIt.getAsync<CollectionApiService>();
  //     await collectionApiService
  //         .createDiaryEntry(
  //       body: AddDiaryEntryRequest(
  //         entryDate: getIt<DateFormattingService>().format(
  //           dateTime: foodLog.date.toString(),
  //           format: collectionApiDateFormat,
  //         ),
  //         userId: username,
  //         foodUnitId: collectionGramsUnitId,
  //         meal: foodLog.meal,
  //         foodId: remoteFoodId,
  //         servingQuantity: foodLog.servingQuantity,
  //       ),
  //     )
  //         .catchError((error, stackTrace) async {
  //       if (error is DioException && error.isConnectionError) {
  //         await saveDiaryEntryLocally(foodLog, username);
  //         return IdResponse(id: 0);
  //       } else {
  //         getIt<LoggingService>().handle(error, stackTrace);
  //         throw error;
  //       }
  //     });
  //   } else {
  //     await saveDiaryEntryLocally(foodLog.copyWith(localFoodId: localFoodId), username);
  //   }
  // }

  Future<void> saveDiaryEntryLocally(FoodLog foodLog, String? username) async {
    final diaryEntriesService = getIt.get<DiaryEntryService>();
    final foodService = getIt.get<FoodService>();
    final localFoodId = foodLog.localFoodId ?? await foodService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      getIt<LoggingService>().info('Could not save local diary entry. Missing local food id.');
      throw Exception('Could not save local diary entry with missing local food id.');
    } else {
      final localDiaryFood = (foodLog.food.localFood..id = localFoodId);
      await diaryEntriesService
          .upsertDiaryEntry(localDiaryEntry: _getLocalDiaryEntry(localDiaryFood, foodLog, username))
          .catchError((error, stackTrace) {
        getIt<LoggingService>().handle(error, stackTrace);
        throw error;
      });
    }
  }

  Future<void> markDeletedDiaryEntryLocally({required int localId}) async {
    final diaryEntryService = getIt.get<DiaryEntryService>();
    var localDiaryEntry = await diaryEntryService.getDiaryEntry(localDiaryEntryId: localId);
    if (localDiaryEntry != null) {
      localDiaryEntry.deletedEntry = true;
      await diaryEntryService.upsertDiaryEntry(localDiaryEntry: localDiaryEntry);
    }
  }

  Future<void> updateDiaryEntryLocally({required int localId, required FoodLog foodLog, String? username}) async {
    await markDeletedDiaryEntryLocally(localId: localId);
    await saveDiaryEntryLocally(foodLog, username);
  }

  Future<void> deleteDiaryEntries({required List<DiaryEntry> entries}) async {
    final diaryEntryService = getIt.get<DiaryEntryService>();
    var localEntries = await diaryEntryService.getDiaryEntriesByIds(entries: entries);
    var pushed = localEntries.where((element) => element.pushedEntry).toList();

    var pending = localEntries.whereNot((element) => element.pushedEntry).toList();

    for (var entry in pushed) {
      if (entry.pushedEntry) {
        entry.deletedEntry = true;
      }
    }

    getIt<LoggingService>().info('deleting entries $entries, by local ids ${localEntries.map((e) => e.localId)}');

    await diaryEntryService.upsertDiaryEntries(localEntries: pushed);

    diaryEntryService.deleteDiaryEntries( pending.map((e) => e.localId).toList());
  }

  LocalDiaryEntry _getLocalDiaryEntry(LocalFood localDiaryFood, FoodLog foodLog, String? userId) => LocalDiaryEntry.withParams(
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
    final diaryEntriesService = getIt.get<DiaryEntryService>();
    final username = _authRepository.selectedUser?.username;
    if (username == null) {
      return false;
    } else {
      final entriesToCopy = mealsEntries.expand((mealEntries) => mealEntries.diaryEntries).toList();
      final entries = await diaryEntriesService.getDiaryEntriesByIds(entries: entriesToCopy);

      await diaryEntriesService.upsertDiaryEntries(
          pushFoods: false,
          localEntries: entries.map((entry) {
            final copiedEntry = LocalDiaryEntry.withParams(
              entryDate: toDate,
              username: entry.username,
              unitId: entry.unitId,
              servingQuantity: entry.servingQuantity,
              localFoodId: entry.localFood.targetId,
            )..meal = entry.meal;
            return copiedEntry;
          }).toList());
      return true;
    }
  }
}
