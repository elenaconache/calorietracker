import 'package:calorietracker/shared/data/model/recipe.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchRecipeRepository {
  final CollectionApiService _apiService;

  SearchRecipeRepository(this._apiService);

  Future<List<Recipe>> fetchRecipes() async {
    final collectionRecipes = await _apiService.getRecipes();
    return collectionRecipes.map((collectionRecipe) => Recipe.collection(recipe: collectionRecipe)).toList();
  }
}
