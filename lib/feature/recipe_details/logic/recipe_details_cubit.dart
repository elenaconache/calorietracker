import 'package:calorietracker/feature/recipe_details/data/recipe_details_repository.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/local/local_ingredient.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/service/database/food_repository.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/helpers/recipe_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'recipe_details_state.dart';
part 'recipe_details_cubit.freezed.dart';

@injectable
class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  final RecipeHelper _recipeHelper;
  final RecipeDetailsRepository _recipeRepository;
  final LoggingService _loggingService;
  final FoodRepository _foodRepository;

  RecipeDetailsCubit(
    this._recipeHelper,
    this._recipeRepository,
    this._loggingService,
    this._foodRepository,
  ) : super(
        RecipeDetailsState(
          nutrition: AsyncState.initial(),
          ingredients: AsyncState.initial(),
          ingredientsFoods: AsyncState.initial(),
        ),
      );

  void updateNutrition({required int cookedQuantity}) {
    final foods = _foodRepository.findByLocalIds(
      localIds:
          state.ingredients.data?.map((e) => e.localFood.targetId).toList() ??
          [],
    );
    final updatedNutrition = _recipeHelper.calculateRecipeNutrition(
      ingredients: state.ingredients.data ?? <LocalIngredient>[],
      cookedQuantity: cookedQuantity,
      foods: foods,
    );
    emit(state.copyWith(nutrition: AsyncState.success(updatedNutrition)));
  }

  void fetchRecipe({
    int? recipeId,
    int? localRecipeId,
    required int cookedQuantity,
  }) async {
    emit(
      state.copyWith(
        ingredients: AsyncState.loading(),
        nutrition: AsyncState.loading(),
      ),
    );

    if (localRecipeId == null) {
      _loggingService.handle(
        'No local recipe id, remote id $recipeId, quantity $cookedQuantity',
        StackTrace.current,
      );
      emit(
        state.copyWith(
          ingredients: AsyncState.failure(GeneralFailure()),
          nutrition: AsyncState.failure(GeneralFailure()),
        ),
      );
      return;
    }

    try {
      final recipeIngredients = await _recipeRepository.getRecipeIngredients(
        remoteRecipeId: recipeId,
        localRecipeId: localRecipeId,
      );
      final localIngredients = recipeIngredients
          .map(
            (e) => LocalIngredient.withParams(
              servingQuantity: e.servingQuantity,
              localFoodId: e.food.localId ?? 0,
            ),
          )
          .toList();
      final foods = _foodRepository.findByLocalIds(
        localIds: localIngredients.map((e) => e.localFood.targetId).toList(),
      );

      final nutrition = _recipeHelper.calculateTotalIngredientsNutrition(
        ingredients: localIngredients,
        foods: foods,
      );
      emit(
        state.copyWith(
          ingredients: AsyncState.success(localIngredients),
          nutrition: AsyncState.success(
            Nutrition.fromServing(
              nutritionPerServing: nutrition,
              servingSizeGrams: cookedQuantity == 0
                  ? 100
                  : cookedQuantity.toDouble(),
            ),
          ),
          ingredientsFoods: AsyncState.success(foods),
        ),
      );
    } catch (e, stackTrace) {
      _loggingService.handle(e, stackTrace);
      emit(
        state.copyWith(
          ingredients: AsyncState.failure(
            GeneralFailure(message: e.toString()),
          ),
          nutrition: AsyncState.failure(GeneralFailure(message: e.toString())),
        ),
      );
    }
  }
}
