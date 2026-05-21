import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/main.dart';
import 'package:calorietracker/feature/diary/ui/meal_macros.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/widgets/copy_diary_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealTitle extends StatelessWidget {
  final Meal meal;
  final bool enabledMacrosPercentageMode;
  final VoidCallback onTap;
  final DiaryState diary;

  const MealTitle({
    super.key,
    required this.meal,
    required this.enabledMacrosPercentageMode,
    required this.onTap,
    required this.diary,
  });

  @override
  Widget build(BuildContext context) {
    final mealNutrition = diary.getMealNutrition(meal: meal);
    final editable = diary.editMode;
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
                  diary.hasMealEntries(meal: meal)
                      ? editable
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  tristate: true,
                                  value: diary.isMealChecked(meal: meal),
                                  onChanged: (checked) => context.read<DiaryBloc>().add(MealCheckChanged(checked: checked, meal: meal)),
                                ),
                              ),
                            )
                          : const SizedBox.shrink()
                      : const SizedBox.shrink(),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: getIt<DiaryLoggingService>().mealsLoading,
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
                  if (diary.selectedDayMealEntries.status is! FutureError)
                    Text(
                      AppStrings.caloriesShortLabel(mealNutrition.calories.toInt()),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    )
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: editable && diary.hasMealEntries(meal: meal) ? 32 : 0),
                child: MealMacros(
                  meal: meal,
                  enabledPercentageMode: enabledMacrosPercentageMode,
                  diary: diary,
                ),
              ),
            ],
          ),
        ),
      ),
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
