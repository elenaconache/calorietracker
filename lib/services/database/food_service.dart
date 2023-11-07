import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/database/database_provider.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

class FoodService {
  Future<int?> upsertFood({required LocalFood localFood}) async {
    final id = await compute(_writeFood, localFood);
    return id;
  }

  Future<void> upsertFoods({required List<LocalFood> localFoods}) async {
    final id = await compute(_writeFoods, localFoods);
    locator<LoggingService>().info('upsert foods $localFoods');
    return id;
  }

  Future<List<LocalFood>> getFoods({bool filterPending = false}) async {
    final foods = await compute(filterPending ? _readPendingFoods : _readFoods, {}).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    return foods;
  }

  Future<void> _writeFoods(List<LocalFood> foods) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    db.writeTxnSync(() => db.localFoods.putAllSync(foods));
    db.close();
  }

  Future<int?> _writeFood(LocalFood food) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    final result = db.writeTxnSync(() => db.localFoods.putSync(food));
    db.close();
    return result;
  }

  Future<List<LocalFood>> _readFoods(dynamic _) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    final result = db.localFoods.where().findAll();
    db.close();
    return result;
  }

  Future<List<LocalFood>> _readPendingFoods(dynamic _) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    final result = db.localFoods.where().filter().pushedEqualTo(false).errorPushingEqualTo(false).findAll();
    db.close();
    return result;
  }

  Future<List<LocalFood>> searchFood({required String query}) async {
    final createdFoods = await compute(_searchFoods, query).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    final diaryFoods = await compute(_searchDiaryFoods, query).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    var result = [
      ...createdFoods,
      ...diaryFoods,
    ];
    result.removeWhere((localFood) =>
        result.indexWhere((otherFood) => otherFood.name == localFood.name && otherFood.brand == localFood.brand) !=
        result.lastIndexOf(localFood));
    return result.sorted((firstFood, secondFood) => firstFood.compareCreatedAtDateDesc(secondFood));
  }

  Future<List<LocalFood>> _searchDiaryFoods(String searchQuery) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    final diaryEntries = await db.localDiaryEntrys
        .where()
        .filter()
        .errorPushingEqualTo(false)
        .localFood((queryBuilder) =>
            queryBuilder.nameContains(searchQuery).or().brandIsNotNull().and().brandContains(searchQuery))
        .sortByEntryDateDesc()
        .findAll();
    final result = diaryEntries
        .map((localEntry) {
          final diaryFood = localEntry.localFood;
          return LocalFood()
            ..nutritionInfo = (Nutrition.local(localNutrition: diaryFood.nutritionInfo).localFoodNutrition)
            ..id = diaryFood.localId ?? -1
            // TODO: handle foods without local id on search and save (if needed, might be enough if it first checks for remote food id)
            ..foodId = diaryFood.foodId
            ..createdAtDate = diaryFood.createdAtDate
            ..brand = diaryFood.brand
            ..name = diaryFood.name
            ..errorPushing = diaryFood.errorPushing
            ..deleted = diaryFood.deleted
            ..pushed = diaryFood.pushed
            ..barcode = diaryFood.barcode;
        })
        .sorted((LocalFood firstFood, LocalFood secondFood) => firstFood.compareCreatedAtDateDesc(secondFood))
        .toList();
    db.close();
    return result;
  }

  Future<List<LocalFood>> _searchFoods(String searchQuery) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    final result = db.localFoods
        .where()
        .filter()
        .errorPushingEqualTo(false)
        .nameContains(searchQuery)
        .or()
        .brandIsNotNull()
        .and()
        .brandContains(searchQuery)
        .sortByCreatedAtDateDesc()
        .findAll();
    db.close();
    return result;
  }
}
