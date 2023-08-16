import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/create_food/food_error.dart';
import 'package:calorietracker/features/create_food/food_input.dart';
import 'package:calorietracker/models/collection/add_food_request.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/validators/nutrition_validator.dart';
import 'package:flutter/cupertino.dart';

class CreateFoodController {
  final ValueNotifier<FoodError?> foodError = ValueNotifier(null);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool validateNutrition({required FoodInput foodInput}) {
    foodError.value = locator<NutritionValidator>().validateNutrition(nutritionInput: foodInput);
    return foodError.value == null;
  }

  void hideError() => foodError.value = null;

  Future<String?> createFood({required FoodInput foodInput}) async {
    isLoading.value = true;
    final createdFood = await locator<CollectionApiService>()
        .createFood(
            body: AddFoodRequest(
      barcode: null,
      name: foodInput.name,
      brand: foodInput.brand,
      nutritionInfo: Nutrition.fromServing(
        nutritionPerServing: foodInput.nutrition,
        servingSizeGrams: foodInput.servingSizeValue,
      ).round(),
    ))
        .catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
    isLoading.value = false;
    return createdFood?.id;
  }
}
