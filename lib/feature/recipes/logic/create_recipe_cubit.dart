import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/model/local/local_ingredient.dart';
import 'package:calorietracker/shared/data/model/local/local_recipe.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/service/database/food_repository.dart';
import 'package:calorietracker/shared/data/service/database/recipe_repository.dart';
import 'package:calorietracker/shared/helpers/recipe_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_recipe_state.dart';
part 'create_recipe_cubit.freezed.dart';

@injectable
class CreateRecipeCubit extends Cubit<CreateRecipeState> {
  final RecipeHelper _recipeHelper;
  final FoodRepository _foodRepository;
  final RecipeRepository _recipeRepository;

  CreateRecipeCubit(
    this._recipeHelper,
    this._foodRepository,
    this._recipeRepository,
  ) : super(
        CreateRecipeState(
          ingredients: [],
          nutrition: Nutrition(),
          createRecipeStatus: AsyncState.initial(),
        ),
      );

  void addIngredient({
    required LocalIngredient ingredient,
    required int cookedQuantity,
  }) {
    final updatedIngredients = [...state.ingredients, ingredient];
    final foods = _foodRepository.findByLocalIds(
      localIds: updatedIngredients.map((e) => e.localFood.targetId).toList(),
    );

    final totalNutrition = _recipeHelper.calculateTotalIngredientsNutrition(
      ingredients: updatedIngredients,
      foods: foods,
    );

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
    final foods = _foodRepository.findByLocalIds(
      localIds: state.ingredients.map((e) => e.localFood.targetId).toList(),
    );
    emit(
      state.copyWith(
        nutrition: _recipeHelper.calculateRecipeNutrition(
          ingredients: state.ingredients,
          cookedQuantity: cookedQuantity,
          foods: foods,
        ),
      ),
    );
  }

  void saveRecipe({required String name, required int cookedQuantity}) async {
    _recipeRepository.upsert(
      LocalRecipe.withParams(
        ingredients: state.ingredients,
        cookedWeight: cookedQuantity,
        name: name,
      ),
    );
    emit(state.copyWith(createRecipeStatus: AsyncState.success(null)));
  }

  void removeIngredient({required int index, required int cookedQuantity}) {
    final ingredients = [
      ...state.ingredients.sublist(0, index),
      ...state.ingredients.sublist(index + 1),
    ];
    final foods = _foodRepository.findByLocalIds(
      localIds: ingredients.map((e) => e.localFood.targetId).toList(),
    );

    emit(
      state.copyWith(
        nutrition: _recipeHelper.calculateRecipeNutrition(
          ingredients: ingredients,
          cookedQuantity: cookedQuantity,
          foods: foods,
        ),
      ),
    );
  }

  void updateIngredientQuantity({
    required int index,
    required double ingredientQuantity,
    required int cookedQuantity,
  }) {
    final ingredients = [
      ...state.ingredients.sublist(0, index),
      state.ingredients[index]..servingQuantity = ingredientQuantity,
      ...state.ingredients.sublist(index + 1),
    ];
    final foods = _foodRepository.findByLocalIds(
      localIds: ingredients.map((e) => e.localFood.targetId).toList(),
    );

    final recipeNutrition = Nutrition.fromServing(
      nutritionPerServing: _recipeHelper.calculateTotalIngredientsNutrition(
        ingredients: ingredients,
        foods: foods,
      ),
      servingSizeGrams: cookedQuantity == 0 ? 100 : cookedQuantity.toDouble(),
    );
    emit(state.copyWith(ingredients: ingredients, nutrition: recipeNutrition));
  }
}
