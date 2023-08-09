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

class FatsSumExceedsTotalFat extends FoodError {
  final int expectedFat;

  FatsSumExceedsTotalFat(this.expectedFat);
}

class CholesterolExceedsTotalFat extends FoodError {}

// TODO: error if insoluble fiber > fiber
// TODO: error if cholesterol > 10.000mg per 100g serving size
