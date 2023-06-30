import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';

class AddFoodArguments {
  final Meal meal;
  final Food food;

  const AddFoodArguments({required this.meal, required this.food});
}
