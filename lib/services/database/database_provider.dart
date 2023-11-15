import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:isar/isar.dart';

const localDataSchemas = [LocalDiaryEntrySchema, LocalFoodSchema];

class DatabaseProvider {
  final String path;

  DatabaseProvider({required this.path});

  Future<Isar> get database async => isOpen ? Isar.getInstance()! : await Isar.open(localDataSchemas, directory: path);

  bool get isOpen => Isar.getInstance()?.isOpen ?? false;
}
