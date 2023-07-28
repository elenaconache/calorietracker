import 'dart:async';

import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/add_diary_entry_with_food_request.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/storage_service.dart';
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

  int get calories => currentServingSizeNutrients.value?.calories?.toInt() ?? 0;

  double get carbsInGrams => currentServingSizeNutrients.value?.carbohydrates ?? 0;

  double get fatInGrams => currentServingSizeNutrients.value?.fat ?? 0;

  double get proteinInGrams => currentServingSizeNutrients.value?.protein ?? 0;

  int get carbsPercentage => _nutrition.carbsPercentage;

  int get fatPercentage => _nutrition.fatPercentage;

  int get proteinPercentage => _nutrition.proteinPercentage;

  void recalculateNutrition({required String servingSizeGrams}) {
    final serving = int.tryParse(servingSizeGrams) ?? 100;
    currentServingSizeNutrients.value = Nutrition.perServing(nutritionPer100Grams: _nutrition, servingSizeGrams: serving);
  }

  // TODO: if the user is logging a food from the collection tab, call the API to log diary entry without adding a food and pass the food id
  // TODO: handle logging a food for a different date, not just for today
  Future<void> logFood(
      {required Meal meal, required Food food, required int servingQuantity, String? barcode, required VoidCallback onSuccess}) async {
    isLoading.value = true;
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    final userId = await locator<StorageService>().get(key: selectedUserIdKey);
    if (userId?.isEmpty ?? true) {
      locator<LoggingService>().info('Could not log food. Missing user id.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      await collectionApiService
          .createDiaryEntryWithFood(
              body: AddDiaryEntryWithFoodRequest(
        entryDate: DateTime.now().toIso8601String(),
        userId: userId!,
        unitId: gramsUnitId,
        meal: meal,
        name: food.name,
        nutritionInfo: food.nutrition.round(),
        brand: food.brandName,
        servingQuantity: servingQuantity,
        barcode: barcode,
      ))
          .then((_) {
        unawaited(locator<DiaryService>().fetchDiary());
        onSuccess();
      }).catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        isLoading.value = false;
      });
    }
  }
}
