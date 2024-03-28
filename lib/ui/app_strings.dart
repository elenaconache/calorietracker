import 'package:calorietracker/generated/l10n.dart';

class AppStrings {
  AppStrings._();

  static String get diaryTitle => S.current.diaryTitle;

  static String get todayTitle => S.current.todayTitle;

  static String get nutrientsLabel => S.current.nutrientsLabel;

  static String get carbsLabel => S.current.carbsLabel;

  static String get fatLabel => S.current.fatLabel;

  static String get proteinLabel => S.current.proteinLabel;

  static String get caloriesLabel => S.current.caloriesLabel;

  static String get mealsLabel => S.current.mealsLabel;

  static String get logFoodLabel => S.current.logFoodLabel;

  static String get searchFoodsLabel => S.current.searchFoodsLabel;

  static String get searchForFoodLabel => S.current.searchForFoodLabel;

  static String get generalErrorMessage => S.current.generalErrorMessage;

  static String get poweredByNutritionixLabel => S.current.poweredByNutritionixLabel;

  static String caloriesServingShortLabel(calories, servingQuantity, servingUnit) =>
      S.current.caloriesServingShortLabel(calories, servingQuantity, servingUnit);

  static String get commonLabel => S.current.commonLabel;

  static String get brandedLabel => S.current.brandedLabel;

  static String get noResultsTitle => S.current.noResultsTitle;

  static String get breakfastLabel => S.current.breakfastLabel;

  static String get lunchLabel => S.current.lunchLabel;

  static String get dinnerLabel => S.current.dinnerLabel;

  static String get snacksLabel => S.current.snacksLabel;

  static String get noFoodLoggedMessage => S.current.noFoodLoggedMessage;

  static String caloriesShortLabel(int calories) => S.current.caloriesShortLabel(calories);

  static String get mealLabel => S.current.mealLabel;

  static String get servingsLabel => S.current.servingsLabel;

  static String get caloriesShortGenericLabel => S.current.caloriesShortGenericLabel;

  static String get saturatedFatLabel => S.current.saturatedFatLabel;

  static String get polyunsaturatedFatLabel => S.current.polyunsaturatedFatLabel;

  static String get monounsaturatedFatLabel => S.current.monounsaturatedFatLabel;

  static String get transFatLabel => S.current.transFatLabel;

  static String get cholesterolLabel => S.current.cholesterolLabel;

  static String get sodiumLabel => S.current.sodiumLabel;

  static String get potassiumLabel => S.current.potassiumLabel;

  static String get carbohydratesLabel => S.current.carbohydratesLabel;

  static String get fiberLabel => S.current.fiberLabel;

  static String get sugarLabel => S.current.sugarLabel;

  static String get vitaminALabel => S.current.vitaminALabel;

  static String get vitaminCLabel => S.current.vitaminCLabel;

  static String get calciumLabel => S.current.calciumLabel;

  static String get ironLabel => S.current.ironLabel;

  static String get vitaminDLabel => S.current.vitaminDLabel;

  static String carbsValue(int value) => S.current.carbsValue(value);

  static String fatValue(int value) => S.current.fatValue(value);

  static String proteinValue(int value) => S.current.proteinValue(value);

  static String get loginTitle => S.current.loginTitle;

  static String get usernameLabel => S.current.usernameLabel;

  static String get userNotFoundError => S.current.userNotFoundError;

  static String carbsPercentageValue(int percentage) => S.current.carbsPercentageValue(percentage);

  static String proteinPercentageValue(int percentage) => S.current.proteinPercentageValue(percentage);

  static String fatPercentageValue(int percentage) => S.current.fatPercentageValue(percentage);

  static String get accountsTitle => S.current.accountsTitle;

  static String get logoutLabel => S.current.logoutLabel;

  static String get addAccountLabel => S.current.addAccountLabel;

  static String get continueLabel => S.current.continueLabel;

  static String get alreadyLoggedInMessage => S.current.alreadyLoggedInMessage;

  static String get connectionErrorMessage => S.current.connectionErrorMessage;

  static String get createFoodLabel => S.current.createFoodLabel;

  static String get foodLabel => S.current.foodLabel;

  static String get brandNameLabel => S.current.brandNameLabel;

  static String get emptyFoodNameError => S.current.emptyFoodNameError;

  static String get emptyServingError => S.current.emptyServingError;

  static String get invalidServingError => S.current.invalidServingError;

  static String get requiredError => S.current.requiredError;

  static String get invalidError => S.current.invalidError;

  static String macrosOrCaloriesError(int calories) => S.current.macrosOrCaloriesError(calories);

  static String get insolubleFiberLabel => S.current.insolubleFiberLabel;

  static String get sugarsExceedNetCarbsLabel => S.current.sugarsExceedNetCarbsError;

  static String sumFatsExceedsTotalFatError(int fat) => S.current.sumFatsExceedsTotalFatError(fat);

  static String get cholesterolExceedsFatError => S.current.cholesterolExceedsFatError;

  static String macrosExceedServingSizeError(int servingSize) => S.current.macrosExceedServingSizeError(servingSize);

