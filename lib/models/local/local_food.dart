import 'package:calorietracker/models/local/local_food_base.dart';
import 'package:calorietracker/models/local/local_nutrition.dart';
import 'package:isar/isar.dart';

part 'local_food.g.dart';

@collection
class LocalFood extends LocalFoodBase {
  Id? id;
}
