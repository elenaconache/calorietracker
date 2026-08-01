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
    await database.upsertList<LocalFood>(items: foods);
  }

  Future<int?> _writeFood(LocalFood food) async {
    return database.upsert<LocalFood>(item: food);
  }

  Future<List<LocalFood>> _readPendingFoods() {
    return database.readPendingFoods();
  }

  Future<Map<LocalFood, LocalDiaryEntry?>> searchFood({required String query}) async {
    return database.searchFoods(searchQuery: query);
  }

  Future<int?> findLocalFood({required String name, String? brand}) async {
    final result = await database.findFood(name: name, brand: brand);
    return result?.id;
  }

  Future<LocalFood?> findLocalFoodById({required int id}) {
    return database.findFoodByLocalId(localId: id);
  }

  Future<LocalFood?> findLocalFoodByRemoteId({required int id}) {
    return database.findFoodByRemoteId(remoteId: id);
  }

  Future<List<LocalFood>> findLocalFoodsByRemoteIds({required List<int> ids}) async {
    return await database.findFoodsByRemoteIds(remoteIds: ids);
  }
}
