part of 'recipe_details_cubit.dart';

@freezed
abstract class RecipeDetailsState with _$RecipeDetailsState {
  const factory RecipeDetailsState({
    required AsyncState<Nutrition> nutrition,
    required AsyncState<List<LocalIngredient>> ingredients,
    required AsyncState<List<LocalFood>> ingredientsFoods,
  }) = _RecipeDetailsState;
}
