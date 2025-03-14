import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/dot.dart';
import 'package:flutter/material.dart';

class MealMacros extends StatelessWidget {
  final Meal meal;
  final bool enabledPercentageMode;

  const MealMacros({super.key, required this.meal, required this.enabledPercentageMode});

  @override
  Widget build(BuildContext context) {
    final diaryService = getIt<DiaryService>();
    return ValueListenableBuilder(
        valueListenable: diaryService.dayMealEntries,
        builder: (context, dayMealEntries, __) {
          if (dayMealEntries is FutureError) {
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
                        : AppStrings.carbsValue(mealNutrition.carbohydrates.toInt()),
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
                        : AppStrings.fatValue(mealNutrition.fat.toInt()),
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
                        : AppStrings.proteinValue(mealNutrition.protein.toInt()),
                    style: Theme.of(context).textTheme.labelMedium,
                  )),
            ],
          );
        });
  }
}
