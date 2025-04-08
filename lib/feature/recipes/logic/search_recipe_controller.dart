import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/data/model/recipe.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchRecipeController {
  final ValueNotifier<FutureResponse<List<Recipe>>> recipes = ValueNotifier(FutureInitialState());

  Future<void> fetchRecipes() async {
    recipes.value = FutureLoading();
    final apiService = await getIt.getAsync<CollectionApiService>();
    unawaited(
      apiService.getRecipes().then((response) {
        recipes.value = FutureSuccess(
          data: response.map((collectionRecipe) => Recipe.collection(recipe: collectionRecipe)).toList(),
        );
      }).catchError((error, stackTrace) {
        getIt<LoggingService>().handle(error, stackTrace);
        recipes.value = FutureError();
      }),
    );
  }

  Future<void> searchRecipe({required String query}) async {
    recipes.value = FutureLoading();
    await Future.delayed(const Duration(seconds: 2));
    recipes.value = FutureSuccess(data: const [Recipe(name: 'Mocked recipe', cookedWeight: 100, id: 1)]);
  }

  void clearResults() {
    recipes.value = FutureInitialState();
    unawaited(fetchRecipes());
  }
}
