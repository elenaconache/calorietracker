import 'package:calorietracker/features/create_food/food_error.dart';
import 'package:calorietracker/features/create_food/nutrition_input.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:flutter/cupertino.dart';

const _acceptableMacrosCaloriesOffset = 20;

class CreateFoodController {
  final ValueNotifier<FoodErrorType?> foodError = ValueNotifier(null);
  int expectedCalories = 0;

  bool validateNutrition({required NutritionInput nutritionInput}) {
    // TODO: update with insoluble fiber too
    final carbsValue = double.tryParse(nutritionInput.carbs ?? '') ?? 0;
    final fiberValue = double.tryParse(nutritionInput.fiber ?? '') ?? 0;
    final double totalCarbsValue;
    if (carbsValue < fiberValue) {
      totalCarbsValue = carbsValue + fiberValue;
    } else {
      totalCarbsValue = carbsValue;
    }
    final nutrition = Nutrition(
      carbohydrates: totalCarbsValue,
      protein: double.tryParse(nutritionInput.protein ?? '') ?? 0,
      fat: double.tryParse(nutritionInput.fat ?? '') ?? 0,
      fiber: fiberValue,
    );
    expectedCalories = nutrition.expectedCalories.toInt();
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
