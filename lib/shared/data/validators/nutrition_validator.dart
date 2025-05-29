import 'package:calorietracker/feature/create_food/domain/food_error.dart';
import 'package:calorietracker/feature/create_food/ui/food_input.dart';
import 'package:injectable/injectable.dart';

const _acceptableMacrosCaloriesOffset = 20;
const _maxCholesterolPer100Grams = 10000;
const _maxIronPer100Grams = 20;
const _maxPotassiumPer100Grams = 900;
const _maxCalciumPer100Grams = 500;
const _maxVitaminAPer100Grams = 14000;
const _maxVitaminCPer100Grams = 5000;
const _maxVitaminDPer100Grams = 21000;

@injectable
class NutritionValidator {
  FoodError? validateNutrition({required FoodInput nutritionInput}) {
    if (!_macrosMatchCalories(nutritionInput).match) {
      return MacrosNotMatchingCaloriesError(_macrosMatchCalories(nutritionInput).expectedCalories);
    } else if (!_macrosMatchServingSize(nutritionInput).match) {
      return MacrosNotMatchingServingSizeError(_macrosMatchServingSize(nutritionInput).expectedServingSize);
    } else if (nutritionInput.nutrition.sugar > nutritionInput.nutrition.netCarbs) {
      return SugarsExceedNetCarbsError();
    } else if (!_hasValidFats(nutritionInput).match) {
      return FatsSumExceedsTotalFatError(_hasValidFats(nutritionInput).expectedFat);
    } else if (nutritionInput.nutrition.cholesterol > nutritionInput.nutrition.fat * 1000) {
      return CholesterolExceedsTotalFatError();
    } else if (nutritionInput.nutrition.cholesterol > _getMaxCholesterol(nutritionInput)) {
      return CholesterolExceedsMaxPerServingError(_getMaxCholesterol(nutritionInput).toInt());
    } else if (nutritionInput.nutrition.insolubleFiber > nutritionInput.nutrition.fiber) {
      return InsolubleFiberExceedsFiberError();
    } else if (nutritionInput.saltValue > nutritionInput.servingSizeValue) {
      return SaltExceedsServingSizeError();
    } else if (nutritionInput.nutrition.iron > _getMaxIron(nutritionInput)) {
      return IronExceedsMaxIronPerServingError(_getMaxIron(nutritionInput).toInt());
    } else if (nutritionInput.nutrition.potassium > _getMaxPotassium(nutritionInput)) {
      return PotassiumExceedsMaxPotassiumPerServingError(_getMaxPotassium(nutritionInput).toInt());
    } else if (nutritionInput.nutrition.calcium > _getMaxCalcium(nutritionInput)) {
      return CalciumExceedsMaxCalciumPerServingError(_getMaxCalcium(nutritionInput).toInt());
    } else if (nutritionInput.nutrition.vitaminA > _getMaxVitaminA(nutritionInput)) {
      return VitaminAExceedsMaxPerServingError(_getMaxVitaminA(nutritionInput).toInt());
    } else if (nutritionInput.nutrition.vitaminC > _getMaxVitaminC(nutritionInput)) {
      return VitaminCExceedsMaxPerServingError(_getMaxVitaminC(nutritionInput).toInt());
    } else if (nutritionInput.nutrition.vitaminD > _getMaxVitaminD(nutritionInput)) {
      return VitaminDExceedsMaxPerServingError(_getMaxVitaminD(nutritionInput).toInt());
    }
    return null;
  }

  double _getMaxCholesterol(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxCholesterolPer100Grams;

  double _getMaxIron(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxIronPer100Grams;

  double _getMaxPotassium(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxPotassiumPer100Grams;

  double _getMaxCalcium(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxCalciumPer100Grams;

  double _getMaxVitaminA(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxVitaminAPer100Grams;

  double _getMaxVitaminC(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxVitaminCPer100Grams;

  double _getMaxVitaminD(FoodInput nutritionInput) => nutritionInput.servingSizeValue / 100 * _maxVitaminDPer100Grams;

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
