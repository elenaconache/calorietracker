import 'package:calorietracker/shared/data/model/collection/collection_recipe_response.dart';
import 'package:calorietracker/shared/data/model/local/local_recipe.dart';

class Recipe {
  final int? id;
  final String name;
  final int cookedWeight;
  final int? localId;

  const Recipe({
    required this.name,
    required this.id,
    required this.cookedWeight,
    required this.localId,
  });

  Recipe.collection({required CollectionRecipeResponse recipe})
    : id = recipe.id,
      name = recipe.name,
      cookedWeight = recipe.cookedWeight,
      localId = null;

  Recipe.local({required LocalRecipe localRecipe})
    : id = localRecipe.remoteId,
      name = localRecipe.name,
      cookedWeight = localRecipe.cookedWeight,
      localId = localRecipe.localId;
}
