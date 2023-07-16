import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/service/diary_service.dart';
import 'package:calorietracker/ui/components/dot.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class MealTitle extends StatelessWidget {
  final Meal meal;

  const MealTitle({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
    return DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                      child: Text(
                    _mealLabel,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  )),
                  ValueListenableBuilder(
                      valueListenable: diaryService.selectedDayMealEntries,
                      builder: (context, _, __) {
                        if (diaryService.selectedDayMealEntries.value.status == ApiResponseStatus.error) {
                          return const SizedBox.shrink();
                        }
                        final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                        return Text(
                          AppStrings.caloriesShortLabel(mealNutrition.calories?.toInt() ?? 0),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        );
                      })
                ]),
                ValueListenableBuilder(
                    valueListenable: diaryService.selectedDayMealEntries,
                    builder: (context, _, __) {
                      if (diaryService.selectedDayMealEntries.value.status == ApiResponseStatus.error) {
                        return const SizedBox.shrink();
                      }
                      final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                      return Row(
                        children: [
                          Text(
                            AppStrings.carbsValue(mealNutrition.carbohydrates?.toInt() ?? 0),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 8),
                          const Dot(),
                          const SizedBox(width: 8),
                          Text(
                            AppStrings.fatValue(mealNutrition.fat?.toInt() ?? 0),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: 8),
                          const Dot(),
                          const SizedBox(width: 8),
                          Text(
                            AppStrings.proteinValue(mealNutrition.protein?.toInt() ?? 0),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      );
                    })
              ],
            )));
  }

  String get _mealLabel {
    switch (meal) {
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
