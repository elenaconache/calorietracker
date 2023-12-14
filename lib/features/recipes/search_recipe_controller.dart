import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/recipe.dart';
import 'package:flutter/cupertino.dart';

class SearchRecipeController {
  final ValueNotifier<FutureResponse<List<Recipe>>> recipes = ValueNotifier(FutureInitialState());

  Future<void> searchRecipe({required String query}) async {
    recipes.value = FutureLoading();
    await Future.delayed(const Duration(seconds: 2));
    recipes.value = FutureSuccess(data: const [Recipe(name: 'Mocked recipe')]);
  }

  void clearResults() => recipes.value = FutureInitialState();
}
