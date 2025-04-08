import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/ui/components/calories_macros_pie_chart.dart';
import 'package:calorietracker/feature/add_food/ui/macro_item.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/colors.dart';
import 'package:flutter/material.dart';

const _carbsColor = melonYellow;
const _fatColor = pastelTurquoise;
const _proteinColor = carmineRed;
const _unknownMacroColor = blanchedAlmond;

class CaloriesMacrosSection extends StatelessWidget {
  final Nutrition nutrition;

  const CaloriesMacrosSection({
    super.key,
    required this.nutrition,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 16),
        Expanded(
            flex: 2,
            child: CaloriesMacrosPieChart(
              carbs: carbsPercentage.toDouble(),
              fat: fatPercentage.toDouble(),
              protein: proteinPercentage.toDouble(),
              calories: calories,
              carbsColor: _carbsColor,
              fatColor: _fatColor,
              proteinColor: _proteinColor,
              defaultMacroNutrient: _unknownMacroColor,
            )),
        Expanded(child: MacroItem(percentage: carbsPercentage, quantityInGrams: carbsInGrams, name: AppStrings.carbsLabel, color: _carbsColor)),
        Expanded(child: MacroItem(percentage: fatPercentage, quantityInGrams: fatInGrams, name: AppStrings.fatLabel, color: _fatColor)),
        Expanded(
            child: MacroItem(percentage: proteinPercentage, quantityInGrams: proteinInGrams, name: AppStrings.proteinLabel, color: _proteinColor)),
        const SizedBox(width: 16)
      ],
    );
  }

  int get calories => nutrition.calories.toInt();

  double get carbsInGrams => nutrition.carbohydrates;

  double get fatInGrams => nutrition.fat;

  double get proteinInGrams => nutrition.protein;

  int get carbsPercentage => nutrition.carbsPercentage;

  int get fatPercentage => nutrition.fatPercentage;

  int get proteinPercentage => nutrition.proteinPercentage;
}
