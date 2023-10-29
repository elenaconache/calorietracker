import 'package:calorietracker/models/collection/add_food_request.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/nutrition.dart';

class FoodInput {
  final String name;
  final String? brand;
  final String servingSize;
  final String calories;
  final String carbs;
  final String protein;
  final String fat;
  final String sugar;
  final String fiber;
  final String insolubleFiber;
  final String saturatedFat;
  final String transFat;
  final String monoFat;
  final String polyFat;
  final String cholesterol;
  final String salt;
  final String iron;
  final String potassium;
  final String calcium;
  final String vitaminA;
  final String vitaminC;
  final String vitaminD;

  const FoodInput({
    required this.name,
    this.brand,
    required this.servingSize,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.sugar,
    required this.fiber,
    required this.insolubleFiber,
    required this.saturatedFat,
    required this.transFat,
    required this.monoFat,
    required this.polyFat,
    required this.cholesterol,
    required this.salt,
    required this.iron,
    required this.potassium,
    required this.calcium,
    required this.vitaminA,
    required this.vitaminC,
    required this.vitaminD,
  });

  Nutrition get nutrition => Nutrition(
        calories: _parseInput(calories),
        carbohydrates: _totalCarbs,
        protein: _parseInput(protein),
        fat: _parseInput(fat),
        sugar: _parseInput(sugar),
        fiber: _parseInput(fiber),
        insolubleFiber: _parseInput(insolubleFiber),
        fatSaturated: _parseInput(saturatedFat),
        fatTrans: _parseInput(transFat),
        fatMonounsaturated: _parseInput(monoFat),
        fatPolyunsaturated: _parseInput(polyFat),
        cholesterol: _parseInput(cholesterol),
        sodium: 0.393 * saltValue * 1000,
        iron: _parseInput(iron),
        potassium: _parseInput(potassium),
        calcium: _parseInput(calcium),
        vitaminA: _parseInput(vitaminA),
        vitaminC: _parseInput(vitaminC),
        vitaminD: _parseInput(vitaminD),
      );

  double get _totalCarbs {
    final double totalCarbsValue;
    final carbsValue = _parseInput(carbs);
    final fiberValue = _parseInput(fiber);
    if (carbsValue < fiberValue) {
      totalCarbsValue = carbsValue + fiberValue;
    } else {
      totalCarbsValue = carbsValue;
    }
    return totalCarbsValue;
  }

  AddFoodRequest get addFoodRequest => AddFoodRequest(
        barcode: null,
        name: name,
        brand: (brand?.isEmpty ?? true) ? null : brand,
        nutritionInfo: Nutrition.fromServing(
          nutritionPerServing: nutrition,
          servingSizeGrams: servingSizeValue,
        ).round(),
      );

  LocalFood get localFood => LocalFood()
    ..barcode = null
    ..name = name
    ..brand = (brand?.isEmpty ?? true) ? null : brand
    ..nutritionInfo = Nutrition.fromServing(
      nutritionPerServing: nutrition,
      servingSizeGrams: servingSizeValue,
    ).round().localFoodNutrition
    ..createdAtDate = DateTime.now();

  double _parseInput(String input) => double.tryParse(input) ?? 0;

  double get servingSizeValue => _parseInput(servingSize);

  double get saltValue => _parseInput(salt);
}
