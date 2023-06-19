import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class MealTitle extends StatelessWidget {
  final String mealLabel;
  final int mealCalories;

  const MealTitle({super.key, required this.mealLabel, required this.mealCalories});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Text(
        mealLabel,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      )),
      Text(
        AppStrings.caloriesShortLabel(mealCalories),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      )
    ]);
  }
}
