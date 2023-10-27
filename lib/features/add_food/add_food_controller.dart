import 'dart:async';

import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/add_food/food_log.dart';
import 'package:calorietracker/models/collection/add_diary_entry_request.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/database_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calorietracker/services/date_formatting_service.dart';

class AddFoodController {
  final ValueNotifier<Meal?> selectedMeal = ValueNotifier(null);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  late final ValueNotifier<Nutrition?> currentServingSizeNutrients;
  late final Nutrition _nutrition;

  void selectMeal({required Meal? meal}) => selectedMeal.value = meal;

  void initializeNutrients({required Nutrition nutrition}) {
    _nutrition = nutrition;
    currentServingSizeNutrients = ValueNotifier(nutrition);
  }

  int get calories => currentServingSizeNutrients.value?.calories.toInt() ?? 0;

  double get carbsInGrams => currentServingSizeNutrients.value?.carbohydrates ?? 0;

  double get fatInGrams => currentServingSizeNutrients.value?.fat ?? 0;

  double get proteinInGrams => currentServingSizeNutrients.value?.protein ?? 0;

  int get carbsPercentage => _nutrition.carbsPercentage;

  int get fatPercentage => _nutrition.fatPercentage;

  int get proteinPercentage => _nutrition.proteinPercentage;

  void recalculateNutrition({required String servingSizeGrams}) {
    final serving = double.tryParse(servingSizeGrams) ?? 100;
    currentServingSizeNutrients.value =
        Nutrition.perServing(nutritionPer100Grams: _nutrition, servingSizeGrams: serving);
  }

  Future<void> logFood({required FoodLog foodLog}) async {
    isLoading.value = true;
    final userId = locator<UserService>().selectedUser.value?.id;
    if (userId?.isEmpty ?? true) {
      locator<LoggingService>().info('Could not log food. Missing user id.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      if (foodLog.localFoodId != null) {
        await _saveDiaryEntryLocally(foodLog, userId);
      } else {
        await _saveRemotely(userId!, foodLog);
      }
    }
  }

  Future<void> _saveDiaryEntryLocally(FoodLog foodLog, String? userId) async {
    final dbService = await locator.getAsync<DatabaseService>();
    final localFoodId = foodLog.localFoodId ?? await dbService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      locator<LoggingService>().info('Could not save local diary entry. Missing local food id.');
    } else {
      final localDiaryFood = foodLog.food.localDiaryFood..localId = localFoodId;
      await dbService
          .upsertDiaryEntry(localDiaryEntry: _getLocalDiaryEntry(localDiaryFood, foodLog, userId))
          .then((_) async {
        locator<DiaryService>().logDiaryEntrySync(
            date: foodLog.date,
            meal: foodLog.meal,
            food: foodLog.food,
            localId: foodLog.localFoodId,
            servingQuantity: foodLog.servingQuantity);
      }).catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        isLoading.value = false;
        throw error;
      });
    }
  }

  LocalDiaryEntry _getLocalDiaryEntry(LocalDiaryFood localDiaryFood, FoodLog foodLog, String? userId) =>
      LocalDiaryEntry()
        ..localFood = localDiaryFood
        ..entryDate = foodLog.date.toIso8601String()
        ..servingQuantity = foodLog.servingQuantity
        ..meal = foodLog.meal
        ..unitId = gramsUnitId
        ..userId = userId!;

  Future<void> _saveRemotely(String userId, FoodLog foodLog) async {
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    String? remoteFoodId;
    int? localFoodId;
    if (foodLog.food.id == null) {
      final createdFood = await (collectionApiService.createFood(body: foodLog.food.addFoodRequest)
        // TODO: save food locally on success as well for search in history but use unawaited
        ..catchError((error, stackTrace) async {
          if (error is DioException && error.isConnectionError) {
            localFoodId = await _saveFoodLocally(foodLog, userId);
          } else {
            locator<LoggingService>().handle(error, stackTrace);
            isLoading.value = false;
            throw error;
          }
          return null;
        }));
      remoteFoodId = createdFood?.id;
    } else {
      remoteFoodId = foodLog.food.id;
    }
    await _createDiaryEntry(remoteFoodId, userId, foodLog, localFoodId);
  }

  Future<void> _createDiaryEntry(String? remoteFoodId, String userId, FoodLog foodLog, int? localFoodId) async {
    if (remoteFoodId != null) {
      final collectionApiService = await locator.getAsync<CollectionApiService>();
      await collectionApiService
          .createDiaryEntry(
              body: AddDiaryEntryRequest(
        entryDate:
            locator<DateFormattingService>().format(dateTime: foodLog.date.toString(), format: collectionApiDateFormat),
        userId: userId,
        unitId: gramsUnitId,
        meal: foodLog.meal,
        foodId: remoteFoodId,
        servingQuantity: foodLog.servingQuantity,
      ))
          .then((_) {
        unawaited(locator<DiaryService>().fetchDiary());
      }).catchError((error, stackTrace) async {
        if (error is DioException && error.isConnectionError) {
          await _saveDiaryEntryLocally(foodLog, userId);
        } else {
          locator<LoggingService>().handle(error, stackTrace);
          isLoading.value = false;
          throw error;
        }
      });
    } else {
      await _saveDiaryEntryLocally(foodLog.copyWith(localFoodId: localFoodId), userId);
    }
  }

  Future<int?> _saveFoodLocally(FoodLog foodLog, String userId) async {
    final dbService = await locator.getAsync<DatabaseService>();
    final localFoodId = await dbService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      locator<LoggingService>().info('Could not save food locally: ${foodLog.food}');
      isLoading.value = false;
      throw Exception('Could not save food locally. Food: ${foodLog.food}.');
    }
    return localFoodId;
  }
}
