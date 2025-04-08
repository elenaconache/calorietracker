import 'package:calorietracker/objectbox.g.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'dart:core';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart' hide Order;

@lazySingleton
class DatabaseRepository {
  late final Store _store;

  @PostConstruct(preResolve: true)
  Future<void> init({@Named('appDirectoryPath') String? appDirectory}) async {
    _store = await openStore(directory: appDirectory);
  }

  Future<List<int>> upsertList<T>({required List<T> items}) {
    return _store.box<T>().putManyAsync(items);
  }

  Future<int> upsert<T>({required T item}) {
    return _store.box<T>().putAsync(item);
  }

  Future<void> writeDiaryEntriesRecursively({required List<LocalDiaryEntry> entries}) async {
    await _store.runInTransactionAsync(TxMode.write, writeDiaryEntriesAndFoods, entries);
  }

  Future<void> removeList<T>({required List<int> ids}) {
    return _store.box<T>().removeManyAsync(ids);
  }

  Future<List<LocalDiaryEntry>> readDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
    List<int>? localFoodIds,
    required String username,
  }) async {
    Condition<LocalDiaryEntry> condition = LocalDiaryEntry_.username.equals(username);
    if (filterPending) condition = condition & LocalDiaryEntry_.pushedEntry.equals(false);
    if (filterUploadReady) {
      condition = condition &
          (LocalDiaryEntry_.pushedEntry.equals(false) & LocalDiaryEntry_.localFood.notNull() | LocalDiaryEntry_.deletedEntry.equals(true));
    }
    if (filterPushed) {
      condition = condition & LocalDiaryEntry_.pushedEntry.equals(true);
    }
    if (dateFilter != null) {
      final lowerBoundDate = DateTime(
        dateFilter.year,
        dateFilter.month,
        dateFilter.day,
      );
      final upperBoundDate = lowerBoundDate.copyWith(hour: 23, minute: 59);
      condition = condition & LocalDiaryEntry_.entryDate.betweenDate(lowerBoundDate, upperBoundDate);
    }
    if (excludeDeleted) {
      condition = condition & LocalDiaryEntry_.deletedEntry.equals(false);
    }

    final queryBuilder = _store.box<LocalDiaryEntry>().query(condition);
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder
        .build()
        .find()
        .where((element) => (localFoodIds?.isEmpty ?? true) || localFoodIds!.contains(element.localFood.targetId))
        .toList();
  }

  Future<List<LocalDiaryEntry>> readDiaryEntriesByIds({required List<DiaryEntry> entries}) async {
    final queryBuilder = _store.box<LocalDiaryEntry>().query(LocalDiaryEntry_.localId.oneOf(entries.map((e) => e.localId).nonNulls.toList()) |
        LocalDiaryEntry_.entryId.oneOf(entries.map((e) => e.collectionId).nonNulls.toList()));
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder.build().findAsync();
  }

  Future<LocalDiaryEntry?> readDiaryEntry({int? entryId, int? localId}) {
    if (entryId == null && localId == null) {
      throw Exception('Could not find diary entry. Both remote entry id and local id were null.');
    }
    Condition<LocalDiaryEntry> condition;
    if (entryId != null) {
      condition = LocalDiaryEntry_.entryId.equals(entryId);
    } else {
      condition = LocalDiaryEntry_.localId.equals(localId!);
    }
    final queryBuilder = _store.box<LocalDiaryEntry>().query(condition);
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder.build().findFirstAsync();
  }

  Future<List<LocalFood>> readPendingFoods() async {
    final queryBuilder = _store.box<LocalFood>().query(LocalFood_.pushed.equals(false) & LocalFood_.errorPushing.equals(false));
    return queryBuilder.build().findAsync();
  }

  Future<Map<LocalFood, LocalDiaryEntry?>> searchFoods({required String searchQuery}) async {
    return await _store.runInTransactionAsync(TxMode.read, searchDiaryFoods, searchQuery);
  }

  Future<LocalFood?> findFood({required String name, String? brand}) async {
    Condition<LocalFood> condition = LocalFood_.name.equals(name);
    if (brand != null) {
      condition = condition & LocalFood_.brand.notNull() & LocalFood_.brand.equals(brand);
    }
    return _store.box<LocalFood>().query(condition).build().findFirstAsync();
  }
}

void writeDiaryEntriesAndFoods(Store store, List<LocalDiaryEntry> entries) {
  final foodsBox = store.box<LocalFood>();
  final foods = entries.map((entry) => entry.localFood.target).whereType<LocalFood>().toList();
  final addedFoodsIds = foodsBox.putMany(foods);

  final diaryEntriesBox = store.box<LocalDiaryEntry>();
  final diaryEntries = List.generate(addedFoodsIds.length, (index) {
    final entry = entries[index];
    return entry..localFood.targetId = addedFoodsIds[index];
  });
  diaryEntriesBox.putMany(diaryEntries);
}

Map<LocalFood, LocalDiaryEntry?> searchDiaryFoods(Store store, String searchQuery) {
  final diaryEntriesBox = store.box<LocalDiaryEntry>();
  final loggedFoodsQueryBuilder = diaryEntriesBox
      .query(
        LocalDiaryEntry_.errorPushingEntry.equals(false),
      )
      .order(LocalDiaryEntry_.entryDate, flags: Order.descending);
  loggedFoodsQueryBuilder.link(
      LocalDiaryEntry_.localFood,
      LocalFood_.name.contains(searchQuery, caseSensitive: false) |
          LocalFood_.brand.notNull() & LocalFood_.brand.contains(searchQuery, caseSensitive: false));

  final loggedFoodsEntries = loggedFoodsQueryBuilder.build().find().where((entry) => entry.localFood.target != null);

  Map<LocalFood, LocalDiaryEntry?> resultsMap = Map.fromEntries(
    loggedFoodsEntries.toList().map((entry) => MapEntry(entry.localFood.target!, entry)),
  );

  final foodsBox = store.box<LocalFood>();
  final createdFoodsResults = foodsBox
      .query(LocalFood_.errorPushing.equals(false) & LocalFood_.name.contains(searchQuery, caseSensitive: false) |
          LocalFood_.brand.notNull() & LocalFood_.brand.contains(searchQuery, caseSensitive: false))
      .order(LocalFood_.createdAtDate, flags: Order.descending)
      .build()
      .find();

  resultsMap.addEntries(createdFoodsResults
      .where((food) => resultsMap.keys.none((result) => result.name == food.name && result.brand == food.brand))
      .map((food) => MapEntry(food, null)));

  return resultsMap;
}
