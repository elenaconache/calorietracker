import 'package:calorietracker/app/dependency_injection.dart';
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
    return Column(
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
                final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                return Text(
                  AppStrings.caloriesShortLabel(mealNutrition.calories?.toInt() ?? 0),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                );
              })
        ]),
        Row(
          children: [
            ValueListenableBuilder(
                valueListenable: diaryService.selectedDayMealEntries,
                builder: (context, _, __) {
                  final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                  return Text(
                    AppStrings.carbsValue(mealNutrition.carbohydrates?.toInt() ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                }),
            const SizedBox(width: 8),
            const Dot(),
            const SizedBox(width: 8),
            ValueListenableBuilder(
                valueListenable: diaryService.selectedDayMealEntries,
                builder: (context, _, __) {
                  final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                  return Text(
                    AppStrings.fatValue(mealNutrition.fat?.toInt() ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                }),
            const SizedBox(width: 8),
            const Dot(),
            const SizedBox(width: 8),
            ValueListenableBuilder(
                valueListenable: diaryService.selectedDayMealEntries,
                builder: (context, _, __) {
                  final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                  return Text(
                    AppStrings.proteinValue(mealNutrition.protein?.toInt() ?? 0),
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                }),
          ],
        )
      ],
    );
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
