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
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
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
  String caloriesServingShortLabel(Object calories, Object servingQuantity, Object servingUnit) {
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
