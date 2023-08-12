sealed class FoodError {}

class MacrosNotMatchingCaloriesError extends FoodError {
  final int expectedCalories;

  MacrosNotMatchingCaloriesError(this.expectedCalories);
}

class MacrosNotMatchingServingSizeError extends FoodError {
  final int expectedServingSize;

  MacrosNotMatchingServingSizeError(this.expectedServingSize);
}

class SugarsExceedNetCarbsError extends FoodError {}

class FatsSumExceedsTotalFatError extends FoodError {
  final int expectedFat;

  FatsSumExceedsTotalFatError(this.expectedFat);
}

class CholesterolExceedsTotalFatError extends FoodError {}

class CholesterolExceedsMaxPerServingError extends FoodError {
  final int expectedCholesterolMg;

  CholesterolExceedsMaxPerServingError(this.expectedCholesterolMg);
}

class InsolubleFiberExceedsFiberError extends FoodError {}

class SaltExceedsServingSizeError extends FoodError {}

class IronExceedsMaxIronPerServingError extends FoodError {
  final int expectedIronMg;

  IronExceedsMaxIronPerServingError(this.expectedIronMg);
}

class PotassiumExceedsMaxPotassiumPerServingError extends FoodError {
  final int expectedPotassiumMg;

  PotassiumExceedsMaxPotassiumPerServingError(this.expectedPotassiumMg);
}

class CalciumExceedsMaxCalciumPerServingError extends FoodError {
  final int expectedCalciumMg;

  CalciumExceedsMaxCalciumPerServingError(this.expectedCalciumMg);
}

class VitaminAExceedsMaxPerServingError extends FoodError {
  final int expectedVitaminAIU;

  VitaminAExceedsMaxPerServingError(this.expectedVitaminAIU);
}

class VitaminCExceedsMaxPerServingError extends FoodError {
  final int expectedVitaminCMg;

  VitaminCExceedsMaxPerServingError(this.expectedVitaminCMg);
}

class VitaminDExceedsMaxPerServingError extends FoodError {
  final int expectedVitaminDIU;

  VitaminDExceedsMaxPerServingError(this.expectedVitaminDIU);
}
