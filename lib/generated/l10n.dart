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

  /// `Serving size (grams)`
  String get servingsLabel {
    return Intl.message(
      'Serving size (grams)',
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

  /// `Mono fat`
  String get monoFatShortLabel {
    return Intl.message(
      'Mono fat',
      name: 'monoFatShortLabel',
      desc: '',
      args: [],
    );
  }

  /// `Poly fat`
  String get polyFatShortLabel {
    return Intl.message(
      'Poly fat',
      name: 'polyFatShortLabel',
      desc: '',
      args: [],
    );
  }

  /// `Salt`
  String get saltLabel {
    return Intl.message(
      'Salt',
      name: 'saltLabel',
      desc: '',
      args: [],
    );
  }

  /// `These macronutrients are equivalent to {calories} calories.`
  String macrosOrCaloriesError(Object calories) {
    return Intl.message(
      'These macronutrients are equivalent to $calories calories.',
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
