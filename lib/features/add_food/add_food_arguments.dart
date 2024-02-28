import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';

class AddFoodArguments {
  final Meal? meal;
  final Food food;
  final int? localId;
  final double? servingSize;

  const AddFoodArguments({
    required this.meal,
    required this.food,
    this.localId,
    this.servingSize,
  });
}
