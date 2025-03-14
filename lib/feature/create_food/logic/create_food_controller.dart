import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:calorietracker/feature/create_food/data/food_error.dart';
import 'package:calorietracker/feature/create_food/ui/food_input.dart';
import 'package:calorietracker/shared/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/service/database/food_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/validators/nutrition_validator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateFoodController {
  final ValueNotifier<FoodError?> foodError = ValueNotifier(null);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool validateNutrition({required FoodInput foodInput}) {
    foodError.value = getIt<NutritionValidator>().validateNutrition(nutritionInput: foodInput);
    return foodError.value == null;
  }

  void hideError() => foodError.value = null;

  Future<({int? localId, int? createdFoodId})> createFood({required FoodInput foodInput}) async {
    isLoading.value = true;
    int? localId;
    final createdFood = await getIt<CollectionApiService>().createFood(body: foodInput.addFoodRequest).then((created) async {
      final foodService =  getIt.get<FoodService>();
      unawaited(foodService.upsertFood(localFood: foodInput.localFood));
      return created;
    }).catchError((error, stackTrace) async {
      if (error is DioException) {
        if (error.isConnectionError) {
          final foodService =  getIt.get<FoodService>();
          localId = await foodService.upsertFood(localFood: foodInput.localFood);
          return null;
        }
      }
      getIt<LoggingService>().handle(error, stackTrace);
      return null;
    });
    isLoading.value = false;
    return (localId: localId, createdFoodId: createdFood?.id);
  }
}
