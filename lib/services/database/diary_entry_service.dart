import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/meal_entries_list.dart';
import 'package:calorietracker/services/database/database_provider.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

class DiaryEntryService {
  Future<void> upsertDiaryEntries({required List<LocalDiaryEntry> localEntries}) async {
    await compute(_writeDiaryEntries, localEntries).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    });
  }

  Future<void> deleteDiaryEntries({required List<int> localEntries}) async {
    await compute(_deleteDiaryEntries, localEntries).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
    });
  }

  Future<int?> upsertDiaryEntry({required LocalDiaryEntry localDiaryEntry}) async {
    final id = await compute(_writeDiaryEntry, localDiaryEntry).catchError(
      (error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        return null;
      },
    );
    return id;
  }

  Future<int?> _writeDiaryEntry(LocalDiaryEntry entry) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    return db.writeTxnSync(() => db.localDiaryEntrys.putSync(entry));
  }

  Future<void> _writeDiaryEntries(List<LocalDiaryEntry> entries) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    db.writeTxnSync(() => db.localDiaryEntrys.putAllSync(entries));
  }

  Future<void> _deleteDiaryEntries(List<int> entries) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    db.writeTxnSync(() => db.localDiaryEntrys.deleteAllSync(entries));
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntries(List<dynamic> filters) async {
    if (filters.length != 5) {
      throw Exception('Missing filters values for reading diary entries.');
    }

    final filterPending = filters[0] as bool;
    final filterUploadReady = filters[1] as bool;
    final filterPushed = filters[2] as bool;
    final excludeDeleted = filters[3] as bool;
    final dateFilter = filters[4] as DateTime?;

    final db = await Isar.open(localDataSchemas, directory: '');
    return db.localDiaryEntrys
        .filter()
        .optional(filterPending, (q) => q.pushedEqualTo(false))
        .and()
        .optional(
          filterUploadReady,
          (q) {
            return q
                .pushedEqualTo(false)
                .and()
                .localFood(
                  (food) => food.foodIdIsNotNull(),
                )
                .or()
                .deletedEqualTo(true);
          },
        )
        .and()
        .optional(filterPushed, (q) => q.pushedEqualTo(true))
        .and()
        .optional(dateFilter != null, (q) {
          final lowerBoundDate = DateTime(
            dateFilter!.year,
            dateFilter.month,
            dateFilter.day,
          );
          final upperBoundDate = lowerBoundDate.copyWith(hour: 23, minute: 59);
          return q.entryDateBetween(lowerBoundDate, upperBoundDate);
        })
        .and()
        .optional(excludeDeleted, (q) => q.deletedEqualTo(false))
        .findAll();
  }

  Future<List<LocalDiaryEntry>> getDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
  }) async {
    final entries = await compute(_readDiaryEntries, [
      filterPending,
      filterUploadReady,
      filterPushed,
      excludeDeleted,
      dateFilter,
    ]).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
    return entries;
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntriesByIds(List<DiaryEntry> entries) async {
    if (entries.isEmpty) {
      return [];
    }
    final db = await Isar.open(localDataSchemas, directory: '');
    var collection = db.localDiaryEntrys;
    return collection
        .where()
        .filter()
        .anyOf(
          entries,
          (q, entry) => entry.localId != null
              ? q.idEqualTo(entry.localId!)
              : q.entryIdIsNotNull().and().entryIdEqualTo(entry.collectionId),
        )
        .findAll();
  }

  Future<List<LocalDiaryEntry>> getDiaryEntriesByIds({required List<DiaryEntry> entries}) async {
    final localEntries = await compute(_readDiaryEntriesByIds, entries).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
    return localEntries;
  }

  Future<LocalDiaryEntry?> getDiaryEntry({String? collectionId, int? localDiaryEntryId}) async {
    final entry = await compute(_readDiaryEntry, [collectionId, localDiaryEntryId]).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
    return entry;
  }

  Future<LocalDiaryEntry?> _readDiaryEntry(List<dynamic> params) async {
    if (params.length != 2 || params[0] is! String? || params[1] is! int?) {
      throw Exception('Unexpected parameters list while reading diary entry.');
    }
    final collectionId = params[0] as String?;
    final localId = params[1] as int?;
    final db = await Isar.open(localDataSchemas, directory: '');
    if (collectionId != null) {
      return db.localDiaryEntrys.filter().entryIdEqualTo(collectionId).findFirst();
    } else if (localId != null) {
      return db.localDiaryEntrys.filter().idEqualTo(localId).findFirst();
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
    final entries = await (compute(_readDiaryEntries, [
      filterPending,
      false,
      false,
      true,
      dateFilter,
    ])
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
