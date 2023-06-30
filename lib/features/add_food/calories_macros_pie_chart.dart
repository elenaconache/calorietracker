import 'package:calorietracker/ui/strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const _pieChartEntryRadius = 8.0;
const _pieChartSize = 130.0;

class CaloriesMacrosPieChart extends StatelessWidget {
  final double carbs;
  final double fat;
  final double protein;
  final int calories;
  final Color carbsColor;
  final Color fatColor;
  final Color proteinColor;

  const CaloriesMacrosPieChart(
      {super.key,
      required this.carbs,
      required this.fat,
      required this.protein,
      required this.calories,
      required this.carbsColor,
      required this.fatColor,
      required this.proteinColor});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: _pieChartSize,
          width: _pieChartSize,
          child: PieChart(PieChartData(sectionsSpace: 4, centerSpaceRadius: 40, sections: _macrosPieChartSections))),
      SizedBox(
          height: _pieChartSize,
          width: _pieChartSize,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              calories.toString(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.caloriesShortGenericLabel,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ]))
    ]);
  }

  List<PieChartSectionData> get _macrosPieChartSections => [
        PieChartSectionData(
          color: carbsColor,
          value: carbs,
          title: '',
          radius: _pieChartEntryRadius,
        ),
        PieChartSectionData(
          color: fatColor,
          value: fat,
          title: '',
          radius: _pieChartEntryRadius,
        ),
        PieChartSectionData(
          color: proteinColor,
          value: protein,
          title: '',
          radius: _pieChartEntryRadius,
        ),
      ];
}
