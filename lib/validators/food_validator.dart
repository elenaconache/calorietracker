import 'package:calorietracker/ui/app_strings.dart';

class FoodValidator {
  String? validateMicronutrient(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    }
    if (double.tryParse(text) == null) {
      return AppStrings.invalidError;
    }
    return null;
  }

  String? validateMacro(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredError;
    }
    if (double.tryParse(text) == null) {
      return AppStrings.invalidError;
    }
    return null;
  }

  String? validateCalories(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredError;
    }
    if (int.tryParse(text) == null) {
      return AppStrings.invalidError;
    }
    return null;
  }

  String? validateServingSize(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredError;
    }
    if (double.tryParse(text) == null) {
      return AppStrings.invalidError;
    }
    return null;
  }

  String? validateFoodName(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredError;
    }
    return null;
  }
}
