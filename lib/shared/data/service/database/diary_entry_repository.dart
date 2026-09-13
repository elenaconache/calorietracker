import 'dart:async';

import 'package:calorietracker/objectbox.g.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/service/database/database_service.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart' hide Order;

@lazySingleton
class DiaryEntryRepository {
  final DatabaseService _databaseService;

  DiaryEntryRepository(this._databaseService);

  Box<LocalDiaryEntry> get _diaryBox =>
      _databaseService.store.box<LocalDiaryEntry>();

  void upsertList({required List<LocalDiaryEntry> localEntries}) {
    _diaryBox.putMany(localEntries);
  }

  int upsert({required LocalDiaryEntry localDiaryEntry}) {
    return _diaryBox.put(localDiaryEntry);
  }

  void deleteList(List<int> entries) {
    _diaryBox.removeMany(entries);
  }

  List<LocalDiaryEntry> getList({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
    List<int>? localFoodIds,
    required String username,
  }) {
    Condition<LocalDiaryEntry> condition = LocalDiaryEntry_.username.equals(
      username,
    );
    if (filterPending) {
      condition = condition & LocalDiaryEntry_.pushedEntry.equals(false);
    }
    if (filterUploadReady) {
      condition =
          condition &
          (LocalDiaryEntry_.pushedEntry.equals(false) &
                  LocalDiaryEntry_.localFood.notNull() |
              LocalDiaryEntry_.deletedEntry.equals(true));
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
      condition =
          condition &
          LocalDiaryEntry_.entryDate.betweenDate(
            lowerBoundDate,
            upperBoundDate,
          );
    }
    if (excludeDeleted) {
      condition = condition & LocalDiaryEntry_.deletedEntry.equals(false);
    }

    final queryBuilder = _diaryBox.query(condition);
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder
        .build()
        .find()
        .where(
          (element) =>
              (localFoodIds?.isEmpty ?? true) ||
              localFoodIds!.contains(element.localFood.targetId),
        )
        .toList();
  }

  List<LocalDiaryEntry> getListByIds(List<DiaryEntry> entries) {
    if (entries.isEmpty) {
      return [];
    }

    final queryBuilder = _diaryBox.query(
      LocalDiaryEntry_.localId.oneOf(
            entries.map((e) => e.localId).nonNulls.toList(),
          ) |
          LocalDiaryEntry_.entryId.oneOf(
            entries.map((e) => e.collectionId).nonNulls.toList(),
          ),
    );
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder.build().find();
  }

  LocalDiaryEntry? getSingle({int? collectionId, int? localDiaryEntryId}) {
    if (collectionId == null && localDiaryEntryId == null) {
      throw Exception(
        'Could not find diary entry. Both remote entry id and local id were null.',
      );
    }
    Condition<LocalDiaryEntry> condition;
    if (collectionId != null) {
      condition = LocalDiaryEntry_.entryId.equals(collectionId);
    } else {
      condition = LocalDiaryEntry_.localId.equals(localDiaryEntryId!);
    }
    final queryBuilder = _diaryBox.query(condition);
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder.build().findFirst();
  }

  List<LocalDiaryEntry> getDisplayDiaryEntries({
    required DateTime date,
    required String username,
    bool filterPending = false,
  }) {
    // final dateFormattingService = getIt<DateFormattingService>();
    // final dateFilter = dateFormattingService.parse(formattedDate: formattedDate, format: collectionApiDateFormat);

    return getList(
      username: username,
      dateFilter: date,
      excludeDeleted: true,
      filterPending: filterPending,
      filterUploadReady: false,
      filterPushed: false,
    );
  }

  Stream<List<LocalDiaryEntry>> watchDisplayDiaryEntries({
    required DateTime date,
    required String username,
  }) {
    Condition<LocalDiaryEntry> condition = LocalDiaryEntry_.username
        .equals(username)
        .and(LocalDiaryEntry_.deletedEntry.equals(false));

    final lowerBoundDate = DateTime(date.year, date.month, date.day);
    final upperBoundDate = lowerBoundDate.copyWith(hour: 23, minute: 59);
    condition =
        condition &
        LocalDiaryEntry_.entryDate.betweenDate(lowerBoundDate, upperBoundDate);

    final queryBuilder = _diaryBox.query(condition);
    queryBuilder.link(LocalDiaryEntry_.localFood);
    return queryBuilder.watch(triggerImmediately: true).map((query) {
      return query.find();
    });
  }

  Map<LocalFood, LocalDiaryEntry?> searchDiaryFoods(
    Store store,
    String searchQuery,
  ) {
    final diaryEntriesBox = store.box<LocalDiaryEntry>();
    final loggedFoodsQueryBuilder = diaryEntriesBox
        .query(LocalDiaryEntry_.errorPushingEntry.equals(false))
        .order(LocalDiaryEntry_.entryDate, flags: Order.descending);
    loggedFoodsQueryBuilder.link(
      LocalDiaryEntry_.localFood,
      LocalFood_.name.contains(searchQuery, caseSensitive: false) |
          LocalFood_.brand.notNull() &
              LocalFood_.brand.contains(searchQuery, caseSensitive: false),
    );

    final loggedFoodsEntries = loggedFoodsQueryBuilder.build().find().where(
      (entry) => entry.localFood.target != null,
    );

    Map<LocalFood, LocalDiaryEntry?> resultsMap = {};

    for (final entry in loggedFoodsEntries) {
      if (entry.localFood.target != null &&
          resultsMap.keys.none((key) => key.id == entry.localFood.targetId)) {
        resultsMap[entry.localFood.target!] = entry;
      }
    }

    return resultsMap;
  }
}
