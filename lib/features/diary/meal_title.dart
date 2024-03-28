import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/app/main.dart';
import 'package:calorietracker/features/diary/meal_macros.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/database/diary_logging_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/copy_diary_modal.dart';
import 'package:flutter/material.dart';

class MealTitle extends StatelessWidget {
  final Meal meal;
  final bool enabledMacrosPercentageMode;
  final VoidCallback onTap;

  const MealTitle({
    super.key,
    required this.meal,
    required this.enabledMacrosPercentageMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
    return Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
            onTap: onTap,
            onLongPress: () => showModalBottomSheet(
                  context: rootNavigatorKey.currentContext!,
                  builder: (context) => CopyDiaryModal(meal: meal),
                ),
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: diaryService.dayMealEntries,
                            builder: (context, _, __) => diaryService.hasMealEntries(meal: meal)
                                ? ValueListenableBuilder(
                                    valueListenable: diaryService.diaryEditModeEnabled,
                                    builder: (context, editable, _) => editable
                                        ? ValueListenableBuilder(
                                            valueListenable: diaryService.checkedDiaryEntries,
                                            builder: (context, _, __) => Padding(
                                                padding: const EdgeInsets.only(right: 8),
                                                child: SizedBox(
                                                    width: 24,
                                                    height: 24,
                                                    child: Checkbox(
                                                      tristate: true,
                                                      value: diaryService.isMealChecked(meal: meal),
                                                      onChanged: (checked) =>
                                                          diaryService.onMealCheckChanged(meal: meal, checked: checked),
                                                    ))))
                                        : const SizedBox.shrink())
                                : const SizedBox.shrink()),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: locator<DiaryLoggingService>().mealsLoading,
                            child: Text(
                              _mealLabel,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            builder: (context, loading, child) => (loading[meal] ?? false)
                                ? Row(children: [
                                    child!,
                                    const SizedBox(width: 12),
                                    if (loading[meal] ?? false)
                                      const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(strokeWidth: 2),
                                      ),
                                  ])
                                : child!,
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: diaryService.dayMealEntries,
                            builder: (context, dayMealEntries, __) {
                              if (dayMealEntries is FutureError) {
                                return const SizedBox.shrink();
                              }
                              final mealNutrition = diaryService.getSelectedDayMealNutrients(meal: meal);
                              return Text(
                                AppStrings.caloriesShortLabel(mealNutrition.calories.toInt()),
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              );
                            })
                      ],
                    ),
                    const SizedBox(height: 8),
                    ValueListenableBuilder(
                      valueListenable: diaryService.dayMealEntries,
                      builder: (context, _, __) => ValueListenableBuilder(
                        valueListenable: diaryService.diaryEditModeEnabled,
                        builder: (context, editable, _) => Padding(
                          padding: EdgeInsets.only(left: editable && diaryService.hasMealEntries(meal: meal) ? 32 : 0),
                          child: MealMacros(
                            meal: meal,
                            enabledPercentageMode: enabledMacrosPercentageMode,
                          ),
                        ),
                      ),
                    )
                  ],
                ))));
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
