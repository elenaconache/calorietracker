import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/nutrient_item.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
import 'package:calorietracker/service/diary_service.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class DayNutritionSummary extends StatelessWidget {
  const DayNutritionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
    return ValueListenableBuilder(
        // TODO: handle selected day when navigation between days is supported
        valueListenable: diaryService.selectedDayMealEntries,
        builder: (context, todayMealEntries, _) => todayMealEntries.status == ApiResponseStatus.loading
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: Center(child: CircularProgressIndicator()),
              )
            : todayMealEntries.status == ApiResponseStatus.error
                ? Text(
                    AppStrings.generalErrorMessage,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NutrientItem(
                          formattedValue: diaryService.selectedDayNutrition.carbohydrates?.toStringAsFixed(1) ?? '0.0', name: AppStrings.carbsLabel),
                      NutrientItem(formattedValue: diaryService.selectedDayNutrition.fat?.toStringAsFixed(1) ?? '0.0', name: AppStrings.fatLabel),
                      NutrientItem(
                          formattedValue: diaryService.selectedDayNutrition.protein?.toStringAsFixed(1) ?? '0.0', name: AppStrings.proteinLabel),
                      NutrientItem(
                          formattedValue: diaryService.selectedDayNutrition.calories?.toStringAsFixed(0) ?? '0', name: AppStrings.caloriesLabel),
                    ],
                  ));
  }
}
