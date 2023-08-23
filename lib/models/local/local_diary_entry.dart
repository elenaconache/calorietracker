import 'package:calorietracker/models/local/local_food_base.dart';
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

@embedded
class LocalNutrition {
  late double calories;
  late double fat;
  late double fatSaturated;
  late double fatTrans;
  late double fatPolyunsaturated;
  late double fatMonounsaturated;
  late double cholesterol;
  late double carbohydrates;
  late double fiber;
  late double insolubleFiber;
  late double sugar;
  late double protein;
  late double sodium;
  late double potassium;
  late double calcium;
  late double iron;
  late double vitaminA;
  late double vitaminC;
  late double vitaminD;
}
