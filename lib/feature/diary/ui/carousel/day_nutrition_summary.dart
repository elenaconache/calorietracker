import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/diary/ui/nutrient_item.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DayNutritionSummary extends StatelessWidget {
  const DayNutritionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = getIt<DiaryService>();
    return ValueListenableBuilder(
        valueListenable: diaryService.dayMealEntries,
        builder: (context, todayMealEntries, _) => switch (todayMealEntries) {
              FutureLoading _ => const Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(child: CircularProgressIndicator()),
                ),
              FutureError _ => Text(
                  AppStrings.generalErrorMessage,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              FutureSuccess _ => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NutrientItem(
                      formattedValue: diaryService.selectedDayNutrition.carbohydrates.toStringAsFixed(1),
                      name: AppStrings.carbsLabel,
                    ),
                    NutrientItem(
                      formattedValue: diaryService.selectedDayNutrition.fat.toStringAsFixed(1),
                      name: AppStrings.fatLabel,
                    ),
                    NutrientItem(
                      formattedValue: diaryService.selectedDayNutrition.protein.toStringAsFixed(1),
                      name: AppStrings.proteinLabel,
                    ),
                    NutrientItem(
                      formattedValue: diaryService.selectedDayNutrition.calories.toStringAsFixed(0),
                      name: AppStrings.caloriesLabel,
                    ),
                  ],
                ),
              _ => const SizedBox.shrink()
            });
  }
}
