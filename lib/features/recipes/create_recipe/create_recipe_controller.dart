import 'dart:async';

import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/extensions/dio_extensions.dart';
import 'package:calorietracker/features/recipes/create_recipe/create_recipe_error.dart';
import 'package:calorietracker/features/recipes/recipe_helper.dart';
import 'package:calorietracker/models/collection/add_recipe_request.dart';
import 'package:calorietracker/models/collection/collection_recipe_ingredient.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
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

  Nutrition get _totalNutrition =>
      locator<RecipeHelper>().calculateTotalIngredientsNutrition(ingredients: ingredients.value);

  void updateNutrition({required int cookedQuantity}) =>
      recipeNutrition.value = locator<RecipeHelper>().calculateRecipeNutrition(
        ingredients: ingredients.value,
        cookedQuantity: cookedQuantity,
      );

  Future<CreateRecipeError> saveRecipe({required String name, required int cookedQuantity}) async {
    isLoading.value = true;
    final apiService = await locator.getAsync<CollectionApiService>();
    return apiService
        .createRecipe(
          body: AddRecipeRequest(
              name: name,
              description: null,
              cookedWeight: cookedQuantity,
              ingredients: ingredients.value
                  .map((recipeIngredient) => CollectionRecipeIngredient(
                        foodId: recipeIngredient.food.id!,
                        foodUnitId: gramsUnitId,
                        quantity: recipeIngredient.servingQuantity,
                      ))
                  .toList()),
        )
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

  void removeIngredient({required int index, required int cookedQuantity}) {
    ingredients.value = [
      ...ingredients.value.sublist(0, index),
      ...ingredients.value.sublist(index + 1, ingredients.value.length),
    ];
    updateNutrition(cookedQuantity: cookedQuantity);
  }

  void updateIngredientQuantity({
    required int index,
    required double ingredientQuantity,
    required int cookedQuantity,
  }) {
    ingredients.value = [
      ...ingredients.value.sublist(0, index),
      RecipeIngredient(food: ingredients.value[index].food, servingQuantity: ingredientQuantity),
      ...ingredients.value.sublist(index + 1),
    ];
    recipeNutrition.value = Nutrition.fromServing(
      nutritionPerServing: _totalNutrition,
      servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
    );
  }
}
