part of 'recipe_details_cubit.dart';

@freezed
abstract class RecipeDetailsState with _$RecipeDetailsState {
  const factory RecipeDetailsState({
    required AsyncState<Nutrition> nutrition,
    required AsyncState<List<RecipeIngredient>> ingredients,
  }) = _RecipeDetailsState;
}
