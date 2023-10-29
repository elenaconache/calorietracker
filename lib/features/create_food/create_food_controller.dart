import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/create_food/food_error.dart';
import 'package:calorietracker/features/create_food/food_input.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/database_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/validators/nutrition_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CreateFoodController {
  final ValueNotifier<FoodError?> foodError = ValueNotifier(null);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool validateNutrition({required FoodInput foodInput}) {
    foodError.value = locator<NutritionValidator>().validateNutrition(nutritionInput: foodInput);
    return foodError.value == null;
  }

  void hideError() => foodError.value = null;

  Future<({int? localId, String? createdFoodId})> createFood({required FoodInput foodInput}) async {
    isLoading.value = true;
    int? localId;
    final createdFood =
        await locator<CollectionApiService>().createFood(body: foodInput.addFoodRequest).then((created) async {
      final dbService = await locator.getAsync<DatabaseService>();
      unawaited(dbService.upsertFood(localFood: foodInput.localFood));
      return created;
    }).catchError((error, stackTrace) async {
      if (error is DioException) {
        if (error.isConnectionError) {
          final dbService = await locator.getAsync<DatabaseService>();
          localId = await dbService.upsertFood(localFood: foodInput.localFood);
          return null;
        }
      }
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
    isLoading.value = false;
    return (localId: localId, createdFoodId: createdFood?.id);
  }
}
