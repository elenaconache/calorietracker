import 'package:calorietracker/extensions/numeric_extensions.dart';
import 'package:calorietracker/models/local/local_nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutrition.g.dart';

@JsonSerializable()
class Nutrition {
  final double calories;
  final double fat;
  final double fatSaturated;
  final double fatTrans;
  final double fatPolyunsaturated;
  final double fatMonounsaturated;
  final double cholesterol;

  final double carbohydrates;
  final double fiber;
  final double insolubleFiber;
  final double sugar;

  final double protein;
  final double sodium;
  final double potassium;
  final double calcium;
  final double iron;
  final double vitaminA;
  final double vitaminC;
  final double vitaminD;

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
    this.carbohydrates = 0,
    this.fat = 0,
    this.protein = 0,
    this.calories = 0,
    this.sugar = 0,
    this.fiber = 0,
    this.insolubleFiber = 0,
  });

  Nutrition.local({required LocalNutrition localNutrition})
      : fatSaturated = localNutrition.fatSaturated,
        fatTrans = localNutrition.fatTrans,
        fatPolyunsaturated = localNutrition.fatPolyunsaturated,
        fatMonounsaturated = localNutrition.fatMonounsaturated,
        cholesterol = localNutrition.cholesterol,
        sodium = localNutrition.sodium,
        potassium = localNutrition.potassium,
        calcium = localNutrition.calcium,
        iron = localNutrition.iron,
        vitaminA = localNutrition.vitaminA,
        vitaminC = localNutrition.vitaminC,
        vitaminD = localNutrition.vitaminD,
        carbohydrates = localNutrition.carbohydrates,
        fat = localNutrition.fat,
        protein = localNutrition.protein,
        calories = localNutrition.calories,
        sugar = localNutrition.sugar,
        fiber = localNutrition.fiber,
        insolubleFiber = localNutrition.insolubleFiber;

  Nutrition.perServing({
    required Nutrition nutritionPer100Grams,
    required double servingSizeGrams,
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
        fiber = _getNutrientPerServing(nutritionPer100Grams.fiber, servingSizeGrams),
        insolubleFiber = _getNutrientPerServing(nutritionPer100Grams.insolubleFiber, servingSizeGrams);

  Nutrition.fromServing({
    required Nutrition nutritionPerServing,
    required double servingSizeGrams,
  })  : fat = _getNutrientFromServing(nutritionPerServing.fat, servingSizeGrams),
        carbohydrates = _getNutrientFromServing(nutritionPerServing.carbohydrates, servingSizeGrams),
        fatSaturated = _getNutrientFromServing(nutritionPerServing.fatSaturated, servingSizeGrams),
        fatTrans = _getNutrientFromServing(nutritionPerServing.fatTrans, servingSizeGrams),
        fatPolyunsaturated = _getNutrientFromServing(nutritionPerServing.fatPolyunsaturated, servingSizeGrams),
        fatMonounsaturated = _getNutrientFromServing(nutritionPerServing.fatMonounsaturated, servingSizeGrams),
        cholesterol = _getNutrientFromServing(nutritionPerServing.cholesterol, servingSizeGrams),
        sodium = _getNutrientFromServing(nutritionPerServing.sodium, servingSizeGrams),
        potassium = _getNutrientFromServing(nutritionPerServing.potassium, servingSizeGrams),
        calcium = _getNutrientFromServing(nutritionPerServing.calcium, servingSizeGrams),
        iron = _getNutrientFromServing(nutritionPerServing.iron, servingSizeGrams),
        vitaminA = _getNutrientFromServing(nutritionPerServing.vitaminA, servingSizeGrams),
        vitaminC = _getNutrientFromServing(nutritionPerServing.vitaminC, servingSizeGrams),
        vitaminD = _getNutrientFromServing(nutritionPerServing.vitaminD, servingSizeGrams),
        protein = _getNutrientFromServing(nutritionPerServing.protein, servingSizeGrams),
        calories = _getNutrientFromServing(nutritionPerServing.calories, servingSizeGrams),
        sugar = _getNutrientFromServing(nutritionPerServing.sugar, servingSizeGrams),
        fiber = _getNutrientFromServing(nutritionPerServing.fiber, servingSizeGrams),
        insolubleFiber = _getNutrientFromServing(nutritionPerServing.insolubleFiber, servingSizeGrams);

  factory Nutrition.fromJson(Map<String, dynamic> json) => _$NutritionFromJson(json);

  LocalNutrition get localNutrition => LocalNutrition()
    ..fatSaturated = fatSaturated
    ..fatTrans = fatTrans
    ..fatPolyunsaturated = fatPolyunsaturated
    ..fatMonounsaturated = fatMonounsaturated
    ..cholesterol = cholesterol
    ..sodium = sodium
    ..potassium = potassium
    ..calcium = calcium
    ..iron = iron
    ..vitaminA = vitaminA
    ..vitaminC = vitaminC
    ..vitaminD = vitaminD
    ..carbohydrates = carbohydrates
    ..fat = fat
    ..protein = protein
    ..calories = calories
    ..sugar = sugar
    ..fiber = fiber
    ..insolubleFiber = insolubleFiber;

  Map<String, dynamic> toJson() => _$NutritionToJson(this);

  static double _getNutrientPerServing(double? nutrientPer100Grams, double servingSizeGrams) => (nutrientPer100Grams ?? 0) * servingSizeGrams / 100;

  static double _getNutrientFromServing(double? nutrientPerServing, double servingSizeGrams) => (nutrientPerServing ?? 0) / servingSizeGrams * 100;

  String get formattedCalories => '${calories.toStringAsFixed(1)} g';

  String get formattedFat => '${fat.toStringAsFixed(1)} g';

  String get formattedSaturatedFat => '${fatSaturated.toStringAsFixed(1)} g';

  String get formattedPolyunsaturatedFat => '${fatPolyunsaturated.toStringAsFixed(1)} g';

  String get formattedMonounsaturatedFat => '${fatMonounsaturated.toStringAsFixed(1)} g';

  String get formattedTransFat => '${fatTrans.toStringAsFixed(1)} g';

  String get formattedCholesterol => '${cholesterol.toStringAsFixed(1)} mg';

  String get formattedSodium => '${sodium.toStringAsFixed(1)} mg';

  String get formattedPotassium => '${potassium.toStringAsFixed(1)} mg';

  String get formattedCarbs => '${carbohydrates.toStringAsFixed(1)} g';

  String get formattedFiber => '${fiber.toStringAsFixed(1)} g';

  String get formattedSugar => '${sugar.toStringAsFixed(1)} g';

  String get formattedProtein => '${protein.toStringAsFixed(1)} g';

  String get formattedVitaminA => '${vitaminA.toStringAsFixed(1)} IU';

  String get formattedVitaminC => '${vitaminC.toStringAsFixed(1)} mg';

  String get formattedCalcium => '${vitaminC.toStringAsFixed(1)} mg';

  String get formattedIron => '${iron.toStringAsFixed(1)} mg';

  String get formattedVitaminD => '${vitaminD.toStringAsFixed(1)} IU';

  @override
  String toString() {
    return toJson().toString();
  }

  Nutrition round() => Nutrition(
        fat: fat.toPrecision(2),
        fatSaturated: fatSaturated.toPrecision(2),
        fatTrans: fatTrans.toPrecision(2),
        fatPolyunsaturated: fatPolyunsaturated.toPrecision(2),
        fatMonounsaturated: fatMonounsaturated.toPrecision(2),
        cholesterol: cholesterol.toPrecision(2),
        sodium: sodium.toPrecision(2),
        potassium: potassium.toPrecision(2),
        calcium: calcium.toPrecision(2),
        iron: iron.toPrecision(2),
        vitaminA: vitaminA.toPrecision(2),
        vitaminC: vitaminC.toPrecision(2),
        vitaminD: vitaminD.toPrecision(2),
        carbohydrates: carbohydrates.toPrecision(2),
        protein: protein.toPrecision(2),
        calories: calories.toPrecision(2),
        sugar: sugar.toPrecision(2),
        fiber: fiber.toPrecision(2),
        insolubleFiber: insolubleFiber.toPrecision(2),
      );

  double get totalMacrosFromPercentages => carbohydrates * 4 + protein * 4 + fat * 9;

  int get carbsPercentage => totalMacrosFromPercentages == 0 ? 0 : (carbohydrates * 4 / totalMacrosFromPercentages * 100).toInt();

  int get fatPercentage => totalMacrosFromPercentages == 0 ? 0 : (fat * 9 / totalMacrosFromPercentages * 100).toInt();

  int get proteinPercentage => totalMacrosFromPercentages == 0 ? 0 : (protein * 4 / totalMacrosFromPercentages * 100).toInt();

  double get _solubleFiber => fiber > insolubleFiber ? fiber - insolubleFiber : 0;

  double get expectedCalories => (carbohydrates - _solubleFiber) * 4 + _solubleFiber * 2 + protein * 4 + fat * 9;

  double get netCarbs => carbohydrates - fiber;

  String get formattedNetCarbs => '${netCarbs.toStringAsFixed(1)} g';
}
