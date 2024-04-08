import 'dart:async';
import 'dart:io';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/add_food/food_log.dart';
import 'package:calorietracker/models/collection/create_food_errors_response.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/diary_logging_service.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    final serving = double.tryParse(servingSizeGrams.replaceAll(',', '.')) ?? 100;
    currentServingSizeNutrients.value =
        Nutrition.perServing(nutritionPer100Grams: _nutrition, servingSizeGrams: serving);
  }

  Future<void> logFood({
    required FoodLog foodLog,
    int? remoteDiaryEntryId,
    int? localDiaryEntryId,
    Meal? initialMeal,
  }) async {
    isLoading.value = true;
    final username = locator<UserService>().selectedUser.value?.username;
    if (username?.isEmpty ?? true) {
      locator<LoggingService>().info('Could not log food. Missing username.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      final updatesExistingLog = [remoteDiaryEntryId, localDiaryEntryId].any((id) => id != null);
      showLoading();

      // TODO: API call to update entry; on error, call remove and create locally
      if (updatesExistingLog) {
        await locator<DiaryService>()
            .removeSingleDiaryEntry(meal: foodLog.meal, collectionId: remoteDiaryEntryId, localId: localDiaryEntryId);
      }

      if (foodLog.localFoodId != null) {
        await locator<DiaryLoggingService>().saveDiaryEntryLocally(foodLog, username);
      } else {
        await _saveRemotely(username!, foodLog);
      }
      hideLoading();
    }
  }

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
          hideLoading();
          throw error;
        }
        return null;
      }));
      remoteFoodId = createdFoodId;
    } else {
      remoteFoodId = foodLog.food.id;
    }
    await locator<DiaryLoggingService>().createDiaryEntry(
      remoteFoodId: remoteFoodId,
      username: userId,
      foodLog: foodLog,
      localFoodId: localFoodId,
    );
  }

  Future<int?> createFood({required Food food}) async {
    if (!isLoading.value) {
      isLoading.value = true;
    }
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    return collectionApiService
        .createFood(body: food.addFoodRequest)
        .then((createdFood) => createdFood?.id)
        .catchError((error, stackTrace) {
      if (error is DioException && error.response?.statusCode == HttpStatus.conflict) {
        final errorsResponse = CreateFoodErrorsResponse.fromJson(error.response?.data);
        return errorsResponse.errors.firstOrNull?.resource.id;
      } else {
        locator<LoggingService>().handle(error, stackTrace);
        return null;
      }
    });
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

  void showLoading() => isLoading.value = true;

  void hideLoading() => isLoading.value = false;
}
