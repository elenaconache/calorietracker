import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/collection/add_local_diary_entry_request.dart';
import 'package:calorietracker/shared/model/local/local_food.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/service/date_formatting_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class LocalDiaryEntry {
  @Id(assignable: true)
  int localId = 0;

  @Property(type: PropertyType.date)
  late DateTime entryDate;

  late String username;
  late int unitId;
  late double servingQuantity;

  @Transient()
  Meal? meal;

  int? get dbMeal {
    return meal?.index;
  }

  set dbMeal(int? value) {
    if (value == null) {
      meal = null;
    } else {
      meal = Meal.values.length > value ? Meal.values[value] : Meal.values.first;
    }
  }

  bool pushedEntry = false;
  bool deletedEntry = false;
  bool errorPushingEntry = false;

  final localFood = ToOne<LocalFood>();

  @Unique(onConflict: ConflictStrategy.replace)
  int? entryId;

  LocalDiaryEntry();

  LocalDiaryEntry.withParams({
    this.localId = 0,
    required this.entryDate,
    required this.username,
    this.unitId = gramsUnitId,
    required this.servingQuantity,
    this.pushedEntry = false,
    this.deletedEntry = false,
    this.errorPushingEntry = false,
    required int localFoodId,
    this.entryId,
  }) {
    localFood.targetId = localFoodId;
    // this.localFood.target = localFood;
  }

  // @ignore
  AddLocalDiaryEntryRequest get addLocalDiaryEntryRequest {
    if (!localFood.hasValue) {
      getIt<LoggingService>().info('Missing food for adding diary entry');
    }
    return AddLocalDiaryEntryRequest(
      localId: localId,
      entryDate: getIt<DateFormattingService>().format(
        dateTime: entryDate.toString(),
        format: collectionApiDateFormat,
      ),
      userId: username,
      servingQuantity: servingQuantity,
      meal: meal ?? Meal.values.first,
      foodId: localFood.target?.foodId ?? 0,
      foodUnitId: unitId,
    );
  }
}
