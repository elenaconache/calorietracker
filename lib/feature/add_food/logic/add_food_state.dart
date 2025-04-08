part of 'add_food_cubit.dart';

@freezed
class AddFoodState with _$AddFoodState {
  const factory AddFoodState({
    Meal? selectedMeal,
    required bool isLoading,
    double? servingSize,
    required Nutrition nutrition,
  }) = _AddFoodState;
}
