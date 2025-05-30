import 'package:calorietracker/shared/data/model/food.dart';

class RecipeIngredient {
  final Food food;
  final double servingQuantity;

  const RecipeIngredient({required this.food, required this.servingQuantity});

  @override
  String toString() {
    return '${food.name} $servingQuantity';
  }
}
