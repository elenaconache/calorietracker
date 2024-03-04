import 'dart:async';
import 'dart:io';

import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/add_food/food_log.dart';
import 'package:calorietracker/models/collection/add_diary_entry_request.dart';
import 'package:calorietracker/models/collection/create_food_errors_response.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/database/diary_entry_service.dart';
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
    final username = locator<UserService>().selectedUser.value?.username;
    if (username?.isEmpty ?? true) {
      locator<LoggingService>().info('Could not log food. Missing username.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      if (foodLog.localFoodId != null) {
        await _saveDiaryEntryLocally(foodLog, username);
      } else {
        await _saveRemotely(username!, foodLog);
      }
    }
  }

  Future<void> _saveDiaryEntryLocally(FoodLog foodLog, String? username) async {
    final diaryEntriesService = await locator.getAsync<DiaryEntryService>();
    final foodService = await locator.getAsync<FoodService>();
    final localFoodId = foodLog.localFoodId ?? await foodService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      locator<LoggingService>().info('Could not save local diary entry. Missing local food id.');
      isLoading.value = false;
      throw Exception('Could not save local diary entry with missing local food id.');
    } else {
      final localDiaryFood = foodLog.food.localFood..id = localFoodId;
      await diaryEntriesService
          .upsertDiaryEntry(localDiaryEntry: _getLocalDiaryEntry(localDiaryFood, foodLog, username))
          .then((_) async {
        unawaited(locator<DiaryService>().fetchDiary(date: foodLog.date));
      }).catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        isLoading.value = false;
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

  Future<void> _saveRemotely(String userId, FoodLog foodLog) async {
    int? remoteFoodId;
    int? localFoodId;
    if (foodLog.food.id == null) {
      final createdFoodId = await (createFood(food: foodLog.food).then((createdFood) {
        unawaited(_saveFoodLocally(foodLog, userId));
        return createdFood;
      }).catchError((error, stackTrace) async {
        if (error is DioException && error.isConnectionError) {
          localFoodId = await _saveFoodLocally(foodLog, userId);
        } else {
          locator<LoggingService>().handle(error, stackTrace);
          isLoading.value = false;
          throw error;
        }
        return null;
      }));
      remoteFoodId = createdFoodId;
    } else {
      remoteFoodId = foodLog.food.id;
    }
    await _createDiaryEntry(remoteFoodId, userId, foodLog, localFoodId);
  }

  Future<int?> createFood({required Food food}) async {
    if(!isLoading.value){
      isLoading.value = true;
    }
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    return collectionApiService.createFood(body: food.addFoodRequest).then((createdFood) => createdFood?.id)
    .catchError((error, stackTrace) {
      if(error is DioException && error.response?.statusCode == HttpStatus.conflict){
        final errorsResponse = CreateFoodErrorsResponse.fromJson(error.response?.data);
        return errorsResponse.errors.firstOrNull?.resource.id;
      }else{
        locator<LoggingService>().handle(error, stackTrace);
        return null;
      }
    });
  }

  Future<void> _createDiaryEntry(int? remoteFoodId, String userId, FoodLog foodLog, int? localFoodId) async {
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
    final foodService = await locator.getAsync<FoodService>();
    final localFoodId = await foodService.upsertFood(localFood: foodLog.food.localFood);
    if (localFoodId == null) {
      locator<LoggingService>().info('Could not save food locally: ${foodLog.food}');
      isLoading.value = false;
      throw Exception('Could not save food locally. Food: ${foodLog.food}.');
    }
    return localFoodId;
  }
}
