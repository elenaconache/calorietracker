import 'package:calorietracker/features/create_food/food_input.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_food_response.dart';

class Food {
  final String name;
  final Nutrition nutrition;
  final String? brandName;
  final String? id;
  final String? barcode;

  const Food({
    required this.name,
    required this.nutrition,
    required this.brandName,
    required this.id,
    required this.barcode,
  });

  Food.nutritionix({required NutritionixFoodResponse nutritionixFoodResponse})
      : name = nutritionixFoodResponse.name,
        nutrition = nutritionixFoodResponse.nutritionPer100Grams,
        brandName = nutritionixFoodResponse.brandName,
        barcode = null,
        id = null;

  Food.input({required FoodInput foodInput, required this.id})
      : name = foodInput.name,
        nutrition = Nutrition.fromServing(
          nutritionPerServing: foodInput.nutrition,
          servingSizeGrams: foodInput.servingSizeValue,
        ),
        brandName = foodInput.brand,
        barcode = null;
}
