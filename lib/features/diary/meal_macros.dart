import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/dot.dart';
import 'package:flutter/material.dart';

class MealMacros extends StatelessWidget {
  final Meal meal;
  final bool enabledPercentageMode;

  const MealMacros({super.key, required this.meal, required this.enabledPercentageMode});

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
    return ValueListenableBuilder(
        valueListenable: diaryService.selectedDayMealEntries,
        builder: (context, _, __) {
          if (diaryService.selectedDayMealEntries.value.status == ApiResponseStatus.error) {
            return const SizedBox.shrink();
          }
          final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
          return Row(
            children: [
              AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    enabledPercentageMode
                        ? AppStrings.carbsPercentageValue(mealNutrition.carbsPercentage)
                        : AppStrings.carbsValue(mealNutrition.carbohydrates?.toInt() ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
              const SizedBox(width: 8),
              const Dot(),
              const SizedBox(width: 8),
              AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    enabledPercentageMode
                        ? AppStrings.fatPercentageValue(mealNutrition.fatPercentage)
                        : AppStrings.fatValue(mealNutrition.fat?.toInt() ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
              const SizedBox(width: 8),
              const Dot(),
              const SizedBox(width: 8),
              AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    enabledPercentageMode
                        ? AppStrings.proteinPercentageValue(mealNutrition.proteinPercentage)
                        : AppStrings.proteinValue(mealNutrition.protein?.toInt() ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
            ],
          );
        });
  }
}
