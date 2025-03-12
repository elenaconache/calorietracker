import 'package:calorietracker/ui/app_strings.dart';
import 'package:json_annotation/json_annotation.dart';

enum Meal {
  @JsonValue('BREAKFAST')
  breakfast,
  @JsonValue('LUNCH')
  lunch,
  @JsonValue('DINNER')
  dinner,
  @JsonValue('SNACKS')
  snacks;

  String get label {
    switch (this) {
      case Meal.breakfast:
        return AppStrings.breakfastLabel;
      case Meal.lunch:
        return AppStrings.lunchLabel;
      case Meal.dinner:
        return AppStrings.dinnerLabel;
      case Meal.snacks:
        return AppStrings.snacksLabel;
    }
  }
}
