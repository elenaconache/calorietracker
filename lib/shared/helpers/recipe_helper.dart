import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/local/local_ingredient.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeHelper {
  Nutrition calculateTotalIngredientsNutrition({
    required List<LocalIngredient> ingredients,
    required List<LocalFood> foods,
  }) => ingredients.fold(const Nutrition(), (nutrition, ingredient) {
    final food = foods.firstWhereOrNull(
      (element) => element.id == ingredient.localFood.targetId,
    );
    return nutrition.add(
      nutrition: Nutrition.perServing(
        nutritionPer100Grams: food?.nutrition ?? Nutrition(),
        servingSizeGrams: ingredient.servingQuantity,
      ),
    );
  });

  Nutrition calculateRecipeNutrition({
    required List<LocalIngredient> ingredients,
    required List<LocalFood> foods,
    required int cookedQuantity,
  }) {
    return Nutrition.fromServing(
      nutritionPerServing: calculateTotalIngredientsNutrition(
        ingredients: ingredients,
        foods: foods,
      ),
      servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
    );
  }
}
