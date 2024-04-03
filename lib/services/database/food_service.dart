import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/database/diary_entry_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

class FoodService {
  final Isar database;

  FoodService({required this.database});

  Future<int?> upsertFood({required LocalFood localFood}) async {
    final id = await _writeFood(localFood).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
    locator<LoggingService>().info('upsert food $localFood');
    return id;
  }

  Future<void> upsertFoods({required List<LocalFood> localFoods}) async {
    await _writeFoods(localFoods).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    });
    locator<LoggingService>().info('upsert foods $localFoods');
  }

  Future<List<LocalFood>> getFoods({bool filterPending = false}) async {
    if (filterPending) {
      return _readPendingFoods().catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        return <LocalFood>[];
      });
    } else {
      return _readFoods().catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        return <LocalFood>[];
      });
    }
  }

  Future<void> _writeFoods(List<LocalFood> foods) async {
    List<LocalFood> newFoods = [];
    for (final food in foods) {
      if (await _findLocalFood(name: food.name, brand: food.brand) == null) {
        newFoods.add(food);
      }
    }
    await database.writeTxn(() async => await database.localFoods.putAll(newFoods));
  }

  Future<int?> _writeFood(LocalFood food) async {
    final existingId = await _findLocalFood(name: food.name, brand: food.brand);
    if (existingId == null) {
      return await database.writeTxn(() async => await database.localFoods.put(food));
    } else {
      return existingId;
    }
  }

  Future<List<LocalFood>> _readFoods() async {
    return database.localFoods.where().findAll();
  }

  Future<List<LocalFood>> _readPendingFoods() async {
    return database.localFoods.where().filter().pushedEqualTo(false).errorPushingEqualTo(false).findAll();
  }

  Future<Map<LocalFood, LocalDiaryEntry?>> searchFood({required String query}) async {
    final createdFoods = await _searchFoods(query).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    final diaryFoods = await _searchDiaryFoods(query).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    final diaryEntriesService = locator<DiaryEntryService>();
    final foodsDiaryEntries = await diaryEntriesService.getDiaryEntries(
      localFoodIds: diaryFoods.map((food) => food.id).toList(),
    );

    var result = [
      ...createdFoods,
      ...diaryFoods,
    ];
    result.removeWhere((localFood) =>
        result.indexWhere((otherFood) => otherFood.name == localFood.name && otherFood.brand == localFood.brand) !=
        result.lastIndexOf(localFood));
    return Map.fromEntries(result.sorted((firstFood, secondFood) => firstFood.compareCreatedAtDateDesc(secondFood)).map(
          (food) => MapEntry(
            food,
            foodsDiaryEntries.lastWhereOrNull((entry) => entry.localFood.value?.id == food.id),
          ),
        ));
  }

  Future<List<LocalFood>> _searchDiaryFoods(String searchQuery) async {
    final diaryEntries = await database.localDiaryEntrys
        .where()
        .filter()
        .errorPushingEntryEqualTo(false)
        .localFood((queryBuilder) => queryBuilder
            .nameContains(searchQuery, caseSensitive: false)
            .or()
            .brandIsNotNull()
            .and()
            .brandContains(searchQuery, caseSensitive: false))
        .sortByEntryDateDesc()
        .findAll();
    return diaryEntries
        .map((localEntry) {
          final diaryFood = localEntry.localFood.value ?? LocalFood();
          return LocalFood()
            ..nutritionInfo = (Nutrition.local(localNutrition: diaryFood.nutritionInfo).localFoodNutrition)
            ..id = diaryFood.id
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
  }

  Future<List<LocalFood>> _searchFoods(String searchQuery) async {
    return database.localFoods
        .where()
        .filter()
        .errorPushingEqualTo(false)
        .nameContains(searchQuery, caseSensitive: false)
        .or()
        .brandIsNotNull()
        .and()
        .brandContains(searchQuery, caseSensitive: false)
        .sortByCreatedAtDateDesc()
        .findAll();
  }

  Future<int?> _findLocalFood({required String name, String? brand}) async {
    final results = await database.localFoods.where().filter().nameEqualTo(name).and().brandEqualTo(brand).findAll();
    return results.firstOrNull?.id;
  }
}
