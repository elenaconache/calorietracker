import 'package:calorietracker/shared/extension/numeric_extensions.dart';
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

  // Nutrition.local({required Nutrition localNutrition})
  //     : fatSaturated = localNutrition.fatSaturated.toPrecision(2),
  //       fatTrans = localNutrition.fatTrans.toPrecision(2),
  //       fatPolyunsaturated = localNutrition.fatPolyunsaturated.toPrecision(2),
  //       fatMonounsaturated = localNutrition.fatMonounsaturated.toPrecision(2),
  //       cholesterol = localNutrition.cholesterol.toPrecision(2),
  //       sodium = localNutrition.sodium.toPrecision(2),
  //       potassium = localNutrition.potassium.toPrecision(2),
  //       calcium = localNutrition.calcium.toPrecision(2),
  //       iron = localNutrition.iron.toPrecision(2),
  //       vitaminA = localNutrition.vitaminA.toPrecision(2),
  //       vitaminC = localNutrition.vitaminC.toPrecision(2),
  //       vitaminD = localNutrition.vitaminD.toPrecision(2),
  //       carbohydrates = localNutrition.carbohydrates.toPrecision(2),
  //       fat = localNutrition.fat.toPrecision(2),
  //       protein = localNutrition.protein.toPrecision(2),
  //       calories = localNutrition.calories.toPrecision(2),
  //       sugar = localNutrition.sugar.toPrecision(2),
  //       fiber = localNutrition.fiber.toPrecision(2),
  //       insolubleFiber = localNutrition.insolubleFiber.toPrecision(2);

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
  })  : fat = getNutrientFromServing(nutritionPerServing.fat, servingSizeGrams),
        carbohydrates = getNutrientFromServing(nutritionPerServing.carbohydrates, servingSizeGrams),
        fatSaturated = getNutrientFromServing(nutritionPerServing.fatSaturated, servingSizeGrams),
        fatTrans = getNutrientFromServing(nutritionPerServing.fatTrans, servingSizeGrams),
        fatPolyunsaturated = getNutrientFromServing(nutritionPerServing.fatPolyunsaturated, servingSizeGrams),
        fatMonounsaturated = getNutrientFromServing(nutritionPerServing.fatMonounsaturated, servingSizeGrams),
        cholesterol = getNutrientFromServing(nutritionPerServing.cholesterol, servingSizeGrams),
        sodium = getNutrientFromServing(nutritionPerServing.sodium, servingSizeGrams),
        potassium = getNutrientFromServing(nutritionPerServing.potassium, servingSizeGrams),
        calcium = getNutrientFromServing(nutritionPerServing.calcium, servingSizeGrams),
        iron = getNutrientFromServing(nutritionPerServing.iron, servingSizeGrams),
        vitaminA = getNutrientFromServing(nutritionPerServing.vitaminA, servingSizeGrams),
        vitaminC = getNutrientFromServing(nutritionPerServing.vitaminC, servingSizeGrams),
        vitaminD = getNutrientFromServing(nutritionPerServing.vitaminD, servingSizeGrams),
        protein = getNutrientFromServing(nutritionPerServing.protein, servingSizeGrams),
        calories = getNutrientFromServing(nutritionPerServing.calories, servingSizeGrams),
        sugar = getNutrientFromServing(nutritionPerServing.sugar, servingSizeGrams),
        fiber = getNutrientFromServing(nutritionPerServing.fiber, servingSizeGrams),
        insolubleFiber = getNutrientFromServing(nutritionPerServing.insolubleFiber, servingSizeGrams);

  factory Nutrition.fromJson(Map<String, dynamic> json) => _$NutritionFromJson(json);

  // LocalFoodNutrition get localFoodNutrition => LocalFoodNutrition()
  //   ..fatSaturated = fatSaturated
  //   ..fatTrans = fatTrans
  //   ..fatPolyunsaturated = fatPolyunsaturated
  //   ..fatMonounsaturated = fatMonounsaturated
  //   ..cholesterol = cholesterol
  //   ..sodium = sodium
  //   ..potassium = potassium
  //   ..calcium = calcium
  //   ..iron = iron
  //   ..vitaminA = vitaminA
  //   ..vitaminC = vitaminC
  //   ..vitaminD = vitaminD
  //   ..carbohydrates = carbohydrates
  //   ..fat = fat
  //   ..protein = protein
  //   ..calories = calories
  //   ..sugar = sugar
  //   ..fiber = fiber
  //   ..insolubleFiber = insolubleFiber;

  Map<String, dynamic> toJson() => _$NutritionToJson(this);

  static double _getNutrientPerServing(double? nutrientPer100Grams, double servingSizeGrams) => (nutrientPer100Grams ?? 0) * servingSizeGrams / 100;

  static double getNutrientFromServing(double? nutrientPerServing, double servingSizeGrams) => (nutrientPerServing ?? 0) / servingSizeGrams * 100;

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

  Nutrition add({required Nutrition nutrition}) => Nutrition(
        calcium: nutrition.calcium + calcium,
        calories: nutrition.calories + calories,
        carbohydrates: nutrition.carbohydrates + carbohydrates,
        cholesterol: nutrition.cholesterol + cholesterol,
        fat: nutrition.fat + fat,
        fatMonounsaturated: nutrition.fatMonounsaturated + fatMonounsaturated,
        fatPolyunsaturated: nutrition.fatPolyunsaturated + fatPolyunsaturated,
        fatSaturated: nutrition.fatSaturated + fatSaturated,
        fatTrans: nutrition.fatTrans + fatTrans,
        fiber: nutrition.fiber + fiber,
        insolubleFiber: nutrition.insolubleFiber + insolubleFiber,
        iron: nutrition.iron + iron,
        potassium: nutrition.potassium + potassium,
        protein: nutrition.protein + protein,
        sodium: nutrition.sodium + sodium,
        sugar: nutrition.sugar + sugar,
        vitaminA: nutrition.vitaminA + vitaminA,
        vitaminC: nutrition.vitaminC + vitaminC,
        vitaminD: nutrition.vitaminD + vitaminD,
      );
}
