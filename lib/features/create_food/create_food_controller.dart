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

  Future<({bool isLocal, String? createdFoodId})> createFood({required FoodInput foodInput}) async {
    isLoading.value = true;
    var isLocal = false;
    final createdFood = await locator<CollectionApiService>().createFood(body: foodInput.addFoodRequest).catchError((error, stackTrace) async {
      if (error is DioException) {
        if (error.isConnectionError) {
          final dbService = await locator.getAsync<DatabaseService>();
          await dbService.insertFood(localFood: foodInput.localFood);
          isLocal = true;
          return null;
          // TODO: return id from local db to use; send flag to next screen so that it does not attempt to log until food is created
        }
      }
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
    isLoading.value = false;
    return (isLocal: isLocal, createdFoodId: createdFood?.id);
  }
}
