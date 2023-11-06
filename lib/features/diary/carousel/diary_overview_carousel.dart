import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/carousel/dotted_item.dart';
import 'package:calorietracker/models/helpers/future_response_status.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_carousel.dart';
import 'package:calorietracker/ui/components/calories_macros_section.dart';
import 'package:flutter/material.dart';

class DiaryOverviewCarousel extends StatelessWidget {
  const DiaryOverviewCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
    return AppCarousel(items: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DecoratedBox(
            decoration: _getDecoration(context),
            child: ValueListenableBuilder(
                valueListenable: diaryService.dayMealEntries,
                builder: (context, dayMealEntries, __) {
                  if (dayMealEntries.status == FutureResponseStatus.error) {
                    return const SizedBox.shrink();
                  }
                  final nutrition = diaryService.selectedDayNutrition;
                  return CaloriesMacrosSection(
                    calories: nutrition.calories.toInt(),
                    carbsInGrams: nutrition.carbohydrates,
                    carbsPercentage: nutrition.carbsPercentage,
                    fatInGrams: nutrition.fat,
                    fatPercentage: nutrition.fatPercentage,
                    proteinInGrams: nutrition.protein,
                    proteinPercentage: nutrition.proteinPercentage,
                  );
                }),
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
                          if (dayMealEntries.status == FutureResponseStatus.error) {
                            return const SizedBox.shrink();
                          }
                          final nutrition = diaryService.selectedDayNutrition;
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DottedItem(
                                  label: AppStrings.carbohydratesLabel,
                                  value: nutrition.formattedCarbs,
                                ),
                                DottedItem(
                                  label: AppStrings.fiberLabel,
                                  value: nutrition.formattedFiber,
                                ),
                                DottedItem(
                                  label: AppStrings.netCarbsLabel,
                                  value: nutrition.formattedNetCarbs,
                                ),
                                DottedItem(
                                  label: AppStrings.sugarLabel,
                                  value: nutrition.formattedSugar,
                                ),
                              ]);
                        }),
                  ))))
    ]);
  }

  BoxDecoration _getDecoration(BuildContext context) => BoxDecoration(
      border: Border.fromBorderSide(BorderSide(
        width: 2,
        color: Theme.of(context).dividerColor,
      )),
      borderRadius: BorderRadius.circular(8));
}
