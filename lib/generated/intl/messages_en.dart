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

  static String m0(calcium) =>
      "Calcium must be less than or equal to ${calcium}mg for this serving size.";

  static String m1(calories, servingQuantity, servingUnit) =>
      "${calories} cal, ${servingQuantity} ${servingUnit}";

  static String m2(calories) => "${calories} cal";

  static String m3(percentage) => "Carbs ${percentage}%";

  static String m4(value) => "Carbs ${value}g";

  static String m5(cholesterol) =>
      "Cholesterol must be less than or equal to ${cholesterol}mg for this serving size.";

  static String m6(percentage) => "Fat ${percentage}%";

  static String m7(value) => "Fat ${value}g";

  static String m8(grams) => "${grams}g";

  static String m9(iron) =>
      "Iron must be less than or equal to ${iron}mg for this serving size.";

  static String m10(servingSize) =>
      "The sum of macronutrients must not exceed the serving size in grams. Expected serving size of at least ${servingSize}g.";

  static String m11(calories) =>
      "The macronutrients and calories values do not match. Expected calories for these macros: ${calories}.";

  static String m12(potassium) =>
      "Potassium must be less than or equal to ${potassium}mg for this serving size.";

  static String m13(percentage) => "Protein ${percentage}%";

  static String m14(value) => "Protein ${value}g";

  static String m15(fat) =>
      "The sum of saturated, trans, mono and polyunsaturated fats must not exceed the total fat. Expected minimum fat: ${fat}.";

  static String m16(vitaminA) =>
      "Vitamin A must be less than or equal to ${vitaminA} IU for this serving size.";

  static String m17(vitaminC) =>
      "Vitamin C must be less than or equal to ${vitaminC}mg for this serving size.";

  static String m18(vitaminD) =>
      "Vitamin D must be less than or equal to ${vitaminD} IU for this serving size.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountsTitle": MessageLookupByLibrary.simpleMessage("Accounts"),
        "addAccountLabel": MessageLookupByLibrary.simpleMessage("Add account"),
        "alreadyLoggedInMessage": MessageLookupByLibrary.simpleMessage(
            "You are already logged in with this account."),
        "brandNameLabel":
            MessageLookupByLibrary.simpleMessage("Brand name (optional)"),
        "brandedLabel": MessageLookupByLibrary.simpleMessage("Branded"),
        "breakfastLabel": MessageLookupByLibrary.simpleMessage("Breakfast"),
        "calciumExceedsMaxPerServingError": m0,
        "calciumLabel": MessageLookupByLibrary.simpleMessage("Calcium"),
        "calciumMgLabel": MessageLookupByLibrary.simpleMessage("Calcium (mg)"),
        "caloriesLabel": MessageLookupByLibrary.simpleMessage("Calories"),
        "caloriesServingShortLabel": m1,
        "caloriesShortGenericLabel":
            MessageLookupByLibrary.simpleMessage("cal"),
        "caloriesShortLabel": m2,
        "carbohydratesLabel":
            MessageLookupByLibrary.simpleMessage("Carbohydrates"),
        "carbsGramsLabel": MessageLookupByLibrary.simpleMessage("Carbs (g)"),
        "carbsLabel": MessageLookupByLibrary.simpleMessage("Carbs"),
        "carbsPercentageValue": m3,
        "carbsValue": m4,
        "cholesterolExceedsFatError": MessageLookupByLibrary.simpleMessage(
            "Cholesterol in grams must be less than or equal to total fat in grams."),
        "cholesterolExceedsMaxPerServingError": m5,
        "cholesterolLabel": MessageLookupByLibrary.simpleMessage("Cholesterol"),
        "cholesterolMgLabel":
            MessageLookupByLibrary.simpleMessage("Cholesterol (mg)"),
        "collectionLabel": MessageLookupByLibrary.simpleMessage("Collection"),
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
        "errorAddFood": MessageLookupByLibrary.simpleMessage(
            "Could not save food to diary. Please try again later."),
        "fatGramsLabel": MessageLookupByLibrary.simpleMessage("Fat (g)"),
        "fatLabel": MessageLookupByLibrary.simpleMessage("Fat"),
        "fatPercentageValue": m6,
        "fatValue": m7,
        "fiberGramsLabel": MessageLookupByLibrary.simpleMessage("Fiber (g)"),
        "fiberLabel": MessageLookupByLibrary.simpleMessage("Fiber"),
        "foodLabel": MessageLookupByLibrary.simpleMessage("Food"),
        "generalErrorMessage":
            MessageLookupByLibrary.simpleMessage("An error occurred."),
        "gramsShortLabel": MessageLookupByLibrary.simpleMessage("g"),
        "gramsValue": m8,
        "insolubleFiberExceedsFiberError": MessageLookupByLibrary.simpleMessage(
            "Insoluble fiber must be less than or equal to fiber."),
        "insolubleFiberGramsLabel":
            MessageLookupByLibrary.simpleMessage("Insoluble fiber (g)"),
        "insolubleFiberLabel":
            MessageLookupByLibrary.simpleMessage("Insoluble fiber"),
        "invalidError": MessageLookupByLibrary.simpleMessage("Invalid"),
        "invalidServingError":
            MessageLookupByLibrary.simpleMessage("Invalid serving size."),
        "ironExceedsMaxPerServingError": m9,
        "ironLabel": MessageLookupByLibrary.simpleMessage("Iron"),
        "ironMgLabel": MessageLookupByLibrary.simpleMessage("Iron (mg)"),
        "logFoodLabel": MessageLookupByLibrary.simpleMessage("Log food"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "logoutLabel": MessageLookupByLibrary.simpleMessage("Logout"),
        "lunchLabel": MessageLookupByLibrary.simpleMessage("Lunch"),
        "macrosExceedServingSizeError": m10,
        "macrosOrCaloriesError": m11,
        "mealLabel": MessageLookupByLibrary.simpleMessage("Meal"),
        "mealsLabel": MessageLookupByLibrary.simpleMessage("Meals"),
        "monoFatGramsLabel":
            MessageLookupByLibrary.simpleMessage("Mono fat (g)"),
        "monounsaturatedFatLabel":
            MessageLookupByLibrary.simpleMessage("Monounsaturated fat"),
        "netCarbsLabel": MessageLookupByLibrary.simpleMessage("Net carbs"),
        "noFoodLoggedMessage": MessageLookupByLibrary.simpleMessage(
            "You didn\'t log foods for this meal yet."),
        "noResultsTitle": MessageLookupByLibrary.simpleMessage(
            "There were no results matching your search"),
        "nutrientsLabel": MessageLookupByLibrary.simpleMessage("Nutrients"),
        "polyFatGramsLabel":
            MessageLookupByLibrary.simpleMessage("Poly fat (g)"),
        "polyunsaturatedFatLabel":
            MessageLookupByLibrary.simpleMessage("Polyunsaturated fat"),
        "potassiumExceedsMaxPerServingError": m12,
        "potassiumLabel": MessageLookupByLibrary.simpleMessage("Potassium"),
        "potassiumMgLabel":
            MessageLookupByLibrary.simpleMessage("Potassium (mg)"),
        "poweredByNutritionixLabel":
            MessageLookupByLibrary.simpleMessage("Powered by Nutritionix"),
        "proteinGramsLabel":
            MessageLookupByLibrary.simpleMessage("Protein (g)"),
        "proteinLabel": MessageLookupByLibrary.simpleMessage("Protein"),
        "proteinPercentageValue": m13,
        "proteinValue": m14,
        "requiredError": MessageLookupByLibrary.simpleMessage("Required"),
        "saltExceedsServingSizeError": MessageLookupByLibrary.simpleMessage(
            "Salt must be less than or equal to serving size."),
        "saltGramsLabel": MessageLookupByLibrary.simpleMessage("Salt (g)"),
        "saturatedFatGramsLabel":
            MessageLookupByLibrary.simpleMessage("Saturated fat (g)"),
        "saturatedFatLabel":
            MessageLookupByLibrary.simpleMessage("Saturated fat"),
        "searchFoodsLabel": MessageLookupByLibrary.simpleMessage("Search food"),
        "searchForFoodLabel":
            MessageLookupByLibrary.simpleMessage("Search for a food"),
        "servingsLabel":
            MessageLookupByLibrary.simpleMessage("Serving size (g)"),
        "snacksLabel": MessageLookupByLibrary.simpleMessage("Snacks"),
        "sodiumLabel": MessageLookupByLibrary.simpleMessage("Sodium"),
        "sugarGramsLabel": MessageLookupByLibrary.simpleMessage("Sugar (g)"),
        "sugarLabel": MessageLookupByLibrary.simpleMessage("Sugar"),
        "sugarsExceedNetCarbsError": MessageLookupByLibrary.simpleMessage(
            "Sugar must be less than or equal to net carbs."),
        "sumFatsExceedsTotalFatError": m15,
        "todayTitle": MessageLookupByLibrary.simpleMessage("Today"),
        "transFatGramsLabel":
            MessageLookupByLibrary.simpleMessage("Trans fat (g)"),
        "transFatLabel": MessageLookupByLibrary.simpleMessage("Trans fat"),
        "userNotFoundError": MessageLookupByLibrary.simpleMessage(
            "The username you entered was not found."),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
        "vitaminAExceedsMaxPerServingError": m16,
        "vitaminAIULabel":
            MessageLookupByLibrary.simpleMessage("Vitamin A (IU)"),
        "vitaminALabel": MessageLookupByLibrary.simpleMessage("Vitamin A"),
        "vitaminCExceedsMaxPerServingError": m17,
        "vitaminCLabel": MessageLookupByLibrary.simpleMessage("Vitamin C"),
        "vitaminCMgLabel":
            MessageLookupByLibrary.simpleMessage("Vitamin C (mg)"),
        "vitaminDExceedsMaxPerServingError": m18,
        "vitaminDIULabel":
            MessageLookupByLibrary.simpleMessage("Vitamin D (IU)"),
        "vitaminDLabel": MessageLookupByLibrary.simpleMessage("Vitamin D")
      };
}
