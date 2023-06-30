import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:flutter/cupertino.dart';

class AddFoodController {
  final ValueNotifier<Meal?> selectedMeal = ValueNotifier(null);
  late final ValueNotifier<Nutrition?> currentServingSizeNutrients;
  late final Nutrition _nutrition;

  void selectMeal({required Meal? meal}) => selectedMeal.value = meal;

  void initializeNutrients({required Nutrition nutrition}) {
    _nutrition = nutrition;
    currentServingSizeNutrients = ValueNotifier(nutrition);
  }

  int get calories => currentServingSizeNutrients.value?.calories?.toInt() ?? 0;

  double get carbsInGrams => currentServingSizeNutrients.value?.carbohydrates ?? 0;

  double get fatInGrams => currentServingSizeNutrients.value?.fat ?? 0;

  double get proteinInGrams => currentServingSizeNutrients.value?.protein ?? 0;

  int get carbsPercentage => ((_nutrition.carbohydrates ?? 0) * 4 / (_nutrition.calories ?? 0) * 100).toInt();

  int get fatPercentage => ((_nutrition.fat ?? 0) * 9 / (_nutrition.calories ?? 0) * 100).toInt();

  int get proteinPercentage => ((_nutrition.protein ?? 0) * 4 / (_nutrition.calories ?? 0) * 100).toInt();

  void recalculateNutrition({required String servingSizeGrams}) {
    final serving = int.tryParse(servingSizeGrams) ?? 100;
    currentServingSizeNutrients.value = Nutrition.perServing(nutritionPer100Grams: _nutrition, servingSizeGrams: serving);
  }
}
