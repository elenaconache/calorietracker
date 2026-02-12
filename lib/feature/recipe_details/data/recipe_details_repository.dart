import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeDetailsRepository {
  final CollectionApiService _apiService;

  RecipeDetailsRepository(this._apiService);

  Future<List<RecipeIngredient>> getRecipeIngredients({required int recipeId}) async {
    final ingredients = await _apiService.getRecipeIngredients(recipeId: recipeId);
    return ingredients
        .map((apiIngredient) => RecipeIngredient(
              food: Food.collection(food: apiIngredient.food),
              servingQuantity: apiIngredient.quantity * apiIngredient.unit.weightInGrams,
            ))
        .toList();
  }
}
