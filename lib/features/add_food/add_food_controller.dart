import 'package:calorietracker/models/meal.dart';
import 'package:flutter/cupertino.dart';

class AddFoodController {
  final ValueNotifier<Meal?> selectedMeal = ValueNotifier(null);

  void selectMeal({required Meal? meal}) => selectedMeal.value = meal;
}
