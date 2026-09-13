part of 'create_recipe_cubit.dart';

@freezed
abstract class CreateRecipeState with _$CreateRecipeState {
  const factory CreateRecipeState({
    required List<LocalIngredient> ingredients,
    required Nutrition nutrition,
    required AsyncState createRecipeStatus,
  }) = _CreateRecipeState;
}
