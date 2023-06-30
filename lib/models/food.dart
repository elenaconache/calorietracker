import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_food_response.dart';

class Food {
  final String name;
  final Nutrition nutrition;
  final String? brandName;

  const Food({
    required this.name,
    required this.nutrition,
    required this.brandName,
  });

  Food.nutritionix({required NutritionixFoodResponse nutritionixFoodResponse})
      : name = nutritionixFoodResponse.name,
        nutrition = nutritionixFoodResponse.nutritionPer100Grams,
        brandName = nutritionixFoodResponse.brandName;
}
