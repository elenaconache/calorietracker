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

  /// `Diary`
  String get diaryTitle {
    return Intl.message(
      'Diary',
      name: 'diaryTitle',
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

  /// `Nutrients`
  String get nutrientsLabel {
    return Intl.message(
      'Nutrients',
      name: 'nutrientsLabel',
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

  /// `Fat`
  String get fatLabel {
    return Intl.message(
      'Fat',
      name: 'fatLabel',
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

  /// `Calories`
  String get caloriesLabel {
    return Intl.message(
      'Calories',
      name: 'caloriesLabel',
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

  /// `Add food`
  String get addFoodLabel {
    return Intl.message(
      'Add food',
      name: 'addFoodLabel',
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

  /// `An error occurred.`
  String get generalErrorMessage {
    return Intl.message(
      'An error occurred.',
      name: 'generalErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Powered by Nutritionix`
  String get poweredByNutritionixLabel {
    return Intl.message(
      'Powered by Nutritionix',
      name: 'poweredByNutritionixLabel',
      desc: '',
      args: [],
    );
  }

  /// `{calories} cal, {servingQuantity} {servingUnit}`
  String caloriesServingShortLabel(
      Object calories, Object servingQuantity, Object servingUnit) {
    return Intl.message(
      '$calories cal, $servingQuantity $servingUnit',
      name: 'caloriesServingShortLabel',
      desc: '',
      args: [calories, servingQuantity, servingUnit],
    );
  }

  /// `Common`
  String get commonLabel {
    return Intl.message(
      'Common',
      name: 'commonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Branded`
  String get brandedLabel {
    return Intl.message(
      'Branded',
      name: 'brandedLabel',
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

  /// `Breakfast`
  String get breakfastLabel {
    return Intl.message(
      'Breakfast',
      name: 'breakfastLabel',
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

  /// `Dinner`
  String get dinnerLabel {
    return Intl.message(
      'Dinner',
      name: 'dinnerLabel',
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

  /// `You didn't log foods for this meal yet.`
  String get noFoodLoggedMessage {
    return Intl.message(
      'You didn\'t log foods for this meal yet.',
      name: 'noFoodLoggedMessage',
      desc: '',
      args: [],
    );
  }

  /// `{calories} cal`
  String caloriesShortLabel(Object calories) {
    return Intl.message(
      '$calories cal',
      name: 'caloriesShortLabel',
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

  /// `Serving size (g)`
  String get servingsLabel {
    return Intl.message(
      'Serving size (g)',
      name: 'servingsLabel',
      desc: '',
      args: [],
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

  /// `Saturated fat`
  String get saturatedFatLabel {
    return Intl.message(
      'Saturated fat',
      name: 'saturatedFatLabel',
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

  /// `Monounsaturated fat`
  String get monounsaturatedFatLabel {
    return Intl.message(
      'Monounsaturated fat',
      name: 'monounsaturatedFatLabel',
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

  /// `Cholesterol`
  String get cholesterolLabel {
    return Intl.message(
      'Cholesterol',
      name: 'cholesterolLabel',
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

  /// `Potassium`
  String get potassiumLabel {
    return Intl.message(
      'Potassium',
      name: 'potassiumLabel',
      desc: '',
      args: [],
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

  /// `Fiber`
  String get fiberLabel {
    return Intl.message(
      'Fiber',
      name: 'fiberLabel',
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

  /// `Vitamin A`
  String get vitaminALabel {
    return Intl.message(
      'Vitamin A',
      name: 'vitaminALabel',
      desc: '',
      args: [],
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

  /// `Calcium`
  String get calciumLabel {
    return Intl.message(
      'Calcium',
      name: 'calciumLabel',
      desc: '',
      args: [],
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

  /// `Vitamin D`
  String get vitaminDLabel {
    return Intl.message(
      'Vitamin D',
      name: 'vitaminDLabel',
      desc: '',
      args: [],
    );
  }

  /// `Carbs {value}g`
  String carbsValue(Object value) {
    return Intl.message(
      'Carbs ${value}g',
      name: 'carbsValue',
      desc: '',
      args: [value],
    );
  }

  /// `Fat {value}g`
  String fatValue(Object value) {
    return Intl.message(
      'Fat ${value}g',
      name: 'fatValue',
      desc: '',
      args: [value],
    );
  }

  /// `Protein {value}g`
  String proteinValue(Object value) {
    return Intl.message(
      'Protein ${value}g',
      name: 'proteinValue',
      desc: '',
      args: [value],
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

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
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

  /// `Carbs {percentage}%`
  String carbsPercentageValue(Object percentage) {
    return Intl.message(
      'Carbs $percentage%',
      name: 'carbsPercentageValue',
      desc: '',
      args: [percentage],
    );
  }

  /// `Fat {percentage}%`
  String fatPercentageValue(Object percentage) {
    return Intl.message(
      'Fat $percentage%',
      name: 'fatPercentageValue',
      desc: '',
      args: [percentage],
    );
  }

  /// `Protein {percentage}%`
  String proteinPercentageValue(Object percentage) {
    return Intl.message(
      'Protein $percentage%',
      name: 'proteinPercentageValue',
      desc: '',
      args: [percentage],
    );
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

  /// `Logout`
  String get logoutLabel {
    return Intl.message(
      'Logout',
      name: 'logoutLabel',
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

  /// `Continue`
  String get continueLabel {
    return Intl.message(
      'Continue',
      name: 'continueLabel',
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

  /// `Could not connect to the server.`
  String get connectionErrorMessage {
    return Intl.message(
      'Could not connect to the server.',
      name: 'connectionErrorMessage',
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

  /// `Food`
  String get foodLabel {
    return Intl.message(
      'Food',
      name: 'foodLabel',
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

  /// `Food name can't be empty.`
  String get emptyFoodNameError {
    return Intl.message(
      'Food name can\'t be empty.',
      name: 'emptyFoodNameError',
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

  /// `Invalid serving size.`
  String get invalidServingError {
    return Intl.message(
      'Invalid serving size.',
      name: 'invalidServingError',
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

  /// `Invalid`
  String get invalidError {
    return Intl.message(
      'Invalid',
      name: 'invalidError',
      desc: '',
      args: [],
    );
  }

  /// `The macronutrients and calories values do not match. Expected calories for these macros: {calories}.`
  String macrosOrCaloriesError(Object calories) {
    return Intl.message(
      'The macronutrients and calories values do not match. Expected calories for these macros: $calories.',
      name: 'macrosOrCaloriesError',
      desc: '',
      args: [calories],
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
  String sumFatsExceedsTotalFatError(Object fat) {
    return Intl.message(
      'The sum of saturated, trans, mono and polyunsaturated fats must not exceed the total fat. Expected minimum fat: $fat.',
      name: 'sumFatsExceedsTotalFatError',
      desc: '',
      args: [fat],
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

  /// `The sum of macronutrients must not exceed the serving size in grams. Expected serving size of at least {servingSize}g.`
  String macrosExceedServingSizeError(Object servingSize) {
    return Intl.message(
      'The sum of macronutrients must not exceed the serving size in grams. Expected serving size of at least ${servingSize}g.',
      name: 'macrosExceedServingSizeError',
      desc: '',
      args: [servingSize],
    );
  }

  /// `Cholesterol must be less than or equal to {cholesterol}mg for this serving size.`
  String cholesterolExceedsMaxPerServingError(Object cholesterol) {
    return Intl.message(
      'Cholesterol must be less than or equal to ${cholesterol}mg for this serving size.',
      name: 'cholesterolExceedsMaxPerServingError',
      desc: '',
      args: [cholesterol],
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

  /// `Salt must be less than or equal to serving size.`
  String get saltExceedsServingSizeError {
    return Intl.message(
      'Salt must be less than or equal to serving size.',
      name: 'saltExceedsServingSizeError',
      desc: '',
      args: [],
    );
  }

  /// `Iron must be less than or equal to {iron}mg for this serving size.`
  String ironExceedsMaxPerServingError(Object iron) {
    return Intl.message(
      'Iron must be less than or equal to ${iron}mg for this serving size.',
      name: 'ironExceedsMaxPerServingError',
      desc: '',
      args: [iron],
    );
  }

  /// `Potassium must be less than or equal to {potassium}mg for this serving size.`
  String potassiumExceedsMaxPerServingError(Object potassium) {
    return Intl.message(
      'Potassium must be less than or equal to ${potassium}mg for this serving size.',
      name: 'potassiumExceedsMaxPerServingError',
      desc: '',
      args: [potassium],
    );
  }

  /// `Calcium must be less than or equal to {calcium}mg for this serving size.`
  String calciumExceedsMaxPerServingError(Object calcium) {
    return Intl.message(
      'Calcium must be less than or equal to ${calcium}mg for this serving size.',
      name: 'calciumExceedsMaxPerServingError',
      desc: '',
      args: [calcium],
    );
  }

  /// `Vitamin A must be less than or equal to {vitaminA} IU for this serving size.`
  String vitaminAExceedsMaxPerServingError(Object vitaminA) {
    return Intl.message(
      'Vitamin A must be less than or equal to $vitaminA IU for this serving size.',
      name: 'vitaminAExceedsMaxPerServingError',
      desc: '',
      args: [vitaminA],
    );
  }

  /// `Vitamin C must be less than or equal to {vitaminC}mg for this serving size.`
  String vitaminCExceedsMaxPerServingError(Object vitaminC) {
    return Intl.message(
      'Vitamin C must be less than or equal to ${vitaminC}mg for this serving size.',
      name: 'vitaminCExceedsMaxPerServingError',
      desc: '',
      args: [vitaminC],
    );
  }

  /// `Vitamin D must be less than or equal to {vitaminD} IU for this serving size.`
  String vitaminDExceedsMaxPerServingError(Object vitaminD) {
    return Intl.message(
      'Vitamin D must be less than or equal to $vitaminD IU for this serving size.',
      name: 'vitaminDExceedsMaxPerServingError',
      desc: '',
      args: [vitaminD],
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

  /// `Fat (g)`
  String get fatGramsLabel {
    return Intl.message(
      'Fat (g)',
      name: 'fatGramsLabel',
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

  /// `Saturated fat (g)`
  String get saturatedFatGramsLabel {
    return Intl.message(
      'Saturated fat (g)',
      name: 'saturatedFatGramsLabel',
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

  /// `Mono fat (g)`
  String get monoFatGramsLabel {
    return Intl.message(
      'Mono fat (g)',
      name: 'monoFatGramsLabel',
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

  /// `Cholesterol (mg)`
  String get cholesterolMgLabel {
    return Intl.message(
      'Cholesterol (mg)',
      name: 'cholesterolMgLabel',
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

  /// `Potassium (mg)`
  String get potassiumMgLabel {
    return Intl.message(
      'Potassium (mg)',
      name: 'potassiumMgLabel',
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

  /// `Iron (mg)`
  String get ironMgLabel {
    return Intl.message(
      'Iron (mg)',
      name: 'ironMgLabel',
      desc: '',
      args: [],
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

  /// `Sugar (g)`
  String get sugarGramsLabel {
    return Intl.message(
      'Sugar (g)',
      name: 'sugarGramsLabel',
      desc: '',
      args: [],
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

  /// `Vitamin C (mg)`
  String get vitaminCMgLabel {
    return Intl.message(
      'Vitamin C (mg)',
      name: 'vitaminCMgLabel',
      desc: '',
      args: [],
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

  /// `Insoluble fiber (g)`
  String get insolubleFiberGramsLabel {
    return Intl.message(
      'Insoluble fiber (g)',
      name: 'insolubleFiberGramsLabel',
      desc: '',
      args: [],
    );
  }

  /// `{grams}g`
  String gramsValue(Object grams) {
    return Intl.message(
      '${grams}g',
      name: 'gramsValue',
      desc: '',
      args: [grams],
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
