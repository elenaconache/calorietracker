import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/widgets/dot.dart';
import 'package:flutter/material.dart';

class MealMacros extends StatelessWidget {
  final Meal meal;
  final bool enabledPercentageMode;
  final DiaryState diary;

  const MealMacros({super.key, required this.meal, required this.enabledPercentageMode, required this.diary});

  @override
  Widget build(BuildContext context) {
    if (diary.selectedDayMealEntries.status is FailureStatus) {
      return const SizedBox.shrink();
    }
    final mealNutrition = diary.getMealNutrition(meal: meal);
    return Row(
      children: [
        AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Text(
              enabledPercentageMode
                  ? AppStrings.carbsPercentageValue(mealNutrition.carbsPercentage)
                  : AppStrings.carbsValue(mealNutrition.carbohydrates.toInt()),
              style: Theme.of(context).textTheme.labelMedium,
            )),
        const SizedBox(width: 8),
        const Dot(),
        const SizedBox(width: 8),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Text(
            enabledPercentageMode ? AppStrings.fatPercentageValue(mealNutrition.fatPercentage) : AppStrings.fatValue(mealNutrition.fat.toInt()),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const SizedBox(width: 8),
        const Dot(),
        const SizedBox(width: 8),
        AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Text(
              enabledPercentageMode
                  ? AppStrings.proteinPercentageValue(mealNutrition.proteinPercentage)
                  : AppStrings.proteinValue(mealNutrition.protein.toInt()),
              style: Theme.of(context).textTheme.labelMedium,
            )),
      ],
    );
  }
}
