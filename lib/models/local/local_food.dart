import 'package:calorietracker/models/collection/add_local_food_request.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:isar/isar.dart';

part 'local_food.g.dart';

@Collection()
class LocalFood {
  Id id = Isar.autoIncrement;
  late LocalFoodNutrition nutritionInfo;

  String? barcode;
  late String name;
  String? brand;
  bool pushed = false;
  bool deleted = false;
  bool errorPushing = false;
  int? foodId;
  late DateTime createdAtDate;

  @override
  String toString() {
    return '{barcode: $barcode, name: $name, brand: $brand, pushed: $pushed, deleted: $deleted, errorPushing: $errorPushing, '
        'foodId: $foodId, createdAtDate: $createdAtDate}';
  }

  @ignore
  AddLocalFoodRequest get addLocalFoodRequest => AddLocalFoodRequest(
        localId: id,
        name: name,
        nutritionInfo: Nutrition.local(localNutrition: nutritionInfo),
      );

  int compareCreatedAtDateDesc(LocalFood second) => -createdAtDate.compareTo(second.createdAtDate);
}

@embedded
class LocalFoodNutrition {
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
