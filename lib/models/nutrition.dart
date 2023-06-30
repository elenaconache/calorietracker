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
  final double? magnesium;
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
    this.magnesium = 0,
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
        magnesium = _getNutrientPerServing(nutritionPer100Grams.magnesium, servingSizeGrams),
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

  static double _getNutrientPerServing(double? nutrientPer100Grams, int servingSizeGrams) => (nutrientPer100Grams ?? 0) * servingSizeGrams / 100;
}
