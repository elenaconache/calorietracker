import 'package:calorietracker/ui/strings.dart';

enum Meal {
  breakfast,
  lunch,
  dinner,
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
      default:
        return '';
    }
  }
}
