import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/models/collection/add_local_diary_entry_request.dart';
import 'package:calorietracker/models/local/local_food_base.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:isar/isar.dart';
import 'local_nutrition_base.dart';

part 'local_diary_entry.g.dart';

@collection
class LocalDiaryEntry {
  Id id = Isar.autoIncrement;

  //TODO: refactor as DateTime object
  late String entryDate;

  late String userId;
  String unitId = gramsUnitId;
  late double servingQuantity;

  @enumerated
  late Meal meal;

  bool pushed = false;
  bool deleted = false;
  bool errorPushing = false;

  late LocalDiaryFood localFood;

  String? entryId;

  @ignore
  AddLocalDiaryEntryRequest get addLocalDiaryEntryRequest => AddLocalDiaryEntryRequest(
        localId: id,
        entryDate: entryDate,
        userId: userId,
        servingQuantity: servingQuantity,
        meal: meal,
        foodId: localFood.foodId!,
        unitId: unitId,
      );
}

@embedded
class LocalDiaryFood extends LocalFoodBase {
  int? localId;
  late LocalDiaryNutrition nutritionInfo;
}

@embedded
class LocalDiaryNutrition extends LocalNutritionBase {}
