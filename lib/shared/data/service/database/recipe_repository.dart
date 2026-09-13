import 'package:calorietracker/objectbox.g.dart';
import 'package:calorietracker/shared/data/model/local/local_data_state.dart';
import 'package:calorietracker/shared/data/model/local/local_recipe.dart';
import 'package:calorietracker/shared/data/service/database/database_service.dart';
import 'dart:core';
import 'package:injectable/injectable.dart' hide Order;

@lazySingleton
class RecipeRepository {
  final DatabaseService _databaseService;

  RecipeRepository(this._databaseService);

  Box<LocalRecipe> get _recipeBox => _databaseService.store.box<LocalRecipe>();

  int upsert(LocalRecipe recipe) {
    return _recipeBox.put(recipe);
  }

  Stream<List<LocalRecipe>> watchRecipes() {
    return _recipeBox
        .query()
        .watch(triggerImmediately: true)
        .map((event) => event.find());
  }

  LocalRecipe? findRecipeByLocalId({required localId}) {
    final query = _recipeBox
        .query(LocalRecipe_.localId.equals(localId))
        .build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  List<LocalRecipe> getPendingRecipes() {
    final query = _recipeBox
        .query(LocalRecipe_.dbState.equals(LocalDataState.pushPending.name))
        .build();
    final result = query.find();
    query.close();
    return result
        .where((element) => element.localIngredients.isNotEmpty)
        .toList();
  }

  LocalRecipe? findRecipeByRemoteId({required remoteId}) {
    final query = _recipeBox
        .query(LocalRecipe_.remoteId.equals(remoteId))
        .build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  List<int> upsertList(List<LocalRecipe> recipes) {
    return _recipeBox.putMany(recipes);
  }
}
