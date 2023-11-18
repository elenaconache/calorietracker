import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/meal_entries_list.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

class DiaryEntryService {
  final Isar database;

  DiaryEntryService({required this.database});

  Future<void> upsertDiaryEntries({required List<LocalDiaryEntry> localEntries, bool pushFoods = false}) async {
    await _writeDiaryEntries(localEntries, pushFoods).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    });
  }

  Future<void> deleteDiaryEntries({required List<int> localEntries}) async {
    await _deleteDiaryEntries(localEntries).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    });
  }

  Future<int?> upsertDiaryEntry({required LocalDiaryEntry localDiaryEntry}) async {
    return _writeDiaryEntry(localDiaryEntry).catchError(
      (error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        return null;
      },
    );
  }

  Future<int?> _writeDiaryEntry(LocalDiaryEntry entry) async {
    return database.writeTxn(() async {
      final id = await database.localDiaryEntrys.put(entry);
      await entry.localFood.save();
      return id;
    });
  }

  Future<void> _writeDiaryEntries(List<LocalDiaryEntry> entries, bool pushFoods) async {
    await database.writeTxn(() async {
      if (pushFoods) {
        final ids = await database.localFoods
            .putAll(entries.map((entry) => entry.localFood.value).whereType<LocalFood>().toList());
        final entriesToUpsert = List.generate(ids.length, (index) {
          final entry = entries[index];
          return entry..localFood.value?.id = ids[index];
        });
        await database.localDiaryEntrys.putAll(entriesToUpsert);
        await Future.wait(entries.map((entry) => entry.localFood.save()));
      } else {
        await database.localDiaryEntrys.putAll(entries);
      }
    });
  }

  Future<void> _deleteDiaryEntries(List<int> entries) async {
    database.writeTxn(() => database.localDiaryEntrys.deleteAll(entries));
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
  }) async {
    final currentUserId = locator<UserService>().selectedUser.value?.id;
    if (currentUserId == null) {
      locator<LoggingService>().info('Could not fetch local diary entries. Missing user id.');
      return [];
    }
    final entries = await database.localDiaryEntrys
        .filter()
        .optional(filterPending, (q) => q.pushedEntryEqualTo(false))
        .and()
        .optional(
          filterUploadReady,
          _filterUploadReadyEntries,
        )
        .and()
        .optional(filterPushed, (q) => q.pushedEntryEqualTo(true))
        .and()
        .optional(dateFilter != null, (q) {
          return _filterEntriesBetweenDate(dateFilter, q);
        })
        .and()
        .optional(excludeDeleted, (q) => q.deletedEntryEqualTo(false))
        .and()
        .userIdEqualTo(currentUserId)
        .findAll();
    for (final entry in entries) {
      await entry.localFood.load();
    }
    return entries;
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition> _filterEntriesBetweenDate(
    DateTime? dateFilter,
    QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> queryBuilder,
  ) {
    final lowerBoundDate = DateTime(
      dateFilter!.year,
      dateFilter.month,
      dateFilter.day,
    );
    final upperBoundDate = lowerBoundDate.copyWith(hour: 23, minute: 59);
    return queryBuilder.entryDateBetween(lowerBoundDate, upperBoundDate);
  }

  QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QAfterFilterCondition> _filterUploadReadyEntries(
    QueryBuilder<LocalDiaryEntry, LocalDiaryEntry, QFilterCondition> queryBuilder,
  ) =>
      queryBuilder
          .pushedEntryEqualTo(false)
          .and()
          .localFood((food) => food.foodIdIsNotNull())
          .or()
          .deletedEntryEqualTo(true);

  Future<List<LocalDiaryEntry>> getDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
  }) async {
    return _readDiaryEntries(
      dateFilter: dateFilter,
      excludeDeleted: excludeDeleted,
      filterPending: filterPending,
      filterUploadReady: filterUploadReady,
      filterPushed: filterPushed,
    ).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntriesByIds(List<DiaryEntry> entries) async {
    if (entries.isEmpty) {
      return [];
    }
    var collection = database.localDiaryEntrys;
    return collection
        .where()
        .filter()
        .anyOf(
          entries,
          (q, entry) => entry.localId != null
              ? q.localIdEqualTo(entry.localId!)
              : q.entryIdIsNotNull().and().entryIdEqualTo(entry.collectionId),
        )
        .findAll();
  }

  Future<List<LocalDiaryEntry>> getDiaryEntriesByIds({required List<DiaryEntry> entries}) async {
    return _readDiaryEntriesByIds(entries).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
  }

  Future<LocalDiaryEntry?> getDiaryEntry({String? collectionId, int? localDiaryEntryId}) async {
    return _readDiaryEntry(collectionId: collectionId, localId: localDiaryEntryId).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
  }

  Future<LocalDiaryEntry?> _readDiaryEntry({String? collectionId, int? localId}) async {
    if (collectionId != null) {
      return database.localDiaryEntrys.filter().entryIdEqualTo(collectionId).findFirst();
    } else if (localId != null) {
      return database.localDiaryEntrys.filter().localIdEqualTo(localId).findFirst();
    } else {
      throw Exception('Missing both collection id and local id for diary entry.');
    }
  }

  Future<List<MealEntriesList>> getDisplayDiaryEntries({required String date, bool filterPending = false}) async {
    final dateFormattingService = locator<DateFormattingService>();
    final formattedDate = dateFormattingService.format(dateTime: date, format: collectionApiDateFormat);
    final dateFilter = dateFormattingService.parse(
      formattedDate: formattedDate,
      format: collectionApiDateFormat,
    );
    final List<LocalDiaryEntry> entries = await _readDiaryEntries(
      dateFilter: dateFilter,
      excludeDeleted: true,
      filterPending: filterPending,
      filterUploadReady: false,
      filterPushed: false,
    ).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
    final map = entries.groupListsBy((element) => element.meal);
    return List.generate(Meal.values.length, (index) {
      final meal = Meal.values[index];
      return MealEntriesList(
        meal: meal,
        diaryEntries: map[meal]
                ?.where((diaryEntry) => diaryEntry.localFood.value != null)
                .map((e) => DiaryEntry.local(localEntry: e))
                .toList() ??
            [],
      );
    });
  }
}
