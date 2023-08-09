import 'package:calorietracker/features/create_food/food_error.dart';
import 'package:calorietracker/features/create_food/food_input.dart';

const _acceptableMacrosCaloriesOffset = 20;

class NutritionValidator {
  FoodError? validateNutrition({required FoodInput nutritionInput}) {
    if (!_macrosMatchCalories(nutritionInput).match) {
      return MacrosNotMatchingCaloriesError(_macrosMatchCalories(nutritionInput).expectedCalories);
    } else if (!_macrosMatchServingSize(nutritionInput).match) {
      return MacrosNotMatchingServingSizeError(_macrosMatchServingSize(nutritionInput).expectedServingSize);
    } else if (nutritionInput.nutrition.sugar > nutritionInput.nutrition.netCarbs) {
      return SugarsExceedNetCarbsError();
    } else if (!_hasValidFats(nutritionInput).match) {
      return FatsSumExceedsTotalFat(_hasValidFats(nutritionInput).expectedFat);
    } else if (nutritionInput.nutrition.cholesterol > nutritionInput.nutrition.fat * 1000) {
      return CholesterolExceedsTotalFat();
    }
    return null;
  }

  ({int expectedCalories, bool match}) _macrosMatchCalories(FoodInput nutritionInput) {
    final userSubmittedNutrition = nutritionInput.nutrition;
    final expectedCalories = userSubmittedNutrition.expectedCalories.toInt();
    final difference = (expectedCalories - userSubmittedNutrition.calories).abs();
    return (expectedCalories: expectedCalories, match: difference <= _acceptableMacrosCaloriesOffset);
  }

  ({int expectedFat, bool match}) _hasValidFats(FoodInput nutritionInput) {
    final nutrition = nutritionInput.nutrition;
    final totalFats = nutrition.fatSaturated + nutrition.fatTrans + nutrition.fatMonounsaturated + nutrition.fatPolyunsaturated;
    return (expectedFat: totalFats.toInt(), match: totalFats <= nutrition.fat);
  }

  ({int expectedServingSize, bool match}) _macrosMatchServingSize(FoodInput nutritionInput) {
    final userSubmittedNutrition = nutritionInput.nutrition;
    final expectedServingSize = userSubmittedNutrition.fat + userSubmittedNutrition.carbohydrates + userSubmittedNutrition.protein;
    final difference = nutritionInput.servingSizeValue - expectedServingSize;
    return (expectedServingSize: expectedServingSize.toInt(), match: difference >= 0);
  }
}
