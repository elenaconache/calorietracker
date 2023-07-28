import 'package:calorietracker/extensions/numeric_extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutrition.g.dart';

const _unknownNutrientValue = '-';

@JsonSerializable()
class Nutrition {
  final double? calories;
  final double? fat;
  final double? fatSaturated;
  final double? fatTrans;
  final double? fatPolyunsaturated;
  final double? fatMonounsaturated;
  final double? cholesterol;

  final double? carbohydrates;
  final double? fiber;
  final double? sugar;

  final double? protein;
  final double? sodium;
  final double? potassium;
  final double? calcium;
  final double? iron;
  final double? vitaminA;
  final double? vitaminC;
  final double? vitaminD;

  const Nutrition({
    this.fatSaturated = 0,
    this.fatTrans = 0,
    this.fatPolyunsaturated = 0,
    this.fatMonounsaturated = 0,
    this.cholesterol = 0,
    this.sodium = 0,
    this.potassium = 0,
    this.calcium = 0,
    this.iron = 0,
    this.vitaminA = 0,
    this.vitaminC = 0,
    this.vitaminD = 0,
    this.carbohydrates,
    this.fat,
    this.protein,
    this.calories,
    this.sugar = 0,
    this.fiber = 0,
  });

  Nutrition.perServing({
    required Nutrition nutritionPer100Grams,
    required int servingSizeGrams,
  })  : fat = _getNutrientPerServing(nutritionPer100Grams.fat, servingSizeGrams),
        carbohydrates = _getNutrientPerServing(nutritionPer100Grams.carbohydrates, servingSizeGrams),
        fatSaturated = _getNutrientPerServing(nutritionPer100Grams.fatSaturated, servingSizeGrams),
        fatTrans = _getNutrientPerServing(nutritionPer100Grams.fatTrans, servingSizeGrams),
        fatPolyunsaturated = _getNutrientPerServing(nutritionPer100Grams.fatPolyunsaturated, servingSizeGrams),
        fatMonounsaturated = _getNutrientPerServing(nutritionPer100Grams.fatMonounsaturated, servingSizeGrams),
        cholesterol = _getNutrientPerServing(nutritionPer100Grams.cholesterol, servingSizeGrams),
        sodium = _getNutrientPerServing(nutritionPer100Grams.sodium, servingSizeGrams),
        potassium = _getNutrientPerServing(nutritionPer100Grams.potassium, servingSizeGrams),
        calcium = _getNutrientPerServing(nutritionPer100Grams.calcium, servingSizeGrams),
        iron = _getNutrientPerServing(nutritionPer100Grams.iron, servingSizeGrams),
        vitaminA = _getNutrientPerServing(nutritionPer100Grams.vitaminA, servingSizeGrams),
        vitaminC = _getNutrientPerServing(nutritionPer100Grams.vitaminC, servingSizeGrams),
        vitaminD = _getNutrientPerServing(nutritionPer100Grams.vitaminD, servingSizeGrams),
        protein = _getNutrientPerServing(nutritionPer100Grams.protein, servingSizeGrams),
        calories = _getNutrientPerServing(nutritionPer100Grams.calories, servingSizeGrams),
        sugar = _getNutrientPerServing(nutritionPer100Grams.sugar, servingSizeGrams),
        fiber = _getNutrientPerServing(nutritionPer100Grams.fiber, servingSizeGrams);

  factory Nutrition.fromJson(Map<String, dynamic> json) => _$NutritionFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionToJson(this);

  static double _getNutrientPerServing(double? nutrientPer100Grams, int servingSizeGrams) => (nutrientPer100Grams ?? 0) * servingSizeGrams / 100;

  String get formattedCalories => calories == null ? _unknownNutrientValue : '${calories!.toStringAsFixed(1)} g';

  String get formattedFat => fat == null ? _unknownNutrientValue : '${fat!.toStringAsFixed(1)} g';

