// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Accounts`
  String get accountsTitle {
    return Intl.message(
      'Accounts',
      name: 'accountsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add account`
  String get addAccountLabel {
    return Intl.message(
      'Add account',
      name: 'addAccountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Could not add ingredient to recipe`
  String get addIngredientError {
    return Intl.message(
      'Could not add ingredient to recipe',
      name: 'addIngredientError',
      desc: '',
      args: [],
    );
  }

  /// `Add ingredient`
  String get addIngredientTitle {
    return Intl.message(
      'Add ingredient',
      name: 'addIngredientTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are already logged in with this account.`
  String get alreadyLoggedInMessage {
    return Intl.message(
      'You are already logged in with this account.',
      name: 'alreadyLoggedInMessage',
      desc: '',
      args: [],
    );
  }

  /// `Brand name (optional)`
  String get brandNameLabel {
    return Intl.message(
      'Brand name (optional)',
      name: 'brandNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Breakfast`
  String get breakfastLabel {
    return Intl.message(
      'Breakfast',
      name: 'breakfastLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calcium must be less than or equal to {calcium}mg for this serving size.`
  String calciumExceedsMaxPerServingError(int calcium) {
    return Intl.message(
      'Calcium must be less than or equal to ${calcium}mg for this serving size.',
      name: 'calciumExceedsMaxPerServingError',
      desc: '',
      args: [calcium],
    );
  }

  /// `Calcium`
  String get calciumLabel {
    return Intl.message(
      'Calcium',
      name: 'calciumLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calcium (mg)`
  String get calciumMgLabel {
    return Intl.message(
      'Calcium (mg)',
      name: 'calciumMgLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get caloriesLabel {
    return Intl.message(
      'Calories',
      name: 'caloriesLabel',
      desc: '',
      args: [],
    );
  }

  /// `{calories} cal, {servingQuantity} {servingUnit}`
  String caloriesServingShortLabel(
      String calories, String servingQuantity, String servingUnit) {
    return Intl.message(
      '$calories cal, $servingQuantity $servingUnit',
      name: 'caloriesServingShortLabel',
      desc: '',
      args: [calories, servingQuantity, servingUnit],
    );
  }

  /// `cal`
  String get caloriesShortGenericLabel {
    return Intl.message(
      'cal',
      name: 'caloriesShortGenericLabel',
      desc: '',
      args: [],
    );
  }

  /// `{calories} cal`
  String caloriesShortLabel(int calories) {
    return Intl.message(
      '$calories cal',
      name: 'caloriesShortLabel',
      desc: '',
      args: [calories],
    );
  }

  /// `Carbohydrates`
  String get carbohydratesLabel {
    return Intl.message(
      'Carbohydrates',
      name: 'carbohydratesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Carbs (g)`
  String get carbsGramsLabel {
    return Intl.message(
      'Carbs (g)',
      name: 'carbsGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Carbs`
  String get carbsLabel {
    return Intl.message(
      'Carbs',
      name: 'carbsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Carbs {percentage}%`
  String carbsPercentageValue(int percentage) {
    return Intl.message(
      'Carbs $percentage%',
      name: 'carbsPercentageValue',
      desc: '',
      args: [percentage],
    );
  }

  /// `Carbs {value}g`
  String carbsValue(int value) {
    return Intl.message(
      'Carbs ${value}g',
      name: 'carbsValue',
      desc: '',
      args: [value],
    );
  }

  /// `Cholesterol in grams must be less than or equal to total fat in grams.`
  String get cholesterolExceedsFatError {
    return Intl.message(
      'Cholesterol in grams must be less than or equal to total fat in grams.',
      name: 'cholesterolExceedsFatError',
      desc: '',
      args: [],
    );
  }

  /// `Cholesterol must be less than or equal to {cholesterol}mg for this serving size.`
  String cholesterolExceedsMaxPerServingError(int cholesterol) {
    return Intl.message(
      'Cholesterol must be less than or equal to ${cholesterol}mg for this serving size.',
      name: 'cholesterolExceedsMaxPerServingError',
      desc: '',
      args: [cholesterol],
    );
  }

  /// `Cholesterol`
  String get cholesterolLabel {
    return Intl.message(
      'Cholesterol',
      name: 'cholesterolLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cholesterol (mg)`
  String get cholesterolMgLabel {
    return Intl.message(
      'Cholesterol (mg)',
      name: 'cholesterolMgLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection`
  String get collectionLabel {
    return Intl.message(
      'Collection',
      name: 'collectionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Could not connect to the server.`
  String get connectionErrorMessage {
    return Intl.message(
      'Could not connect to the server.',
      name: 'connectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueLabel {
    return Intl.message(
      'Continue',
      name: 'continueLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cooked quantity (grams)`
  String get cookedQuantityGramsLabel {
    return Intl.message(
      'Cooked quantity (grams)',
      name: 'cookedQuantityGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Could not copy diary logs`
  String get copyDiaryError {
    return Intl.message(
      'Could not copy diary logs',
      name: 'copyDiaryError',
      desc: '',
      args: [],
    );
  }

  /// `Copy diary entries`
  String get copyDiaryTitle {
    return Intl.message(
      'Copy diary entries',
      name: 'copyDiaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create food`
  String get createFoodLabel {
    return Intl.message(
      'Create food',
      name: 'createFoodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create recipe`
  String get createRecipeTitle {
    return Intl.message(
      'Create recipe',
      name: 'createRecipeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete entries`
  String get deleteEntriesTitle {
    return Intl.message(
      'Delete entries',
      name: 'deleteEntriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete entry`
  String get deleteEntryLabel {
    return Intl.message(
      'Delete entry',
      name: 'deleteEntryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Diary`
  String get diaryTitle {
    return Intl.message(
      'Diary',
      name: 'diaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dinner`
  String get dinnerLabel {
    return Intl.message(
      'Dinner',
      name: 'dinnerLabel',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discoverLabel {
    return Intl.message(
      'Discover',
      name: 'discoverLabel',
      desc: '',
      args: [],
    );
  }

  /// `Food name can't be empty.`
  String get emptyFoodNameError {
    return Intl.message(
      'Food name can\'t be empty.',
      name: 'emptyFoodNameError',
      desc: '',
      args: [],
    );
  }

  /// `Recipe name can't be empty`
  String get emptyRecipeNameError {
    return Intl.message(
      'Recipe name can\'t be empty',
      name: 'emptyRecipeNameError',
      desc: '',
      args: [],
    );
  }

  /// `Serving size can't be empty.`
  String get emptyServingError {
    return Intl.message(
      'Serving size can\'t be empty.',
      name: 'emptyServingError',
      desc: '',
      args: [],
    );
  }

  /// `Could not save food to diary. Please try again later.`
  String get errorAddFood {
    return Intl.message(
      'Could not save food to diary. Please try again later.',
      name: 'errorAddFood',
      desc: '',
      args: [],
    );
  }

  /// `Could not save food. Please use a similar food from collection or try again later.`
  String get errorCreateFood {
    return Intl.message(
      'Could not save food. Please use a similar food from collection or try again later.',
      name: 'errorCreateFood',
      desc: '',
      args: [],
    );
  }

  /// `Could not create recipe.`
  String get errorCreatingRecipeMessage {
    return Intl.message(
      'Could not create recipe.',
      name: 'errorCreatingRecipeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error saving entry.`
  String get errorSavingEntry {
    return Intl.message(
      'Error saving entry.',
      name: 'errorSavingEntry',
      desc: '',
      args: [],
    );
  }

  /// `Fat (g)`
  String get fatGramsLabel {
    return Intl.message(
      'Fat (g)',
      name: 'fatGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fat`
  String get fatLabel {
    return Intl.message(
      'Fat',
      name: 'fatLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fat {percentage}%`
  String fatPercentageValue(int percentage) {
    return Intl.message(
      'Fat $percentage%',
      name: 'fatPercentageValue',
      desc: '',
      args: [percentage],
    );
  }

  /// `Fat {value}g`
  String fatValue(int value) {
    return Intl.message(
      'Fat ${value}g',
      name: 'fatValue',
      desc: '',
      args: [value],
    );
  }

  /// `Fiber (g)`
  String get fiberGramsLabel {
    return Intl.message(
      'Fiber (g)',
      name: 'fiberGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fiber`
  String get fiberLabel {
    return Intl.message(
      'Fiber',
      name: 'fiberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get foodLabel {
    return Intl.message(
      'Food',
      name: 'foodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Food logged!`
  String get foodLoggedMessage {
    return Intl.message(
      'Food logged!',
      name: 'foodLoggedMessage',
      desc: '',
      args: [],
    );
  }

  /// `From another day`
  String get fromAnotherDayLabel {
    return Intl.message(
      'From another day',
      name: 'fromAnotherDayLabel',
      desc: '',
      args: [],
    );
  }

  /// `From previous day`
  String get fromPreviousDayLabel {
    return Intl.message(
      'From previous day',
      name: 'fromPreviousDayLabel',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred.`
  String get generalErrorMessage {
    return Intl.message(
      'An error occurred.',
      name: 'generalErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Goal`
  String get goalLabel {
    return Intl.message(
      'Goal',
      name: 'goalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Grams`
  String get gramsLabel {
    return Intl.message(
      'Grams',
      name: 'gramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `g`
  String get gramsShortLabel {
    return Intl.message(
      'g',
      name: 'gramsShortLabel',
      desc: '',
      args: [],
    );
  }

  /// `{grams}g`
  String gramsValue(double grams) {
    return Intl.message(
      '${grams}g',
      name: 'gramsValue',
      desc: '',
      args: [grams],
    );
  }

  /// `Ingredients`
  String get ingredientsTitle {
    return Intl.message(
      'Ingredients',
      name: 'ingredientsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Insoluble fiber must be less than or equal to fiber.`
  String get insolubleFiberExceedsFiberError {
    return Intl.message(
      'Insoluble fiber must be less than or equal to fiber.',
      name: 'insolubleFiberExceedsFiberError',
      desc: '',
      args: [],
    );
  }

  /// `Insoluble fiber (g)`
  String get insolubleFiberGramsLabel {
    return Intl.message(
      'Insoluble fiber (g)',
      name: 'insolubleFiberGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Insoluble fiber`
  String get insolubleFiberLabel {
    return Intl.message(
      'Insoluble fiber',
      name: 'insolubleFiberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Invalid`
  String get invalidError {
    return Intl.message(
      'Invalid',
      name: 'invalidError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid serving size.`
  String get invalidServingError {
    return Intl.message(
      'Invalid serving size.',
      name: 'invalidServingError',
      desc: '',
      args: [],
    );
  }

  /// `Iron must be less than or equal to {iron}mg for this serving size.`
  String ironExceedsMaxPerServingError(int iron) {
    return Intl.message(
      'Iron must be less than or equal to ${iron}mg for this serving size.',
      name: 'ironExceedsMaxPerServingError',
      desc: '',
      args: [iron],
    );
  }

  /// `Iron`
  String get ironLabel {
    return Intl.message(
      'Iron',
      name: 'ironLabel',
      desc: '',
      args: [],
    );
  }

  /// `Iron (mg)`
  String get ironMgLabel {
    return Intl.message(
      'Iron (mg)',
      name: 'ironMgLabel',
      desc: '',
      args: [],
    );
  }

  /// `Left`
  String get leftLabel {
    return Intl.message(
      'Left',
      name: 'leftLabel',
      desc: '',
      args: [],
    );
  }

  /// `Log food`
  String get logFoodLabel {
    return Intl.message(
      'Log food',
      name: 'logFoodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutLabel {
    return Intl.message(
      'Logout',
      name: 'logoutLabel',
      desc: '',
      args: [],
    );
  }

  /// `Lunch`
  String get lunchLabel {
    return Intl.message(
      'Lunch',
      name: 'lunchLabel',
      desc: '',
      args: [],
    );
  }

  /// `Could not save goals. Macros percentages sum must be 100%.`
  String get macroGoalsError {
    return Intl.message(
      'Could not save goals. Macros percentages sum must be 100%.',
      name: 'macroGoalsError',
      desc: '',
      args: [],
    );
  }

  /// `Must be equal to 100%`
  String get macroPercentagesSumMessage {
    return Intl.message(
      'Must be equal to 100%',
      name: 'macroPercentagesSumMessage',
      desc: '',
      args: [],
    );
  }

  /// `The sum of macronutrients must not exceed the serving size in grams. Expected serving size of at least {servingSize}g.`
  String macrosExceedServingSizeError(int servingSize) {
    return Intl.message(
      'The sum of macronutrients must not exceed the serving size in grams. Expected serving size of at least ${servingSize}g.',
      name: 'macrosExceedServingSizeError',
      desc: '',
      args: [servingSize],
    );
  }

  /// `The macronutrients and calories values do not match. Expected calories for these macros: {calories}.`
  String macrosOrCaloriesError(int calories) {
    return Intl.message(
      'The macronutrients and calories values do not match. Expected calories for these macros: $calories.',
      name: 'macrosOrCaloriesError',
      desc: '',
      args: [calories],
    );
  }

  /// `Meal`
  String get mealLabel {
    return Intl.message(
      'Meal',
      name: 'mealLabel',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get mealsLabel {
    return Intl.message(
      'Meals',
      name: 'mealsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Mono fat (g)`
  String get monoFatGramsLabel {
    return Intl.message(
      'Mono fat (g)',
      name: 'monoFatGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Monounsaturated fat`
  String get monounsaturatedFatLabel {
    return Intl.message(
      'Monounsaturated fat',
      name: 'monounsaturatedFatLabel',
      desc: '',
      args: [],
    );
  }

  /// `My goals`
  String get myGoalsLabel {
    return Intl.message(
      'My goals',
      name: 'myGoalsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Net carbs`
  String get netCarbsLabel {
    return Intl.message(
      'Net carbs',
      name: 'netCarbsLabel',
      desc: '',
      args: [],
    );
  }

  /// `You didn't log foods for this meal yet.`
  String get noFoodLoggedMessage {
    return Intl.message(
      'You didn\'t log foods for this meal yet.',
      name: 'noFoodLoggedMessage',
      desc: '',
      args: [],
    );
  }

  /// `There were no results matching your search`
  String get noResultsTitle {
    return Intl.message(
      'There were no results matching your search',
      name: 'noResultsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nutrients`
  String get nutrientsLabel {
    return Intl.message(
      'Nutrients',
      name: 'nutrientsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Nutrition`
  String get nutritionTitle {
    return Intl.message(
      'Nutrition',
      name: 'nutritionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Percentages`
  String get percentagesLabel {
    return Intl.message(
      'Percentages',
      name: 'percentagesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Poly fat (g)`
  String get polyFatGramsLabel {
    return Intl.message(
      'Poly fat (g)',
      name: 'polyFatGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Polyunsaturated fat`
  String get polyunsaturatedFatLabel {
    return Intl.message(
      'Polyunsaturated fat',
      name: 'polyunsaturatedFatLabel',
      desc: '',
      args: [],
    );
  }

  /// `Potassium must be less than or equal to {potassium}mg for this serving size.`
  String potassiumExceedsMaxPerServingError(int potassium) {
    return Intl.message(
      'Potassium must be less than or equal to ${potassium}mg for this serving size.',
      name: 'potassiumExceedsMaxPerServingError',
      desc: '',
      args: [potassium],
    );
  }

  /// `Potassium`
  String get potassiumLabel {
    return Intl.message(
      'Potassium',
      name: 'potassiumLabel',
      desc: '',
      args: [],
    );
  }

  /// `Potassium (mg)`
  String get potassiumMgLabel {
    return Intl.message(
      'Potassium (mg)',
      name: 'potassiumMgLabel',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Protein (g)`
  String get proteinGramsLabel {
    return Intl.message(
      'Protein (g)',
      name: 'proteinGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Protein`
  String get proteinLabel {
    return Intl.message(
      'Protein',
      name: 'proteinLabel',
      desc: '',
      args: [],
    );
  }

  /// `Protein {percentage}%`
  String proteinPercentageValue(int percentage) {
    return Intl.message(
      'Protein $percentage%',
      name: 'proteinPercentageValue',
      desc: '',
      args: [percentage],
    );
  }

  /// `Protein {value}g`
  String proteinValue(int value) {
    return Intl.message(
      'Protein ${value}g',
      name: 'proteinValue',
      desc: '',
      args: [value],
    );
  }

  /// `Recipe details`
  String get recipeDetailsTitle {
    return Intl.message(
      'Recipe details',
      name: 'recipeDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recipe name`
  String get recipeNameLabel {
    return Intl.message(
      'Recipe name',
      name: 'recipeNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recipes`
  String get recipesTitle {
    return Intl.message(
      'Recipes',
      name: 'recipesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get requiredError {
    return Intl.message(
      'Required',
      name: 'requiredError',
      desc: '',
      args: [],
    );
  }

  /// `Salt must be less than or equal to serving size.`
  String get saltExceedsServingSizeError {
    return Intl.message(
      'Salt must be less than or equal to serving size.',
      name: 'saltExceedsServingSizeError',
      desc: '',
      args: [],
    );
  }

  /// `Salt (g)`
  String get saltGramsLabel {
    return Intl.message(
      'Salt (g)',
      name: 'saltGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Saturated fat (g)`
  String get saturatedFatGramsLabel {
    return Intl.message(
      'Saturated fat (g)',
      name: 'saturatedFatGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Saturated fat`
  String get saturatedFatLabel {
    return Intl.message(
      'Saturated fat',
      name: 'saturatedFatLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search food`
  String get searchFoodsLabel {
    return Intl.message(
      'Search food',
      name: 'searchFoodsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search for a food`
  String get searchForFoodLabel {
    return Intl.message(
      'Search for a food',
      name: 'searchForFoodLabel',
      desc: '',
      args: [],
    );
  }

  /// `Search ingredient`
  String get searchIngredientTitle {
    return Intl.message(
      'Search ingredient',
      name: 'searchIngredientTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search for a recipe`
  String get searchRecipeLabel {
    return Intl.message(
      'Search for a recipe',
      name: 'searchRecipeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Serving size (g)`
  String get servingsLabel {
    return Intl.message(
      'Serving size (g)',
      name: 'servingsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Snacks`
  String get snacksLabel {
    return Intl.message(
      'Snacks',
      name: 'snacksLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sodium`
  String get sodiumLabel {
    return Intl.message(
      'Sodium',
      name: 'sodiumLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sugar (g)`
  String get sugarGramsLabel {
    return Intl.message(
      'Sugar (g)',
      name: 'sugarGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sugar`
  String get sugarLabel {
    return Intl.message(
      'Sugar',
      name: 'sugarLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sugar must be less than or equal to net carbs.`
  String get sugarsExceedNetCarbsError {
    return Intl.message(
      'Sugar must be less than or equal to net carbs.',
      name: 'sugarsExceedNetCarbsError',
      desc: '',
      args: [],
    );
  }

  /// `The sum of saturated, trans, mono and polyunsaturated fats must not exceed the total fat. Expected minimum fat: {fat}.`
  String sumFatsExceedsTotalFatError(int fat) {
    return Intl.message(
      'The sum of saturated, trans, mono and polyunsaturated fats must not exceed the total fat. Expected minimum fat: $fat.',
      name: 'sumFatsExceedsTotalFatError',
      desc: '',
      args: [fat],
    );
  }

  /// `Summary for 100g cooked product`
  String get summary100GramsMessage {
    return Intl.message(
      'Summary for 100g cooked product',
      name: 'summary100GramsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Switch account`
  String get switchAccountLabel {
    return Intl.message(
      'Switch account',
      name: 'switchAccountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sync data`
  String get syncDataLabel {
    return Intl.message(
      'Sync data',
      name: 'syncDataLabel',
      desc: '',
      args: [],
    );
  }

  /// `To another day`
  String get toAnotherDayLabel {
    return Intl.message(
      'To another day',
      name: 'toAnotherDayLabel',
      desc: '',
      args: [],
    );
  }

  /// `To today`
  String get toTodayLabel {
    return Intl.message(
      'To today',
      name: 'toTodayLabel',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get todayTitle {
    return Intl.message(
      'Today',
      name: 'todayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrowLabel {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrowLabel',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalLabel {
    return Intl.message(
      'Total',
      name: 'totalLabel',
      desc: '',
      args: [],
    );
  }

  /// `Trans fat (g)`
  String get transFatGramsLabel {
    return Intl.message(
      'Trans fat (g)',
      name: 'transFatGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Trans fat`
  String get transFatLabel {
    return Intl.message(
      'Trans fat',
      name: 'transFatLabel',
      desc: '',
      args: [],
    );
  }

  /// `Could not update diary entry. Please try again later.`
  String get updateLogError {
    return Intl.message(
      'Could not update diary entry. Please try again later.',
      name: 'updateLogError',
      desc: '',
      args: [],
    );
  }

  /// `Data source: USDA FoodData Central`
  String get usdaDataSource {
    return Intl.message(
      'Data source: USDA FoodData Central',
      name: 'usdaDataSource',
      desc: '',
      args: [],
    );
  }

  /// `The username you entered was not found.`
  String get userNotFoundError {
    return Intl.message(
      'The username you entered was not found.',
      name: 'userNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin A must be less than or equal to {vitaminA} IU for this serving size.`
  String vitaminAExceedsMaxPerServingError(int vitaminA) {
    return Intl.message(
      'Vitamin A must be less than or equal to $vitaminA IU for this serving size.',
      name: 'vitaminAExceedsMaxPerServingError',
      desc: '',
      args: [vitaminA],
    );
  }

  /// `Vitamin A (IU)`
  String get vitaminAIULabel {
    return Intl.message(
      'Vitamin A (IU)',
      name: 'vitaminAIULabel',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin A`
  String get vitaminALabel {
    return Intl.message(
      'Vitamin A',
      name: 'vitaminALabel',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin C must be less than or equal to {vitaminC}mg for this serving size.`
  String vitaminCExceedsMaxPerServingError(int vitaminC) {
    return Intl.message(
      'Vitamin C must be less than or equal to ${vitaminC}mg for this serving size.',
      name: 'vitaminCExceedsMaxPerServingError',
      desc: '',
      args: [vitaminC],
    );
  }

  /// `Vitamin C`
  String get vitaminCLabel {
    return Intl.message(
      'Vitamin C',
      name: 'vitaminCLabel',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin C (mg)`
  String get vitaminCMgLabel {
    return Intl.message(
      'Vitamin C (mg)',
      name: 'vitaminCMgLabel',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin D must be less than or equal to {vitaminD} IU for this serving size.`
  String vitaminDExceedsMaxPerServingError(int vitaminD) {
    return Intl.message(
      'Vitamin D must be less than or equal to $vitaminD IU for this serving size.',
      name: 'vitaminDExceedsMaxPerServingError',
      desc: '',
      args: [vitaminD],
    );
  }

  /// `Vitamin D (IU)`
  String get vitaminDIULabel {
    return Intl.message(
      'Vitamin D (IU)',
      name: 'vitaminDIULabel',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin D`
  String get vitaminDLabel {
    return Intl.message(
      'Vitamin D',
      name: 'vitaminDLabel',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterdayLabel {
    return Intl.message(
      'Yesterday',
      name: 'yesterdayLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
