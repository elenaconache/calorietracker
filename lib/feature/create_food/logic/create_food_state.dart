part of 'create_food_cubit.dart';

@freezed
class CreateFoodState with _$CreateFoodState {
  const factory CreateFoodState({
     FoodError? validationError,
     required AsyncState<CreatedFood> createdFood,
  }) = _CreateFoodState;
}
