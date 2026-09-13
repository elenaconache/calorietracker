import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/local/local_ingredient.dart';
import 'package:calorietracker/shared/data/model/local/local_recipe.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/food_repository.dart';
import 'package:calorietracker/shared/data/service/database/ingredient_repository.dart';
import 'package:calorietracker/shared/data/service/database/recipe_repository.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeDetailsRepository {
  final CollectionApiService _apiService;
  final RecipeRepository _recipeRepository;
  final IngredientRepository _ingredientRepository;
  final FoodRepository _foodRepository;

  RecipeDetailsRepository(
    this._apiService,
    this._recipeRepository,
    this._ingredientRepository,
    this._foodRepository,
  );

  Future<List<RecipeIngredient>> getRecipeIngredients({
    int? remoteRecipeId,
    required int localRecipeId,
  }) async {
    final localRecipe = _recipeRepository.findRecipeByLocalId(
      localId: localRecipeId,
    );
    if (localRecipe == null) {
      throw Exception('Local recipe not found for local id $localRecipeId');
    }
    final List<LocalIngredient> localIngredients;
    if (remoteRecipeId != null) {
      final remoteIngredients = await _apiService.getRecipeIngredients(
        recipeId: remoteRecipeId,
      );
      final existingFoods = _foodRepository.findByRemoteIds(
        remoteIds: remoteIngredients.map((e) => e.food.id ?? 0).toList(),
      );
      final newIds = _foodRepository.upsertList(
        remoteIngredients
            .where(
              (ingredient) => existingFoods.none(
                (localFood) => localFood.foodId == ingredient.food.id,
              ),
            )
            .map((e) => Food.collection(food: e.food).localFood)
            .toList(),
      );
      final newFoods = _foodRepository.findByLocalIds(localIds: newIds);
      final mergedLocalFoods = [...existingFoods, ...newFoods];
      final existingIngredients = localRecipe.localIngredients.toList();

      // TODO: Call collection API for updating recipe here when available, to update ingredients with state pending push
      final localIngredientsIds = _ingredientRepository.upsertList(
        remoteIngredients.map((remoteIngredient) {
          final localFood = mergedLocalFoods.firstWhereOrNull(
            (localFood) => localFood.foodId == remoteIngredient.food.id,
          );
          return LocalIngredient.withParams(
            servingQuantity: remoteIngredient.quantity,
            localFoodId: localFood?.id ?? 0,
            localId:
                existingIngredients.firstWhereOrNull((localIngredient) {
                  return localIngredient.localFood.targetId == localFood?.id;
                })?.localId ??
                0,
          );
        }).toList(),
      );
      localIngredients = _ingredientRepository.findByLocalIds(
        ids: localIngredientsIds,
      );
      // TODO: Delete ingredients that remain unused by any recipe after upsert.
      _recipeRepository.upsert(
        LocalRecipe.withParams(
          ingredients: localIngredients,
          cookedWeight: localRecipe.cookedWeight,
          description: localRecipe.description,
          localId: localRecipeId,
          name: localRecipe.name,
          remoteId: remoteRecipeId,
        ),
      );
    } else {
      localIngredients =
          _recipeRepository
              .findRecipeByLocalId(localId: localRecipeId)
              ?.localIngredients
              .toList() ??
          [];
    }

    return localIngredients
        .where((element) => element.localFood.target != null)
        .map(
          (i) => RecipeIngredient(
            food: Food.local(localFood: i.localFood.target!),
            servingQuantity: i.servingQuantity,
          ),
        )
        .toList();
  }
}
