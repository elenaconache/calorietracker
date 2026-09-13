import 'package:calorietracker/objectbox.g.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/service/database/database_service.dart';
import 'dart:core';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart' hide Order;

@lazySingleton
class FoodRepository {
  final DatabaseService _databaseService;

  FoodRepository(this._databaseService);

  Box<LocalFood> get _foodBox => _databaseService.store.box<LocalFood>();

  List<LocalFood> readPendingFoods() {
    final queryBuilder = _foodBox.query(
      LocalFood_.pushed.equals(false) & LocalFood_.errorPushing.equals(false),
    );
    return queryBuilder.build().find();
  }

  LocalFood? findFood({required String name, String? brand}) {
    Condition<LocalFood> condition = LocalFood_.name.equals(name);
    if (brand != null) {
      condition =
          condition &
          LocalFood_.brand.notNull() &
          LocalFood_.brand.equals(brand);
    }
    return _foodBox.query(condition).build().findFirst();
  }

  LocalFood? findFoodByLocalId({required int localId}) {
    Condition<LocalFood> condition = LocalFood_.id.equals(localId);
    return _foodBox.query(condition).build().findFirst();
  }

  LocalFood? findFoodByRemoteId({required int remoteId}) {
    Condition<LocalFood> condition = LocalFood_.foodId.equals(remoteId);
    return _foodBox.query(condition).build().findFirst();
  }

  List<LocalFood> findByRemoteIds({required List<int> remoteIds}) {
    Condition<LocalFood> condition = LocalFood_.foodId.oneOf(remoteIds);
    return _foodBox.query(condition).build().find();
  }

  List<LocalFood> findByLocalIds({required List<int> localIds}) {
    Condition<LocalFood> condition = LocalFood_.id.oneOf(localIds);
    return _foodBox.query(condition).build().find();
  }

  Map<LocalFood, LocalDiaryEntry?> searchCreatedFoods(String searchQuery) {
    final createdFoodsResults = _foodBox
        .query(
          LocalFood_.errorPushing.equals(false) &
                  LocalFood_.name.contains(searchQuery, caseSensitive: false) |
              LocalFood_.brand.notNull() &
                  LocalFood_.brand.contains(searchQuery, caseSensitive: false),
        )
        .order(LocalFood_.createdAtDate, flags: Order.descending)
        .build()
        .find();
    Map<LocalFood, LocalDiaryEntry?> resultsMap = {};

    for (final entry in createdFoodsResults) {
      if (resultsMap.keys.none((key) => key.id == entry.id)) {
        resultsMap[entry] = null;
      }
    }

    return resultsMap;
  }

  List<int> upsertList(List<LocalFood> foods) {
    return _foodBox.putMany(foods);
  }

  int upsert(LocalFood food) {
    return _foodBox.put(food);
  }
}
