import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/ui/carousel/nutrient_progress_bar.dart';
import 'package:calorietracker/feature/profile/logic/user_goals_cubit.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/feature/diary/ui/carousel/dotted_item.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/widgets/app_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryOverviewCarousel extends StatelessWidget {
  final DiaryState diary;
  const DiaryOverviewCarousel({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGoalsCubit, UserGoalsState>(
      builder: (context, state) {
        final goals = state.macroGoals.data;
        return AppCarousel(
          items: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DecoratedBox(
                decoration: _getDecoration(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: diary.selectedDayMealEntries.status is FailureStatus
                      ? const SizedBox.shrink()
                      : SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              children: [
                                Expanded(flex: 3, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 1,
                                  child: Text(AppStrings.totalLabel),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(AppStrings.goalLabel),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(AppStrings.leftLabel),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            NutrientProgressBar(
                              current: diary.selectedDayNutrition.calories,
                              goal: goals?.calories,
                              label: AppStrings.caloriesLabel,
                            ),
                            const SizedBox(height: 4),
                            NutrientProgressBar(
                              current: diary.selectedDayNutrition.carbohydrates,
                              goal: goals?.roundedCarbsGrams,
                              label: AppStrings.carbohydratesLabel,
                            ),
                            const SizedBox(height: 4),
                            NutrientProgressBar(
                              current: diary.selectedDayNutrition.protein,
                              goal: goals?.roundedProteinGrams,
                              label: AppStrings.proteinLabel,
                            ),
                            const SizedBox(height: 4),
                            NutrientProgressBar(
                              current: diary.selectedDayNutrition.fat,
                              goal: goals?.roundedFatGrams,
                              label: AppStrings.fatLabel,
                            ),
                          ]),
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                decoration: _getDecoration(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Center(
                      child: diary.selectedDayMealEntries.status is FailureStatus
                          ? const SizedBox.shrink()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DottedItem(
                                  label: AppStrings.carbohydratesLabel,
                                  value: diary.selectedDayNutrition.carbohydrates.toStringAsFixed(0),
                                ),
                                DottedItem(
                                  label: AppStrings.fiberLabel,
                                  value: diary.selectedDayNutrition.fiber.toStringAsFixed(0),
                                ),
                                DottedItem(
                                  label: AppStrings.netCarbsLabel,
                                  value: diary.selectedDayNutrition.netCarbs.toStringAsFixed(0),
                                ),
                                DottedItem(
                                  label: AppStrings.sugarLabel,
                                  value: diary.selectedDayNutrition.sugar.toStringAsFixed(0),
                                ),
                              ],
                            )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  BoxDecoration _getDecoration(BuildContext context) => BoxDecoration(
        border: Border.fromBorderSide(BorderSide(
          width: 2,
          color: Theme.of(context).dividerColor,
        )),
        borderRadius: BorderRadius.circular(8),
      );
}
