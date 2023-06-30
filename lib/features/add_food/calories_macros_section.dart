import 'package:calorietracker/features/add_food/calories_macros_pie_chart.dart';
import 'package:calorietracker/features/add_food/macro_item.dart';
import 'package:calorietracker/ui/colors.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

const _carbsColor = melonYellow;
const _fatColor = pastelTurquoise;
const _proteinColor = carmineRed;

class CaloriesMacrosSection extends StatelessWidget {
  final int calories;
  final int carbsPercentage;
  final int proteinPercentage;
  final int fatPercentage;
  final double carbsInGrams;
  final double fatInGrams;
  final double proteinInGrams;

  const CaloriesMacrosSection(
      {super.key,
      required this.calories,
      required this.carbsPercentage,
      required this.proteinPercentage,
      required this.fatPercentage,
      required this.carbsInGrams,
      required this.fatInGrams,
      required this.proteinInGrams});

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
            )),
        Expanded(child: MacroItem(percentage: carbsPercentage, quantityInGrams: carbsInGrams, name: AppStrings.carbsLabel, color: _carbsColor)),
        Expanded(child: MacroItem(percentage: fatPercentage, quantityInGrams: fatInGrams, name: AppStrings.fatLabel, color: _fatColor)),
        Expanded(
            child: MacroItem(percentage: proteinPercentage, quantityInGrams: proteinInGrams, name: AppStrings.proteinLabel, color: _proteinColor)),
        const SizedBox(width: 16)
      ],
    );
  }
}
