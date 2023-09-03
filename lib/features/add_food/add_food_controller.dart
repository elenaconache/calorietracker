import 'dart:async';

import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/models/collection/add_diary_entry_with_food_request.dart';
import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/food.dart';
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
    currentServingSizeNutrients.value = Nutrition.perServing(nutritionPer100Grams: _nutrition, servingSizeGrams: serving);
  }

  // TODO: if the user is logging a food from the collection tab, call the API to log diary entry without adding a food and pass the food id
  // TODO: handle logging a food for a different date, not just for today
  Future<void> logFood({
    required Meal meal,
    required Food food,
    required int servingQuantity,
    String? barcode,
    required int? localId,
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    isLoading.value = true;
    final userId = locator<UserService>().selectedUser.value?.id;
    if (userId?.isEmpty ?? true) {
      locator<LoggingService>().info('Could not log food. Missing user id.');
      // TODO: navigate to login screen and show a snack bar saying the session expired
    } else {
      if (localId != null) {
        await _saveDiaryEntryLocally(localId, food, servingQuantity, meal, userId, onSuccess, onError);
      } else {
        await _saveRemotely(userId, meal, food, servingQuantity, onSuccess, onError);
      }
    }
  }

  Future<void> _saveDiaryEntryLocally(
      int localId, Food food, int servingQuantity, Meal meal, String? userId, VoidCallback onSuccess, VoidCallback onError) async {
    final dbService = await locator.getAsync<DatabaseService>();
    unawaited(dbService
        .insertDiaryEntry(
            localDiaryEntry: LocalDiaryEntry()
              ..food = (LocalDiaryFood()
                ..foodId = localId.toString()
                ..name = food.name
                ..barcode = food.barcode
                ..brand = food.brandName
                ..nutritionInfo = food.nutrition.localNutrition)
              ..entryDate = DateTime.now().toIso8601String()
              ..servingQuantity = servingQuantity
              ..meal = meal
              ..unitId = gramsUnitId
              ..userId = userId!
              ..deleted = false
              ..pushed = false)
        .then((value) {
      onSuccess();
    }) // TODO: add synchronously into current data in diary service before calling onSuccess
        .catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      onError();
    }));
  }

  Future<void> _saveRemotely(
    String? userId,
    Meal meal,
    Food food,
    int servingQuantity,
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    await collectionApiService
        .createDiaryEntryWithFood(
            body: AddDiaryEntryWithFoodRequest(
      entryDate: DateTime.now().toIso8601String(),
      userId: userId!,
      unitId: gramsUnitId,
      meal: meal,
      food: CollectionFood(
        name: food.name,
        nutritionInfo: food.nutrition.round(),
        brand: food.brandName,
        barcode: null,
      ),
      servingQuantity: servingQuantity,
    ))
        .then((_) {
      unawaited(locator<DiaryService>().fetchDiary());
      onSuccess();
    }).catchError((error, stackTrace) async {
      if (error is DioException) {
        if (error.isConnectionError) {
          /* final dbService = await locator.getAsync<DatabaseService>();
          // TODO: if food id is null, then first insert food, followed by an insert of a diary entry
         dbService.insertDiaryEntry(localDiaryEntry: LocalDiaryEntry()
            ..food = (LocalDiaryFood()
              ..foodId = localId.toString()
              ..name = food.name
              ..barcode = food.barcode
              ..brand = food.brandName
              ..nutritionInfo = food.nutrition.localNutrition
            )..entryDate = DateTime.now().toIso8601String()
            ..servingQuantity = servingQuantity
            ..meal = meal
            ..unitId = gramsUnitId
            ..userId = userId!
          );

          final dbService = await locator.getAsync<DatabaseService>();
          localId = await dbService.insertFood(localFood: foodInput.localFood);
          // isLocal = true;
          return null;*/
        }
      }
      //TODO: insert locally the diary entry with food id
      locator<LoggingService>().handle(error, stackTrace);
      isLoading.value = false;
    });
  }
}
