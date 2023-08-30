import 'package:calorietracker/models/local/local_food_base.dart';
import 'package:calorietracker/models/local/local_nutrition.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:isar/isar.dart';

part 'local_diary_entry.g.dart';

@collection
class LocalDiaryEntry {
  Id? id;

  String? entryDate;
  late String userId;
  late String unitId;
  LocalDiaryFood? food;
  late int servingQuantity;

  @enumerated
  late Meal meal;

  late bool pushed;

  late bool deleted;
}

@embedded
class LocalDiaryFood extends LocalFoodBase {
  late String? foodId;
}
