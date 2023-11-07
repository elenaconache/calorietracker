import 'package:calorietracker/models/collection/add_local_food_request.dart';
import 'package:calorietracker/models/local/local_food_base.dart';
import 'package:calorietracker/models/local/local_nutrition_base.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:isar/isar.dart';

part 'local_food.g.dart';

@collection
class LocalFood extends LocalFoodBase {
  Id id = Isar.autoIncrement;
  late LocalFoodNutrition nutritionInfo;

  @ignore
  AddLocalFoodRequest get addLocalFoodRequest => AddLocalFoodRequest(
        localId: id,
        name: name,
        nutritionInfo: Nutrition.local(localNutrition: nutritionInfo),
      );

  int compareCreatedAtDateDesc(LocalFood second) => -createdAtDate.compareTo(second.createdAtDate);
}

@embedded
class LocalFoodNutrition extends LocalNutritionBase {}
