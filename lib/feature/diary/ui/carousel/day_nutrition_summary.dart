import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/feature/diary/ui/nutrient_item.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DayNutritionSummary extends StatelessWidget {
  final DiaryState diary;
  const DayNutritionSummary({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return switch (diary.selectedDayMealEntries.status) {
      LoadingStatus _ => const Padding(
          padding: EdgeInsets.all(12),
          child: Center(child: CircularProgressIndicator()),
        ),
      FailureStatus _ => Text(
          AppStrings.generalErrorMessage,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      SuccessStatus _ => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NutrientItem(
              formattedValue: diary.selectedDayNutrition.carbohydrates.toStringAsFixed(1),
              name: AppStrings.carbsLabel,
            ),
            NutrientItem(
              formattedValue: diary.selectedDayNutrition.fat.toStringAsFixed(1),
              name: AppStrings.fatLabel,
            ),
            NutrientItem(
              formattedValue: diary.selectedDayNutrition.protein.toStringAsFixed(1),
              name: AppStrings.proteinLabel,
            ),
            NutrientItem(
              formattedValue: diary.selectedDayNutrition.calories.toStringAsFixed(0),
              name: AppStrings.caloriesLabel,
            ),
          ],
        ),
      _ => const SizedBox.shrink()
    };
  }
}
