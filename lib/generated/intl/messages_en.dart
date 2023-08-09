// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(calories, servingQuantity, servingUnit) =>
      "${calories} cal, ${servingQuantity} ${servingUnit}";

  static String m1(calories) => "${calories} cal";

  static String m2(percentage) => "Carbs ${percentage}%";

  static String m3(value) => "Carbs ${value}g";

  static String m4(percentage) => "Fat ${percentage}%";

  static String m5(value) => "Fat ${value}g";

  static String m6(servingSize) =>
      "The sum of macronutrients must not exceed the serving size in grams. Expected serving size of at least ${servingSize}g.";

  static String m7(calories) =>
      "The macronutrients and calories values do not match. Expected calories for these macros: ${calories}.";

  static String m8(percentage) => "Protein ${percentage}%";

  static String m9(value) => "Protein ${value}g";

  static String m10(fat) =>
      "The sum of saturated, trans, mono and polyunsaturated fats must not exceed the total fat. Expected minimum fat: ${fat}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountsTitle": MessageLookupByLibrary.simpleMessage("Accounts"),
        "addAccountLabel": MessageLookupByLibrary.simpleMessage("Add account"),
        "addFoodLabel": MessageLookupByLibrary.simpleMessage("Add food"),
        "alreadyLoggedInMessage": MessageLookupByLibrary.simpleMessage(
            "You are already logged in with this account."),
        "brandNameLabel":
            MessageLookupByLibrary.simpleMessage("Brand name (optional)"),
        "brandedLabel": MessageLookupByLibrary.simpleMessage("Branded"),
        "breakfastLabel": MessageLookupByLibrary.simpleMessage("Breakfast"),
        "calciumLabel": MessageLookupByLibrary.simpleMessage("Calcium"),
        "caloriesLabel": MessageLookupByLibrary.simpleMessage("Calories"),
        "caloriesServingShortLabel": m0,
        "caloriesShortGenericLabel":
            MessageLookupByLibrary.simpleMessage("cal"),
        "caloriesShortLabel": m1,
        "carbohydratesLabel":
            MessageLookupByLibrary.simpleMessage("Carbohydrates"),
        "carbsLabel": MessageLookupByLibrary.simpleMessage("Carbs"),
        "carbsPercentageValue": m2,
        "carbsValue": m3,
        "cholesterolExceedsFatError": MessageLookupByLibrary.simpleMessage(
            "Cholesterol in grams must be less than or equal to total fat in grams."),
        "cholesterolLabel": MessageLookupByLibrary.simpleMessage("Cholesterol"),
        "commonLabel": MessageLookupByLibrary.simpleMessage("Common"),
        "connectionErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Could not connect to the server."),
        "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
        "createFoodLabel": MessageLookupByLibrary.simpleMessage("Create food"),
        "diaryTitle": MessageLookupByLibrary.simpleMessage("Diary"),
        "dinnerLabel": MessageLookupByLibrary.simpleMessage("Dinner"),
        "emptyFoodNameError":
            MessageLookupByLibrary.simpleMessage("Food name can\'t be empty."),
        "emptyServingError": MessageLookupByLibrary.simpleMessage(
            "Serving size can\'t be empty."),
        "fatLabel": MessageLookupByLibrary.simpleMessage("Fat"),
        "fatPercentageValue": m4,
        "fatValue": m5,
        "fiberLabel": MessageLookupByLibrary.simpleMessage("Fiber"),
        "foodLabel": MessageLookupByLibrary.simpleMessage("Food"),
        "generalErrorMessage":
            MessageLookupByLibrary.simpleMessage("An error occurred."),
        "insolubleFiberLabel":
            MessageLookupByLibrary.simpleMessage("Insoluble fiber"),
        "invalidError": MessageLookupByLibrary.simpleMessage("Invalid"),
        "invalidServingError":
            MessageLookupByLibrary.simpleMessage("Invalid serving size."),
        "ironLabel": MessageLookupByLibrary.simpleMessage("Iron"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "logoutLabel": MessageLookupByLibrary.simpleMessage("Logout"),
        "lunchLabel": MessageLookupByLibrary.simpleMessage("Lunch"),
        "macrosExceedServingSizeError": m6,
        "macrosOrCaloriesError": m7,
        "mealLabel": MessageLookupByLibrary.simpleMessage("Meal"),
        "mealsLabel": MessageLookupByLibrary.simpleMessage("Meals"),
        "monoFatShortLabel": MessageLookupByLibrary.simpleMessage("Mono fat"),
        "monounsaturatedFatLabel":
            MessageLookupByLibrary.simpleMessage("Monounsaturated fat"),
        "noFoodLoggedMessage": MessageLookupByLibrary.simpleMessage(
            "You didn\'t log foods for this meal yet."),
        "noResultsTitle": MessageLookupByLibrary.simpleMessage(
            "There were no results matching your search"),
        "nutrientsLabel": MessageLookupByLibrary.simpleMessage("Nutrients"),
        "polyFatShortLabel": MessageLookupByLibrary.simpleMessage("Poly fat"),
        "polyunsaturatedFatLabel":
            MessageLookupByLibrary.simpleMessage("Polyunsaturated fat"),
        "potassiumLabel": MessageLookupByLibrary.simpleMessage("Potassium"),
        "poweredByNutritionixLabel":
            MessageLookupByLibrary.simpleMessage("Powered by Nutritionix"),
        "proteinLabel": MessageLookupByLibrary.simpleMessage("Protein"),
        "proteinPercentageValue": m8,
        "proteinValue": m9,
        "requiredError": MessageLookupByLibrary.simpleMessage("Required"),
        "saltLabel": MessageLookupByLibrary.simpleMessage("Salt"),
        "saturatedFatLabel":
            MessageLookupByLibrary.simpleMessage("Saturated fat"),
        "searchFoodsLabel": MessageLookupByLibrary.simpleMessage("Search food"),
        "searchForFoodLabel":
            MessageLookupByLibrary.simpleMessage("Search for a food"),
        "servingsLabel":
            MessageLookupByLibrary.simpleMessage("Serving size (grams)"),
        "snacksLabel": MessageLookupByLibrary.simpleMessage("Snacks"),
        "sodiumLabel": MessageLookupByLibrary.simpleMessage("Sodium"),
        "sugarLabel": MessageLookupByLibrary.simpleMessage("Sugar"),
        "sugarsExceedNetCarbsError": MessageLookupByLibrary.simpleMessage(
            "Sugar must be less than or equal to net carbs."),
        "sumFatsExceedsTotalFatError": m10,
        "todayTitle": MessageLookupByLibrary.simpleMessage("Today"),
        "transFatLabel": MessageLookupByLibrary.simpleMessage("Trans fat"),
        "userNotFoundError": MessageLookupByLibrary.simpleMessage(
            "The username you entered was not found."),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
        "vitaminALabel": MessageLookupByLibrary.simpleMessage("Vitamin A"),
        "vitaminCLabel": MessageLookupByLibrary.simpleMessage("Vitamin C"),
        "vitaminDLabel": MessageLookupByLibrary.simpleMessage("Vitamin D")
      };
}
