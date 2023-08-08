import 'package:calorietracker/features/create_food/food_error.dart';
import 'package:calorietracker/features/create_food/food_input.dart';
import 'package:flutter/cupertino.dart';

const _acceptableMacrosCaloriesOffset = 20;

class CreateFoodController {
  final ValueNotifier<FoodErrorType?> foodError = ValueNotifier(null);
  int expectedCalories = 0;

  bool validateNutrition({required FoodInput nutritionInput}) {
    final userSubmittedNutrition = nutritionInput.nutrition;
    expectedCalories = userSubmittedNutrition.expectedCalories.toInt();
    final difference = (expectedCalories - (int.tryParse(nutritionInput.calories ?? '') ?? 0)).abs();

    if (difference > _acceptableMacrosCaloriesOffset) {
      foodError.value = FoodErrorType.macrosSumNotMatchingCalories;
    } else {
      foodError.value = null;
    }
    return foodError.value == null;
  }

  void hideError() => foodError.value = null;
}
