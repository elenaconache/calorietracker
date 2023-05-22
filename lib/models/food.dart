import 'package:calorietracker/models/measurement_unit.dart';
import 'package:calorietracker/models/nutrition.dart';

class Food {
  final String name;
  final List<MeasurementUnit> units;
  final Nutrition nutrition;

  Food(this.name, this.units, this.nutrition);
}
