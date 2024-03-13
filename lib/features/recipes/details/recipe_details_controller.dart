import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/recipes/recipe_helper.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:flutter/cupertino.dart';

class RecipeDetailsController {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<Nutrition> recipeNutrition = ValueNotifier(const Nutrition());
  final ValueNotifier<List<RecipeIngredient>> ingredients = ValueNotifier([]);

  void updateNutrition({required int cookedQuantity}) =>
      recipeNutrition.value = locator<RecipeHelper>().calculateRecipeNutrition(
        ingredients: ingredients.value,
        cookedQuantity: cookedQuantity,
      );
}
