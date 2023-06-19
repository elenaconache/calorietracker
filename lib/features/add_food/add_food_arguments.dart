import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_food_response.dart';

class AddFoodArguments {
  final Meal meal;
  final NutritionixFoodResponse food;

  const AddFoodArguments({required this.meal, required this.food});
}
