import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeHelper {
  Nutrition calculateTotalIngredientsNutrition({required List<RecipeIngredient> ingredients}) => ingredients.fold(
        const Nutrition(),
        (nutrition, ingredient) => nutrition.add(
          nutrition: Nutrition.perServing(
            nutritionPer100Grams: ingredient.food.nutrition,
            servingSizeGrams: ingredient.servingQuantity,
          ),
        ),
      );

  Nutrition calculateRecipeNutrition({
    required List<RecipeIngredient> ingredients,
    required int cookedQuantity,
  }) =>
      Nutrition.fromServing(
        nutritionPerServing: calculateTotalIngredientsNutrition(ingredients: ingredients),
        servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
      );
}
