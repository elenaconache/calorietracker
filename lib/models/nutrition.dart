class Nutrition {
  final double? calories;
  final double? fat;
  final double fatSaturated;
  final double fatTrans;
  final double fatPolyunsaturated;
  final double fatMonounsaturated;
  final double cholesterol;

  final double? carbohydrates;
  final double fiber;
  final double sugar;

  final double? protein;
  final double sodium;
  final double magnesium;
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
}
