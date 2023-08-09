import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/create_food/food_error.dart';
import 'package:calorietracker/features/create_food/food_input.dart';
import 'package:calorietracker/validators/nutrition_validator.dart';
import 'package:flutter/cupertino.dart';

class CreateFoodController {
  final ValueNotifier<FoodError?> foodError = ValueNotifier(null);

  bool validateNutrition({required FoodInput nutritionInput}) {
    foodError.value = locator<NutritionValidator>().validateNutrition(nutritionInput: nutritionInput);
    return foodError.value == null;
  }

  void hideError() => foodError.value = null;
}
