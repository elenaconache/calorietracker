import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

class DatabaseService {
  Future<int?> insertFood({required LocalFood localFood}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final id = await (compute(_writeFood, MapEntry(pathProvider.path, localFood))
      ..then((_) {
        locator<LoggingService>().info('inserted food ${localFood.name}');
        compute(_readFoods, pathProvider.path)
          ..then((foods) {
            locator<LoggingService>().info('read foods: ${foods.map((food) => food.name)}');
          })
          ..catchError((error, stackTrace) {
            locator<LoggingService>().handle(error, stackTrace);
            return <LocalFood>[];
          });
      }));
    return id;
  }

  Future<int?> _writeFood(MapEntry<String, LocalFood> pair) async {
    final db = await getDatabase(pair.key);
    return db.writeTxnSync(() => db.localFoods.putSync(pair.value));
  }

  Future<List<LocalFood>> _readFoods(String path) async {
    final db = await getDatabase(path);
    return db.localFoods.where().findAll();
  }

  Future<int?> insertDiaryEntry({required LocalDiaryEntry localDiaryEntry}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    final id = await (compute(_writeDiaryEntry, MapEntry(pathProvider.path, localDiaryEntry))
      ..then((_) {
        locator<LoggingService>().info(
            'inserted diary entry ${localDiaryEntry.entryDate}, food id ${localDiaryEntry.foodId}, local food id ${localDiaryEntry.localFoodId}');
        compute(_readDiaryEntries, pathProvider.path)
          ..then((entries) {
            locator<LoggingService>().info('read diary entries: ${entries.map((diaryEntry) => '${localDiaryEntry.entryDate}, food id:'
                '${localDiaryEntry.foodId}, '
                'local food id: ${localDiaryEntry.localFoodId}')}');
          })
          ..catchError((error, stackTrace) {
            locator<LoggingService>().handle(error, stackTrace);
            return <LocalDiaryEntry>[];
          });
      }));
    return id;
  }

  Future<int?> _writeDiaryEntry(MapEntry<String, LocalDiaryEntry> pair) async {
    final db = await getDatabase(pair.key);
    return db.writeTxnSync(() => db.localDiaryEntrys.putSync(pair.value));
  }

  Future<List<LocalDiaryEntry>> _readDiaryEntries(String path) async {
    final db = await getDatabase(path);
    return db.localDiaryEntrys.where().findAll();
  }
}

Future<Isar> getDatabase(String path) async => Isar.open(
      [LocalDiaryEntrySchema, LocalFoodSchema],
      directory: path,
    );
