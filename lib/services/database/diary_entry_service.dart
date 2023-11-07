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
    final id = await compute(_writeDiaryEntries, localEntries);
    return id;
  }

  Future<void> deleteDiaryEntries({required List<int> localEntries}) async {
    final id = await compute(_deleteDiaryEntries, localEntries);
    return id;
  }

  Future<int?> upsertDiaryEntry({required LocalDiaryEntry localDiaryEntry}) async {
    final id = await compute(_writeDiaryEntry, localDiaryEntry);
    locator<LoggingService>().info('inserted diary entry ${localDiaryEntry.entryDate}, '
        'food id ${localDiaryEntry.localFood.foodId},'
        ' local food id ${localDiaryEntry.localFood.localId}');
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
    db.writeTxn(() => db.localDiaryEntrys.deleteAll(entries));
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntries(dynamic _) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    return db.localDiaryEntrys.where().findAll();
  }

  Future<List<LocalDiaryEntry>> _readUploadReadyDiaryEntries(dynamic _) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    return db.localDiaryEntrys
        .where()
        .filter()
        .pushedEqualTo(false)
        .errorPushingEqualTo(false)
        .localFood((food) => food.foodIdIsNotNull())
        .findAll();
  }

  Future<List<LocalDiaryEntry>> _readPushedDiaryEntries(dynamic _) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    return db.localDiaryEntrys.where().filter().pushedEqualTo(true).findAll();
  }

  Future<List<LocalDiaryEntry>> _readPendingDiaryEntries(dynamic _) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    return db.localDiaryEntrys.where().filter().pushedEqualTo(false).findAll();
  }

  Future<List<LocalDiaryEntry>> _readDayDiaryEntries(DateTime dateFilter) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    final lowerBound = DateTime(
      dateFilter.year,
      dateFilter.month,
      dateFilter.day,
    );
    final upperBound = lowerBound.copyWith(hour: 23, minute: 59);
    return db.localDiaryEntrys.where().filter().entryDateBetween(lowerBound, upperBound).findAll();
  }

  Future<List<LocalDiaryEntry>> _readPendingDayDiaryEntries(DateTime dateFilter) async {
    final db = await Isar.open(localDataSchemas, directory: '');
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
    final entries = await compute(
        filterPushed
            ? _readPushedDiaryEntries
            : filterUploadReady
                ? _readUploadReadyDiaryEntries
                : filterPending
                    ? _readPendingDiaryEntries
                    : _readDiaryEntries,
        {}).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
    return entries;
  }

  Future<LocalDiaryEntry?> getDiaryEntry({required String collectionId}) async {
    final entry = await compute(_readDiaryEntry, collectionId).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      return null;
    });
    return entry;
  }

  Future<LocalDiaryEntry?> _readDiaryEntry(String collectionId) async {
    final db = await Isar.open(localDataSchemas, directory: '');
    return db.localDiaryEntrys.filter().entryIdEqualTo(collectionId).findFirst();
  }

  Future<List<MealEntriesList>> getDisplayDiaryEntries({required String date, bool filterPending = false}) async {
    final dateFormattingService = locator<DateFormattingService>();
    final formattedDate = dateFormattingService.format(dateTime: date, format: collectionApiDateFormat);
    final dateFilter = dateFormattingService.parse(
      formattedDate: formattedDate,
      format: collectionApiDateFormat,
    );
    final entries = await (compute(filterPending ? _readPendingDayDiaryEntries : _readDayDiaryEntries, dateFilter)
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
