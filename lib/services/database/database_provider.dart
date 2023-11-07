import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:isar/isar.dart';

const localDataSchemas = [LocalDiaryEntrySchema, LocalFoodSchema];

class DatabaseProvider {
  /// Open Isar database.
  /// The directory can be an empty String when called from a separate isolate
  Future<Isar> getDatabase(String path) async => Isar.open(localDataSchemas, directory: path);

  bool get isOpen => Isar.getInstance()?.isOpen ?? false;
}
