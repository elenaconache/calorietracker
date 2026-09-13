import 'package:calorietracker/objectbox.g.dart';
import 'package:calorietracker/shared/data/model/local/local_ingredient.dart';
import 'package:calorietracker/shared/data/service/database/database_service.dart';
import 'dart:core';
import 'package:injectable/injectable.dart' hide Order;

@lazySingleton
class IngredientRepository {
  final DatabaseService _databaseService;

  IngredientRepository(this._databaseService);

  Box<LocalIngredient> get _ingredientBox =>
      _databaseService.store.box<LocalIngredient>();

  int upsert(LocalIngredient ingredient) {
    final id = _ingredientBox.put(ingredient);
    return id;
  }

  List<int> upsertList(List<LocalIngredient> ingredients) {
    final ids = _ingredientBox.putMany(ingredients);
    return ids;
  }

  List<LocalIngredient> findByLocalIds({required List<int> ids}) {
    final query = _ingredientBox
        .query(LocalIngredient_.localId.oneOf(ids))
        .build();
    final result = query.find();
    query.close();
    return result;
  }
}