  static String cholesterolExceedsMaxPerServingError(int expectedCholesterol) =>
      S.current.cholesterolExceedsMaxPerServingError(expectedCholesterol);

  static String get insolubleFiberExceedsFiberError => S.current.insolubleFiberExceedsFiberError;

  static String get saltExceedsServingSizeError => S.current.saltExceedsServingSizeError;

  static String ironExceedsMaxPerServingError(int expectedIron) =>
      S.current.ironExceedsMaxPerServingError(expectedIron);

  static String potassiumExceedsMaxPerServingError(int expectedPotassium) =>
      S.current.potassiumExceedsMaxPerServingError(expectedPotassium);

  static String calciumExceedsMaxPerServingError(int expectedCalcium) =>
      S.current.calciumExceedsMaxPerServingError(expectedCalcium);

  static String vitaminAExceedsMaxPerServingError(int expectedVitaminA) =>
      S.current.vitaminAExceedsMaxPerServingError(expectedVitaminA);

  static String vitaminCExceedsMaxPerServingError(int expectedVitaminC) =>
      S.current.vitaminCExceedsMaxPerServingError(expectedVitaminC);

  static String vitaminDExceedsMaxPerServingError(int expectedVitaminD) =>
      S.current.vitaminDExceedsMaxPerServingError(expectedVitaminD);

  static String get carbsGramsLabel => S.current.carbsGramsLabel;

  static String get fatGramsLabel => S.current.fatGramsLabel;

  static String get proteinGramsLabel => S.current.proteinGramsLabel;

  static String get monoFatGramsLabel => S.current.monoFatGramsLabel;

  static String get polyFatGramsLabel => S.current.polyFatGramsLabel;

  static String get saltGramsLabel => S.current.saltGramsLabel;

  static String get saturatedFatGramsLabel => S.current.saturatedFatGramsLabel;

  static String get transFatGramsLabel => S.current.transFatGramsLabel;

  static String get cholesterolMgLabel => S.current.cholesterolMgLabel;

  static String get potassiumMgLabel => S.current.potassiumMgLabel;

  static String get calciumMgLabel => S.current.calciumMgLabel;

  static String get ironMgLabel => S.current.ironMgLabel;

  static String get fiberGramsLabel => S.current.fiberGramsLabel;

  static String get sugarGramsLabel => S.current.sugarGramsLabel;

  static String get vitaminAIULabel => S.current.vitaminAIULabel;

  static String get vitaminCMgLabel => S.current.vitaminCMgLabel;

  static String get vitaminDIULabel => S.current.vitaminDIULabel;

  static String get insolubleFiberGramsLabel => S.current.insolubleFiberGramsLabel;

  static String gramsValue(double grams) => S.current.gramsValue(grams);

  static String get collectionLabel => S.current.collectionLabel;

  static String get gramsShortLabel => S.current.gramsShortLabel;

  static String get netCarbsLabel => S.current.netCarbsLabel;

  static String get errorAddFood => S.current.errorAddFood;

  static String get errorSavingEntry => S.current.errorSavingEntry;

  static String get profileTitle => S.current.profileTitle;

  static String get switchAccountLabel => S.current.switchAccountLabel;

  static String get syncDataLabel => S.current.syncDataLabel;

  static String get deleteEntryLabel => S.current.deleteEntryLabel;

  static String get deleteEntriesTitle => S.current.deleteEntriesTitle;

  static String get errorCreateFood => S.current.errorCreateFood;

  static String get recipesTitle => S.current.recipesTitle;

  static String get searchRecipeLabel => S.current.searchRecipeLabel;

  static String get createRecipeTitle => S.current.createRecipeTitle;

  static String get recipeNameLabel => S.current.recipeNameLabel;

  static String get ingredientsTitle => S.current.ingredientsTitle;

  static String get searchIngredientTitle => S.current.searchIngredientTitle;

  static String get addIngredientTitle => S.current.addIngredientTitle;

  static String get nutritionTitle => S.current.nutritionTitle;

  static String get cookedQuantityGramsLabel => S.current.cookedQuantityGramsLabel;

  static String get summary100GramsMessage => S.current.summary100GramsMessage;

  static String get errorCreatingRecipeMessage => S.current.errorCreatingRecipeMessage;

  static String get emptyRecipeNameError => S.current.emptyRecipeNameError;

  static String get addIngredientError => S.current.addIngredientError;

  static String get recipeDetailsTitle => S.current.recipeDetailsTitle;

  static String get yesterdayLabel => S.current.yesterdayLabel;

  static String get tomorrowLabel => S.current.tomorrowLabel;

  static String get copyDiaryTitle => S.current.copyDiaryTitle;

  static String get fromAnotherDayLabel => S.current.fromAnotherDayLabel;

  static String get fromPreviousDayLabel => S.current.fromPreviousDayLabel;

  static String get copyDiaryError => S.current.copyDiaryError;

  static String get toAnotherDayLabel => S.current.toAnotherDayLabel;

  static String get toTodayLabel => S.current.toTodayLabel;
}
