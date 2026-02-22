part of 'create_recipe_cubit.dart';

@freezed
class CreateRecipeState with _$CreateRecipeState {
  const factory CreateRecipeState({
    required List<RecipeIngredient> ingredients,
    required Nutrition nutrition,
    required AsyncState createRecipeStatus,
  }) = _CreateRecipeState;
}
