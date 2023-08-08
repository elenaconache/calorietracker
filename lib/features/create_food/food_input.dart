import 'package:calorietracker/models/nutrition.dart';

class FoodInput {
  final String? servingSize;
  final String? calories;
  final String? carbs;
  final String? protein;
  final String? fat;
  final String? sugar;
  final String? fiber;
  final String? insolubleFiber;
  final String? saturatedFat;
  final String? transFat;
  final String? monoFat;
  final String? polyFat;
  final String? cholesterol;
  final String? salt;
  final String? iron;
  final String? potassium;
  final String? calcium;
  final String? vitaminA;
  final String? vitaminC;
  final String? vitaminD;

  const FoodInput({
    this.servingSize,
    this.calories,
    this.carbs,
    this.protein,
    this.fat,
    this.sugar,
    this.fiber,
    this.insolubleFiber,
    this.saturatedFat,
    this.transFat,
    this.monoFat,
    this.polyFat,
    this.cholesterol,
    this.salt,
    this.iron,
    this.potassium,
    this.calcium,
    this.vitaminA,
    this.vitaminC,
    this.vitaminD,
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
        sodium: 0.393 * _parseInput(salt) * 1000,
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
    final insolubleFiberValue = _parseInput(insolubleFiber);
    if (carbsValue < fiberValue) {
      totalCarbsValue = carbsValue + fiberValue - insolubleFiberValue;
    } else {
      totalCarbsValue = carbsValue;
    }
    return totalCarbsValue;
  }

  double _parseInput(String? input) => double.tryParse(input ?? '') ?? 0;
}
