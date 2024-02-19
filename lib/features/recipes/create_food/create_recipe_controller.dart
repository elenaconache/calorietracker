import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:flutter/cupertino.dart';

class CreateRecipeController {
  final ValueNotifier<List<RecipeIngredient>> ingredients = ValueNotifier([]);

  Nutrition get recipeNutrition => ingredients.value.fold(
        const Nutrition(),
        (nutrition, ingredient) => nutrition.add(
          nutrition: Nutrition.perServing(
            nutritionPer100Grams: ingredient.food.nutrition,
            servingSizeGrams: ingredient.servingQuantity,
          ),
        ),
      );

  void addIngredient({required RecipeIngredient ingredient}) => ingredients.value = [
        ...ingredients.value,
        ingredient,
      ];
}
