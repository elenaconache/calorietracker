import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/add_local_diary_entry_request.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:isar/isar.dart';

part 'local_diary_entry.g.dart';

@Collection()
class LocalDiaryEntry {
  Id localId = Isar.autoIncrement;

  late DateTime entryDate;

  late String username;
  int unitId = gramsUnitId;
  late double servingQuantity;

  @enumerated
  late Meal meal;

  bool pushedEntry = false;
  bool deletedEntry = false;
  bool errorPushingEntry = false;

  final localFood = IsarLink<LocalFood>();

  int? entryId;

  @ignore
  AddLocalDiaryEntryRequest get addLocalDiaryEntryRequest {
    if (localFood.value == null) {
      locator<LoggingService>().info('Missing food for adding diary entry');
    }
    return AddLocalDiaryEntryRequest(
      localId: localId,
      entryDate: locator<DateFormattingService>().format(
        dateTime: entryDate.toString(),
        format: collectionApiDateFormat,
      ),
      userId: username,
      servingQuantity: servingQuantity,
      meal: meal,
      foodId: localFood.value?.foodId ?? -1,
      foodUnitId: unitId,
    );
  }
}
