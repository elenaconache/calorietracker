import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/providers/app_path_provider.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

class DatabaseService {
  Future<void> insertFood({required LocalFood localFood}) async {
    final pathProvider = await locator.getAsync<AppPathProvider>();
    await (compute(_writeFood, MapEntry(pathProvider.path, localFood))
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
      })
      ..catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
      }));
  }

  Future<void> _writeFood(MapEntry<String, LocalFood> pair) async {
    final db = await getDatabase(pair.key);
    db.writeTxnSync(() => db.localFoods.putSync(pair.value));
  }

  Future<List<LocalFood>> _readFoods(String path) async {
    final db = await getDatabase(path);
    return db.localFoods.where().findAll();
  }
}

Future<Isar> getDatabase(String path) async => Isar.open(
      [LocalDiaryEntrySchema, LocalFoodSchema],
      directory: path,
    );
