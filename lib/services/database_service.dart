import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/meal_entries_list.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

class DatabaseService {
  Future<int?> upsertFood({required LocalFood localFood}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final id = await compute(_writeFood, MapEntry(pathProvider.path, localFood));
    return id;
  }

  Future<void> upsertFoods({required List<LocalFood> localFoods}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final id = await compute(_writeFoods, MapEntry(pathProvider.path, localFoods));
    locator<LoggingService>().info('upsert foods $localFoods');
    return id;
  }

  Future<void> upsertDiaryEntries({required List<LocalDiaryEntry> localEntries}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final id = await compute(_writeDiaryEntries, MapEntry(pathProvider.path, localEntries));
    return id;
  }

  Future<List<LocalFood>> getFoods({bool filterPending = false}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final foods = await compute(filterPending ? _readPendingFoods : _readFoods, pathProvider.path)
        .catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    return foods;
  }

  Future<void> _writeFoods(MapEntry<String, List<LocalFood>> pair) async {
    final db = await getDatabase(pair.key);
    final foods = pair.value;
    db.writeTxnSync(() => db.localFoods.putAllSync(foods));
  }

  Future<int?> _writeFood(MapEntry<String, LocalFood> pair) async {
    final db = await getDatabase(pair.key);
    return db.writeTxnSync(() => db.localFoods.putSync(pair.value));
  }

  Future<List<LocalFood>> _readFoods(String path) async {
    final db = await getDatabase(path);
    return db.localFoods.where().findAll();
  }

  Future<List<LocalFood>> _readPendingFoods(String path) async {
    final db = await getDatabase(path);
    return db.localFoods.where().filter().pushedEqualTo(false).errorPushingEqualTo(false).findAll();
  }

  Future<List<LocalFood>> searchFood({required String query}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final pathQuery = MapEntry(pathProvider.path, query);
    final createdFoods = await compute(_searchFoods, pathQuery).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
    final diaryFoods = await compute(_searchDiaryFoods, pathQuery).catchError((error, stackTrace) {
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
    return result.sorted(_compareFoodCreatedAtDateDesc);
  }

  Future<List<LocalFood>> _searchFoods(MapEntry<String, String> pathQuery) async {
    final db = await getDatabase(pathQuery.key);
    final searchQuery = pathQuery.value;

    return db.localFoods
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
  }

  Future<List<LocalFood>> _searchDiaryFoods(MapEntry<String, String> pathQuery) async {
    final db = await getDatabase(pathQuery.key);
    final searchQuery = pathQuery.value;

    final diaryEntries = await db.localDiaryEntrys
        .where()
        .filter()
        .errorPushingEqualTo(false)
        .localFood((queryBuilder) =>
            queryBuilder.nameContains(searchQuery).or().brandIsNotNull().and().brandContains(searchQuery))
        .sortByEntryDateDesc()
        .findAll();
    return diaryEntries
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
        .sorted(_compareFoodCreatedAtDateDesc)
        .toList();
  }

  int _compareFoodCreatedAtDateDesc(LocalFood first, LocalFood second) =>
      -first.createdAtDate.compareTo(second.createdAtDate);

  Future<int?> upsertDiaryEntry({required LocalDiaryEntry localDiaryEntry}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final id = await compute(_writeDiaryEntry, MapEntry(pathProvider.path, localDiaryEntry));
    locator<LoggingService>().info('inserted diary entry ${localDiaryEntry.entryDate}, '
        'food id ${localDiaryEntry.localFood.foodId},'
        ' local food id ${localDiaryEntry.localFood.localId}');
    return id;
  }

  Future<int?> _writeDiaryEntry(MapEntry<String, LocalDiaryEntry> pair) async {
    final db = await getDatabase(pair.key);
    return db.writeTxnSync(() => db.localDiaryEntrys.putSync(pair.value));
  }

  Future<void> _writeDiaryEntries(MapEntry<String, List<LocalDiaryEntry>> pair) async {
    final db = await getDatabase(pair.key);
    final entries = pair.value;
    db.writeTxnSync(() => db.localDiaryEntrys.putAllSync(entries));
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntries(String path) async {
    final db = await getDatabase(path);
    return db.localDiaryEntrys.where().findAll();
  }

  Future<List<LocalDiaryEntry>> _readUploadReadyDiaryEntries(String path) async {
    final db = await getDatabase(path);
    return db.localDiaryEntrys
        .where()
        .filter()
        .pushedEqualTo(false)
        .errorPushingEqualTo(false)
        .localFood((food) => food.foodIdIsNotNull())
        .findAll();
  }

  Future<List<LocalDiaryEntry>> _readPushedDiaryEntries(String path) async {
    final db = await getDatabase(path);
    return db.localDiaryEntrys.where().filter().pushedEqualTo(true).findAll();
  }

  Future<List<LocalDiaryEntry>> _readPendingDiaryEntries(String path) async {
    final db = await getDatabase(path);
    return db.localDiaryEntrys.where().filter().pushedEqualTo(false).findAll();
  }

  Future<List<LocalDiaryEntry>> _readDayDiaryEntries(MapEntry<String, DateTime> pathDateEntry) async {
    final db = await getDatabase(pathDateEntry.key);
    final dateFilter = pathDateEntry.value;
    final lowerBound = DateTime(
      dateFilter.year,
      dateFilter.month,
      dateFilter.day,
    );
    final upperBound = lowerBound.copyWith(hour: 23, minute: 59);
    return db.localDiaryEntrys.where().filter().entryDateBetween(lowerBound, upperBound).findAll();
  }

  Future<List<LocalDiaryEntry>> _readPendingDayDiaryEntries(MapEntry<String, DateTime> pathDateEntry) async {
    final db = await getDatabase(pathDateEntry.key);
    final dateFilter = pathDateEntry.value;
    final lowerBound = DateTime(
      dateFilter.year,
      dateFilter.month,
      dateFilter.day,
    );
    final upperBound = lowerBound.copyWith(hour: 23, minute: 59);
    return db.localDiaryEntrys.where().filter().pushedEqualTo(false).entryDateBetween(lowerBound, upperBound).findAll();
  }

  Future<List<LocalDiaryEntry>> getDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
  }) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final entries = await compute(
            filterPushed
                ? _readPushedDiaryEntries
                : filterUploadReady
                    ? _readUploadReadyDiaryEntries
                    : filterPending
                        ? _readPendingDiaryEntries
                        : _readDiaryEntries,
            pathProvider.path)
        .catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
    return entries;
  }

  Future<List<MealEntriesList>> getDisplayDiaryEntries({required String date, bool filterPending = false}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final dateFormattingService = locator<DateFormattingService>();
    final formattedDate = dateFormattingService.format(dateTime: date, format: collectionApiDateFormat);
    final dateFilter = dateFormattingService.parse(
      formattedDate: formattedDate,
      format: collectionApiDateFormat,
    );
    final entries = await (compute(
        filterPending ? _readPendingDayDiaryEntries : _readDayDiaryEntries, MapEntry(pathProvider.path, dateFilter))
      ..catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        return <LocalDiaryEntry>[];
      }));
    final map = entries.groupListsBy((element) => element.meal);
    return List.generate(Meal.values.length, (index) {
      final meal = Meal.values[index];
      return MealEntriesList(
          meal: meal, diaryEntries: map[meal]?.map((e) => DiaryEntry.local(localEntry: e)).toList() ?? []);
    });
  }
}

Future<Isar> getDatabase(String path) async => Isar.open(
      [LocalDiaryEntrySchema, LocalFoodSchema],
      directory: path,
    );
