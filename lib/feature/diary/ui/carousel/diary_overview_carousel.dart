import 'package:calorietracker/feature/diary/ui/carousel/nutrient_progress_bar.dart';
import 'package:calorietracker/feature/profile/logic/user_goals_cubit.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/diary/ui/carousel/dotted_item.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/widgets/app_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryOverviewCarousel extends StatelessWidget {
  const DiaryOverviewCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = getIt<DiaryService>();

    return BlocBuilder<UserGoalsCubit, UserGoalsState>(
      builder: (context, state) {
        return AppCarousel(
          items: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: DecoratedBox(
                  decoration: _getDecoration(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ValueListenableBuilder(
                        valueListenable: diaryService.dayMealEntries,
                        builder: (context, dayMealEntries, __) {
                          if (dayMealEntries is FutureError) {
                            return const SizedBox.shrink();
                          }
                          final nutrition = diaryService.selectedDayNutrition;
                          final goals = state.macroGoals.data;
                          return SingleChildScrollView(
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
                                current: nutrition.calories,
                                goal: goals?.calories,
                                label: AppStrings.caloriesLabel,
                              ),
                              const SizedBox(height: 4),
                              NutrientProgressBar(
                                current: nutrition.carbohydrates,
                                goal: goals?.roundedCarbsGrams,
                                label: AppStrings.carbohydratesLabel,
                              ),
                              const SizedBox(height: 4),
                              NutrientProgressBar(
                                current: nutrition.protein,
                                goal: goals?.roundedProteinGrams,
                                label: AppStrings.proteinLabel,
                              ),
                              const SizedBox(height: 4),
                              NutrientProgressBar(
                                current: nutrition.fat,
                                goal: goals?.roundedFatGrams,
                                label: AppStrings.fatLabel,
                              ),
                            ]),
                          );
                        }),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                decoration: _getDecoration(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: diaryService.dayMealEntries,
                        builder: (context, dayMealEntries, __) {
                          if (dayMealEntries is FutureError) {
                            return const SizedBox.shrink();
                          }
                          final nutrition = diaryService.selectedDayNutrition;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DottedItem(
                                label: AppStrings.carbohydratesLabel,
                                value: nutrition.carbohydrates.toStringAsFixed(0),
                              ),
                              DottedItem(
                                label: AppStrings.fiberLabel,
                                value: nutrition.fiber.toStringAsFixed(0),
                              ),
                              DottedItem(
                                label: AppStrings.netCarbsLabel,
                                value: nutrition.netCarbs.toStringAsFixed(0),
                              ),
                              DottedItem(
                                label: AppStrings.sugarLabel,
                                value: nutrition.sugar.toStringAsFixed(0),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
            )
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
      borderRadius: BorderRadius.circular(8));
}
