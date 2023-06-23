import 'package:calorietracker/ui/colors.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const _carbsColor = melonYellow;
const _fatColor = pastelTurquoise;
const _proteinColor = carmineRed;
const _pieChartEntryRadius = 10.0;
const _pieChartSize = 140.0;

class CaloriesMacrosPieChart extends StatelessWidget {
  final double carbs;
  final double fat;
  final double protein;
  final int calories;

  const CaloriesMacrosPieChart({super.key, required this.carbs, required this.fat, required this.protein, required this.calories});

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
          color: _carbsColor,
          value: carbs,
          title: '',
          radius: _pieChartEntryRadius,
        ),
        PieChartSectionData(
          color: _fatColor,
          value: fat,
          title: '',
          radius: _pieChartEntryRadius,
        ),
        PieChartSectionData(
          color: _proteinColor,
          value: protein,
          title: '',
          radius: _pieChartEntryRadius,
        ),
      ];
}
