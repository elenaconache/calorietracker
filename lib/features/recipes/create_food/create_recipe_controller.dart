import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:flutter/cupertino.dart';

class CreateRecipeController {
  final ValueNotifier<List<RecipeIngredient>> ingredients = ValueNotifier([]);

  void addIngredient({required RecipeIngredient ingredient}) => ingredients.value = [
        ...ingredients.value,
        ingredient,
      ];
}
