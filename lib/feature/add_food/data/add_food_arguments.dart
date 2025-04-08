import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';

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
