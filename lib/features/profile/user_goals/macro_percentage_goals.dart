import 'package:calorietracker/features/profile/user_goals/macros_pickers.dart';
import 'package:calorietracker/features/profile/user_goals/percentages_total.dart';
import 'package:calorietracker/models/macro.dart';
import 'package:calorietracker/models/macro_goals.dart';
import 'package:flutter/material.dart';

class MacroPercentageGoals extends StatelessWidget {
  final MacroGoals macroGoals;
  final Function(Macro selectedMacro, int selectedPercentage) onMacroPercentagePicked;

  const MacroPercentageGoals({
    super.key,
    required this.macroGoals,
    required this.onMacroPercentagePicked,
  });

  @override
  Widget build(BuildContext context) {
    final totalPercentage =
        macroGoals.roundedCarbsPercentage + macroGoals.roundedFatPercentage + macroGoals.roundedProteinPercentage;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MacrosPickers(macroGoals: macroGoals, onValuePicked: onMacroPercentagePicked),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  '${macroGoals.roundedCarbsGrams}g',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: Text(
                  '${macroGoals.roundedProteinGrams}g',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: Text(
                  '${macroGoals.roundedFatGrams}g',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        PercentagesTotal(totalPercentage: totalPercentage),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
