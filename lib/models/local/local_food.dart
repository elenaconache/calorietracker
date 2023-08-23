import 'package:calorietracker/models/local/local_food_base.dart';
import 'package:isar/isar.dart';

@Collection()
class LocalFood extends LocalFoodBase {
  Id? id;
}
