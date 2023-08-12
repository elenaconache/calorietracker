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