  String get formattedSaturatedFat => fatSaturated == null ? _unknownNutrientValue : '${fatSaturated!.toStringAsFixed(1)} g';

  String get formattedPolyunsaturatedFat => fatPolyunsaturated == null ? _unknownNutrientValue : '${fatPolyunsaturated!.toStringAsFixed(1)} g';

  String get formattedMonounsaturatedFat => fatMonounsaturated == null ? _unknownNutrientValue : '${fatMonounsaturated!.toStringAsFixed(1)} g';

  String get formattedTransFat => fatTrans == null ? _unknownNutrientValue : '${fatTrans!.toStringAsFixed(1)} g';

  String get formattedCholesterol => cholesterol == null ? _unknownNutrientValue : '${cholesterol!.toStringAsFixed(1)} mg';

  String get formattedSodium => sodium == null ? _unknownNutrientValue : '${sodium!.toStringAsFixed(1)} mg';

  String get formattedPotassium => potassium == null ? _unknownNutrientValue : '${potassium!.toStringAsFixed(1)} mg';

  String get formattedCarbs => carbohydrates == null ? _unknownNutrientValue : '${carbohydrates!.toStringAsFixed(1)} g';

  String get formattedFiber => fiber == null ? _unknownNutrientValue : '${fiber!.toStringAsFixed(1)} g';

  String get formattedSugar => sugar == null ? _unknownNutrientValue : '${sugar!.toStringAsFixed(1)} g';

  String get formattedProtein => protein == null ? _unknownNutrientValue : '${protein!.toStringAsFixed(1)} g';

  String get formattedVitaminA => vitaminA == null ? _unknownNutrientValue : '${vitaminA!.toStringAsFixed(1)} IU';

  String get formattedVitaminC => vitaminC == null ? _unknownNutrientValue : '${vitaminC!.toStringAsFixed(1)} mg';

  String get formattedCalcium => calcium == null ? _unknownNutrientValue : '${vitaminC!.toStringAsFixed(1)} mg';

  String get formattedIron => iron == null ? _unknownNutrientValue : '${iron!.toStringAsFixed(1)} mg';

  String get formattedVitaminD => vitaminD == null ? _unknownNutrientValue : '${vitaminD!.toStringAsFixed(1)} IU';

  @override
  String toString() {
    return toJson().toString();
  }

  Nutrition round() => Nutrition(
        fat: fat?.toPrecision(2),
        fatSaturated: fatSaturated?.toPrecision(2),
        fatTrans: fatTrans?.toPrecision(2),
        fatPolyunsaturated: fatPolyunsaturated?.toPrecision(2),
        fatMonounsaturated: fatMonounsaturated?.toPrecision(2),
        cholesterol: cholesterol?.toPrecision(2),
        sodium: sodium?.toPrecision(2),
        potassium: potassium?.toPrecision(2),
        calcium: calcium?.toPrecision(2),
        iron: iron?.toPrecision(2),
        vitaminA: vitaminA?.toPrecision(2),
        vitaminC: vitaminC?.toPrecision(2),
        vitaminD: vitaminD?.toPrecision(2),
        carbohydrates: carbohydrates?.toPrecision(2),
        protein: protein?.toPrecision(2),
        calories: calories?.toPrecision(2),
        sugar: sugar?.toPrecision(2),
        fiber: fiber?.toPrecision(2),
      );

  double get _totalMacros => (carbohydrates ?? 0) * 4 + (protein ?? 0) * 4 + (fat ?? 0) * 9;

  int get carbsPercentage => _totalMacros == 0 ? 0 : ((carbohydrates ?? 0) * 4 / _totalMacros * 100).toInt();

  int get fatPercentage => _totalMacros == 0 ? 0 : ((fat ?? 0) * 9 / _totalMacros * 100).toInt();

  int get proteinPercentage => _totalMacros == 0 ? 0 : ((protein ?? 0) * 4 / _totalMacros * 100).toInt();
}
