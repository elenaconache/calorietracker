part of 'search_recipe_cubit.dart';

@freezed
abstract class SearchRecipeState with _$SearchRecipeState {
  const factory SearchRecipeState({
    required AsyncState<List<Recipe>> allRecipes,
    required List<Recipe> searchResults,
  }) = _SearchRecipeState;
}
