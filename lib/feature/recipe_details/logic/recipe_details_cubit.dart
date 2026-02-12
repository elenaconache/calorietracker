import 'package:calorietracker/feature/recipe_details/data/recipe_details_repository.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
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

  RecipeDetailsCubit(
    this._recipeHelper,
    this._recipeRepository,
    this._loggingService,
  ) : super(RecipeDetailsState(
          nutrition: AsyncState.initial(),
          ingredients: AsyncState.initial(),
        ));

  void updateNutrition({required int cookedQuantity}) {
    final updatedNutrition = _recipeHelper.calculateRecipeNutrition(
      ingredients: state.ingredients.data ?? [],
      cookedQuantity: cookedQuantity,
    );
    emit(state.copyWith(nutrition: AsyncState.success(updatedNutrition)));
  }

  void fetchRecipe({required int recipeId, required int cookedQuantity}) async {
    emit(state.copyWith(
      ingredients: AsyncState.loading(),
      nutrition: AsyncState.loading(),
    ));
    try {
      final recipeIngredients = await _recipeRepository.getRecipeIngredients(recipeId: recipeId);
      final nutrition = _recipeHelper.calculateTotalIngredientsNutrition(ingredients: recipeIngredients);
      emit(
        state.copyWith(
          ingredients: AsyncState.success(recipeIngredients),
          nutrition: AsyncState.success(
            Nutrition.fromServing(
              nutritionPerServing: nutrition,
              servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
            ),
          ),
        ),
      );
    } catch (e, stackTrace) {
      _loggingService.handle(e, stackTrace);
      emit(state.copyWith(
        ingredients: AsyncState.failure(GeneralFailure(message: e.toString())),
        nutrition: AsyncState.failure(GeneralFailure(message: e.toString())),
      ));
    }
  }
}
