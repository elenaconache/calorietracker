import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';

class AddFoodArguments {
  final Meal? meal;
  final Food food;
  final int? localFoodId;
  final double? servingSize;
  final int? diaryEntryId;
  final int? localDiaryEntryId;

  const AddFoodArguments({
    required this.meal,
    required this.food,
    this.localFoodId,
    this.servingSize,
    this.diaryEntryId,
    this.localDiaryEntryId,
  });
}
