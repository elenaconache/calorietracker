import 'package:calorietracker/feature/profile/ui/user_goals/macros_pickers.dart';
import 'package:calorietracker/feature/profile/ui/user_goals/percentages_total.dart';
import 'package:calorietracker/shared/data/model/macro.dart';
import 'package:calorietracker/shared/data/model/macro_goals.dart';
import 'package:flutter/material.dart';

class MacroPercentageGoals extends StatelessWidget {
  final MacroGoals macroGoals;
  final Function(Macro selectedMacro, int selectedPercentage) onMacroPercentagePicked;
  final bool enabled;

  const MacroPercentageGoals({
    super.key,
    required this.macroGoals,
    required this.onMacroPercentagePicked,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final totalPercentage = macroGoals.roundedCarbsPercentage + macroGoals.roundedFatPercentage + macroGoals.roundedProteinPercentage;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 300,
              child: MacrosPickers(enabled: enabled, macroGoals: macroGoals, onValuePicked: onMacroPercentagePicked),
            ),
          ),
        ),
        SliverToBoxAdapter(
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
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PercentagesTotal(totalPercentage: totalPercentage),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ],
    );
  }
}
