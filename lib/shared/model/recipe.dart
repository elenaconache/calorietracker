import 'package:calorietracker/shared/model/collection/collection_recipe_response.dart';

class Recipe {
  final int id;
  final String name;
  final int cookedWeight;

  const Recipe({required this.name, required this.id, required this.cookedWeight});

  Recipe.collection({required CollectionRecipeResponse recipe})
      : id = recipe.id,
        name = recipe.name,
        cookedWeight = recipe.cookedWeight;
}
