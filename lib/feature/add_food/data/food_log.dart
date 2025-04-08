import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';

class FoodLog {
  final Meal meal;
  final Food food;
  final double servingQuantity;
  final int? localFoodId;
  final DateTime date;

  const FoodLog({
    required this.meal,
    required this.food,
    required this.servingQuantity,
    required this.localFoodId,
    required this.date,
  });

  FoodLog copyWith({
    Meal? meal,
    Food? food,
    double? servingQuantity,
    int? localFoodId,
    DateTime? date,
  }) =>
      FoodLog(
        meal: meal ?? this.meal,
        food: food ?? this.food,
        servingQuantity: servingQuantity ?? this.servingQuantity,
        localFoodId: localFoodId ?? this.localFoodId,
        date: date ?? this.date,
      );
}
