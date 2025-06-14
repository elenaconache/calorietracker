import 'dart:async';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/recipes/logic/recipe_helper.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeDetailsController {
  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<FutureResponse<Nutrition>> recipeNutrition = ValueNotifier(FutureLoading());
  final ValueNotifier<FutureResponse<List<RecipeIngredient>>> ingredients = ValueNotifier(FutureLoading<List<RecipeIngredient>>());

  void updateNutrition({required int cookedQuantity}) => recipeNutrition.value = FutureSuccess(
        data: getIt<RecipeHelper>().calculateRecipeNutrition(
          ingredients: ingredients.value is FutureSuccess ? (ingredients.value as FutureSuccess).data : [],
          cookedQuantity: cookedQuantity,
        ),
      );

  Future<void> initializeRecipe({required int recipeId, required int cookedQuantity}) async {
    final apiService = getIt.get<CollectionApiService>();
    FutureResponse<List<RecipeIngredient>> ingredientsResponse = FutureLoading();
    await Future.wait([
      apiService.getRecipeIngredients(recipeId: recipeId).then((recipeIngredients) {
        ingredientsResponse = FutureSuccess(
            data: recipeIngredients
                .map((collectionRecipeIngredient) => RecipeIngredient(
                      food: Food.collection(food: collectionRecipeIngredient.food),
                      servingQuantity: collectionRecipeIngredient.quantity * collectionRecipeIngredient.unit.weightInGrams,
                    ))
                .toList());
      }).catchError((error, stackTrace) {
        getIt<LoggingService>().handle(error, stackTrace);
        ingredientsResponse = FutureError();
      }),
      Future.delayed(const Duration(milliseconds: 700))
    ]);
    ingredients.value = ingredientsResponse;
    if (ingredients.value is FutureError) {
      recipeNutrition.value = FutureSuccess(
        data: Nutrition.fromServing(
          nutritionPerServing: _totalNutrition,
          servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
        ),
      );
    } else {
      recipeNutrition.value = FutureSuccess(
        data: Nutrition.fromServing(
          nutritionPerServing: _totalNutrition,
          servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
        ),
      );
    }
  }

  Nutrition get _totalNutrition => getIt<RecipeHelper>().calculateTotalIngredientsNutrition(
        ingredients: ingredients.value is FutureSuccess ? (ingredients.value as FutureSuccess).data : [],
      );
}
