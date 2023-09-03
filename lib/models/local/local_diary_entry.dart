import 'package:calorietracker/models/meal.dart';
import 'package:isar/isar.dart';

part 'local_diary_entry.g.dart';

@collection
class LocalDiaryEntry {
  Id? id;

  String? entryDate;
  late String userId;
  late String unitId;
  late int servingQuantity;

  @enumerated
  late Meal meal;

  late bool pushed;

  late bool deleted;

  late int? localFoodId;
  late String? foodId;
}
