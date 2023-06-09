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

  static String m0(calories, servingQuantity, servingUnit) => "${calories} cal, ${servingQuantity} ${servingUnit}";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addFoodLabel": MessageLookupByLibrary.simpleMessage("Add food"),
        "brandedLabel": MessageLookupByLibrary.simpleMessage("Branded"),
        "caloriesLabel": MessageLookupByLibrary.simpleMessage("Calories"),
        "caloriesServingShortLabel": m0,
        "carbsLabel": MessageLookupByLibrary.simpleMessage("Carbs"),
        "commonLabel": MessageLookupByLibrary.simpleMessage("Common"),
        "diaryTitle": MessageLookupByLibrary.simpleMessage("Diary"),
        "fatLabel": MessageLookupByLibrary.simpleMessage("Fat"),
        "generalErrorMessage": MessageLookupByLibrary.simpleMessage("An error occurred."),
        "mealsLabel": MessageLookupByLibrary.simpleMessage("Meals"),
        "noResultsTitle": MessageLookupByLibrary.simpleMessage("There were no results matching your search"),
        "nutrientsLabel": MessageLookupByLibrary.simpleMessage("Nutrients"),
        "poweredByNutritionixLabel": MessageLookupByLibrary.simpleMessage("Powered by Nutritionix"),
        "proteinLabel": MessageLookupByLibrary.simpleMessage("Protein"),
        "searchFoodsLabel": MessageLookupByLibrary.simpleMessage("Search food"),
        "searchForFoodLabel": MessageLookupByLibrary.simpleMessage("Search for a food"),
        "todayTitle": MessageLookupByLibrary.simpleMessage("Today")
      };
}
