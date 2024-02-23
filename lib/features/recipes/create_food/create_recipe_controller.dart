import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/recipes/create_food/create_recipe_error.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CreateRecipeController {
  final ValueNotifier<List<RecipeIngredient>> ingredients = ValueNotifier([]);
  final ValueNotifier<Nutrition> recipeNutrition = ValueNotifier(const Nutrition());
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  void addIngredient({required RecipeIngredient ingredient, required int cookedQuantity}) {
    ingredients.value = [...ingredients.value, ingredient];
    recipeNutrition.value = Nutrition.fromServing(
      nutritionPerServing: _totalNutrition,
      servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
    );
  }

  Nutrition get _totalNutrition => ingredients.value.fold(
        const Nutrition(),
        (nutrition, ingredient) => nutrition.add(
          nutrition: Nutrition.perServing(
            nutritionPer100Grams: ingredient.food.nutrition,
            servingSizeGrams: ingredient.servingQuantity,
          ),
        ),
      );

  void updateCookedQuantity({required int cookedQuantity}) => recipeNutrition.value = Nutrition.fromServing(
        nutritionPerServing: _totalNutrition,
        servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
      );

  Future<CreateRecipeError> saveRecipe() async {
    isLoading.value = true;
    return Future.delayed(const Duration(seconds: 2))
        .then((_) => CreateRecipeError.none)
        .catchError((error, stackTrace) async {
      isLoading.value = false;
      if (error is DioException && error.isConnectionError) {
        return CreateRecipeError.connection;
      } else {
        locator<LoggingService>().handle(error, stackTrace);
        return CreateRecipeError.unknown;
      }
    });
  }
}
