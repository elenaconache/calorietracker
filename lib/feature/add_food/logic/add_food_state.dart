part of 'add_food_cubit.dart';

@freezed
abstract class AddFoodState with _$AddFoodState {
  const factory AddFoodState({
    Meal? selectedMeal,
    double? servingSize,
    required Nutrition nutrition,
    required AsyncState addFoodResult,
  }) = _AddFoodState;
}
