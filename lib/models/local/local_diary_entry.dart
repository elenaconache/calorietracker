import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/add_local_diary_entry_request.dart';
import 'package:calorietracker/models/local/local_food_base.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:isar/isar.dart';
import 'local_nutrition_base.dart';

part 'local_diary_entry.g.dart';

@collection
class LocalDiaryEntry {
  Id id = Isar.autoIncrement;

  late DateTime entryDate;

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
        entryDate: locator<DateFormattingService>().format(
          dateTime: entryDate.toString(),
          format: collectionApiDateFormat,
        ),
        userId: userId,
        servingQuantity: servingQuantity,
        meal: meal,
        foodId: localFood.foodId!,
        unitId: unitId,
      );

  LocalDiaryEntry copyWith({
    int? id,
    DateTime? entryDate,
    String? userId,
    String? unitId,
    double? servingQuantity,
    Meal? meal,
    bool? pushed,
    bool? deleted,
    bool? errorPushing,
    LocalDiaryFood? localFood,
    String? entryId,
  }) =>
      LocalDiaryEntry()
        ..id = id ?? this.id
        ..entryDate = entryDate ?? this.entryDate
        ..userId = userId ?? this.userId
        ..unitId = unitId ?? this.unitId
        ..servingQuantity = servingQuantity ?? this.servingQuantity
        ..meal = meal ?? this.meal
        ..pushed = pushed ?? this.pushed
        ..deleted = deleted ?? this.deleted
        ..errorPushing = errorPushing ?? this.errorPushing
        ..localFood = localFood ?? this.localFood
        ..entryId = entryId ?? this.entryId;
}

@embedded
class LocalDiaryFood extends LocalFoodBase {
  int? localId;
  late LocalDiaryNutrition nutritionInfo;
}

@embedded
class LocalDiaryNutrition extends LocalNutritionBase {}
