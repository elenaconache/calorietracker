import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/service/database/database_repository.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FoodService {
  final DatabaseRepository database;

  FoodService({required this.database});

  Future<int?> upsertFood({required LocalFood localFood}) async {
    final id = await _writeFood(localFood).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
      return null;
    });
    getIt<LoggingService>().info('upsert food $localFood');
    return id;
  }

  Future<void> upsertFoods({required List<LocalFood> localFoods}) async {
    await _writeFoods(localFoods).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
    });
    getIt<LoggingService>().info('upsert foods $localFoods');
  }

  Future<List<LocalFood>> getFoodsPendingUpload() async {
    return _readPendingFoods().catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
      return <LocalFood>[];
    });
  }

  Future<void> _writeFoods(List<LocalFood> foods) async {
    List<LocalFood> newFoods = [];
    for (final food in foods) {
      if (await _findLocalFood(name: food.name, brand: food.brand) == null) {
        newFoods.add(food);
      }
    }
    await database.upsertList<LocalFood>(items: newFoods);
  }

  Future<int?> _writeFood(LocalFood food) async {
    final existingId = await _findLocalFood(name: food.name, brand: food.brand);
    if (existingId == null) {
      return database.upsert<LocalFood>(item: food);
    } else {
      return existingId;
    }
  }

  Future<List<LocalFood>> _readPendingFoods() {
    return database.readPendingFoods();
  }

  Future<Map<LocalFood, LocalDiaryEntry?>> searchFood({required String query}) async {
    return database.searchFoods(searchQuery: query);
  }

  Future<int?> _findLocalFood({required String name, String? brand}) async {
    final result = await database.findFood(name: name, brand: brand);
    return result?.id;
  }
}
