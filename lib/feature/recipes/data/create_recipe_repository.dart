import 'package:calorietracker/feature/recipes/data/create_recipe_error.dart';
import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/data/model/collection/add_recipe_request.dart';
import 'package:calorietracker/shared/data/model/collection/collection_recipe_ingredient.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/extension/dio_extensions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateRecipeRepository {
  final CollectionApiService _apiService;
  final LoggingService _loggingService;

  CreateRecipeRepository(this._apiService, this._loggingService);

  Future<CreateRecipeError> createRecipe({
    required String name,
    required List<RecipeIngredient> ingredients,
    required int cookedQuantity,
  }) async {
    try {
      await _apiService.createRecipe(
        body: AddRecipeRequest(
          name: name,
          description: null,
          cookedWeight: cookedQuantity,
          ingredients: ingredients
              .map((recipeIngredient) => CollectionRecipeIngredient(
                    foodId: recipeIngredient.food.id!,
                    foodUnitId: gramsUnitId,
                    quantity: recipeIngredient.servingQuantity,
                  ))
              .toList(),
        ),
      );
    } catch (e, stackTrace) {
      if (e is DioException && e.isConnectionError) {
        return CreateRecipeError.connection;
      } else {
        _loggingService.handle(e, stackTrace);
        return CreateRecipeError.unknown;
      }
    }
    return CreateRecipeError.none;
  }
}
