part of 'recipe_details_cubit.dart';

@freezed
class RecipeDetailsState with _$RecipeDetailsState {
  const factory RecipeDetailsState({
    required AsyncState<Nutrition> nutrition,
    required AsyncState<List<RecipeIngredient>> ingredients,
  }) = _RecipeDetailsState;
}
