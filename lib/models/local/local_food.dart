import 'package:isar/isar.dart';

part 'local_food.g.dart';

@collection
class LocalFood {
  Id? id;
  String? barcode;
  late String name;
  String? brand;
  late LocalNutrition nutritionInfo;
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
