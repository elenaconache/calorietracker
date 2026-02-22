import 'package:calorietracker/feature/recipes/data/create_recipe_error.dart';
import 'package:calorietracker/feature/recipes/data/create_recipe_repository.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/helpers/recipe_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_recipe_state.dart';
part 'create_recipe_cubit.freezed.dart';

@injectable
class CreateRecipeCubit extends Cubit<CreateRecipeState> {
  final RecipeHelper _recipeHelper;
  final CreateRecipeRepository _createRecipeRepository;

  CreateRecipeCubit(this._recipeHelper, this._createRecipeRepository)
      : super(CreateRecipeState(
          ingredients: [],
          nutrition: Nutrition(),
          createRecipeStatus: AsyncState.initial(),
        ));

  void addIngredient({required RecipeIngredient ingredient, required int cookedQuantity}) {
    final updatedIngredients = [...state.ingredients, ingredient];
    final totalNutrition = _recipeHelper.calculateTotalIngredientsNutrition(ingredients: updatedIngredients);
    emit(
      state.copyWith(
        ingredients: updatedIngredients,
        nutrition: Nutrition.fromServing(
          nutritionPerServing: totalNutrition,
          servingSizeGrams: cookedQuantity.toDouble(),
        ),
      ),
    );
  }

  void updateCookedQuantity({required int cookedQuantity}) {
    emit(state.copyWith(
        nutrition: _recipeHelper.calculateRecipeNutrition(
      ingredients: state.ingredients,
      cookedQuantity: cookedQuantity,
    )));
  }

  void saveRecipe({required String name, required int cookedQuantity}) async {
    emit(state.copyWith(createRecipeStatus: AsyncState.loading()));
    final result = await _createRecipeRepository.createRecipe(
      name: name,
      ingredients: state.ingredients,
      cookedQuantity: cookedQuantity,
    );
    emit(
      state.copyWith(
          createRecipeStatus: result == CreateRecipeError.none ? AsyncState.success(null) : AsyncState.failure(Failure.createRecipe(type: result))),
    );
  }

  void removeIngredient({required int index, required int cookedQuantity}) {
    final ingredients = [
      ...state.ingredients.sublist(0, index),
      ...state.ingredients.sublist(index + 1),
    ];
    emit(state.copyWith(
      nutrition: _recipeHelper.calculateRecipeNutrition(ingredients: ingredients, cookedQuantity: cookedQuantity),
    ));
  }

  void updateIngredientQuantity({required int index, required double ingredientQuantity, required int cookedQuantity}) {
    final ingredients = [
      ...state.ingredients.sublist(0, index),
      RecipeIngredient(food: state.ingredients[index].food, servingQuantity: ingredientQuantity),
      ...state.ingredients.sublist(index + 1),
    ];
    final recipeNutrition = Nutrition.fromServing(
      nutritionPerServing: _recipeHelper.calculateTotalIngredientsNutrition(ingredients: ingredients),
      servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
    );
    emit(state.copyWith(
      ingredients: ingredients,
      nutrition: recipeNutrition,
    ));
  }
}
