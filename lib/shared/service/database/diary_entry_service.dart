import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/diary_entry.dart';
import 'package:calorietracker/shared/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/model/meal_entries_list.dart';
import 'package:calorietracker/shared/service/database/database_repository.dart';
import 'package:calorietracker/shared/service/date_formatting_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/shared/service/user_service.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DiaryEntryService {
  final DatabaseRepository databaseRepository;

  DiaryEntryService({required this.databaseRepository});

  Future<void> upsertDiaryEntries({required List<LocalDiaryEntry> localEntries, bool pushFoods = false}) async {
    await _writeDiaryEntries(localEntries, pushFoods).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
    });
  }

  Future<void> deleteDiaryEntries({required List<int> localEntries}) async {
    await _deleteDiaryEntries(localEntries).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
    });
  }

  Future<int?> upsertDiaryEntry({required LocalDiaryEntry localDiaryEntry}) async {
    return _writeDiaryEntry(localDiaryEntry).catchError(
      (error, stackTrace) {
        getIt<LoggingService>().handle(error, stackTrace);
        return null;
      },
    );
  }

  Future<int?> _writeDiaryEntry(LocalDiaryEntry entry) async {
    return databaseRepository.upsert(item: entry);
  }

  Future<void> _writeDiaryEntries(List<LocalDiaryEntry> entries, bool pushFoods) async {
    if (pushFoods) {
      await databaseRepository.writeDiaryEntriesRecursively(entries: entries);
    } else {
      await databaseRepository.upsertList(items: entries);
    }
  }

  Future<void> _deleteDiaryEntries(List<int> entries) async {
    await databaseRepository.removeList<LocalDiaryEntry>(ids: entries);
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
    List<int>? localFoodIds,
  }) async {
    final currentUsername = getIt<UserService>().selectedUser.value?.username;
    if (currentUsername == null) {
      getIt<LoggingService>().info('Could not fetch local diary entries. Missing username.');
      return [];
    }

    return databaseRepository.readDiaryEntries(
      username: currentUsername,
      dateFilter: dateFilter,
      filterPending: filterPending,
      excludeDeleted: excludeDeleted,
      filterPushed: filterPushed,
      filterUploadReady: filterUploadReady,
      localFoodIds: localFoodIds,
    );
  }

  Future<List<LocalDiaryEntry>> getDiaryEntries({
    bool filterPending = false,
    bool filterUploadReady = false,
    bool filterPushed = false,
    bool excludeDeleted = false,
    DateTime? dateFilter,
    List<int>? localFoodIds,
  }) async {
    return _readDiaryEntries(
      dateFilter: dateFilter,
      excludeDeleted: excludeDeleted,
      filterPending: filterPending,
      filterUploadReady: filterUploadReady,
      filterPushed: filterPushed,
      localFoodIds: localFoodIds,
    ).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntriesByIds(List<DiaryEntry> entries) async {
    if (entries.isEmpty) {
      return [];
    }

    return databaseRepository.readDiaryEntriesByIds(entries: entries);
  }

  Future<List<LocalDiaryEntry>> getDiaryEntriesByIds({required List<DiaryEntry> entries}) async {
    return _readDiaryEntriesByIds(entries).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
  }

  Future<LocalDiaryEntry?> getDiaryEntry({int? collectionId, int? localDiaryEntryId}) async {
    return _readDiaryEntry(collectionId: collectionId, localId: localDiaryEntryId).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
      return null;
    });
  }

  Future<LocalDiaryEntry?> _readDiaryEntry({int? collectionId, int? localId}) {
    return databaseRepository.readDiaryEntry(entryId: collectionId, localId: localId);
  }

  Future<List<MealEntriesList>> getDisplayDiaryEntries({required String date, bool filterPending = false}) async {
    final dateFormattingService = getIt<DateFormattingService>();
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
      getIt<LoggingService>().handle(error, stackTrace);
      return <LocalDiaryEntry>[];
    });
    final map = entries.groupListsBy((element) => element.meal);
    return List.generate(Meal.values.length, (index) {
      final meal = Meal.values[index];
      return MealEntriesList(
        meal: meal,
        diaryEntries: map[meal]?.map((e) => DiaryEntry.local(localEntry: e)).toList() ?? [],
      );
    });
  }
}
