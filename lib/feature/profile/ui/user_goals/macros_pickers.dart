import 'package:calorietracker/shared/data/model/macro.dart';
import 'package:calorietracker/shared/data/model/macro_goals.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_picker.dart';
import 'package:flutter/cupertino.dart';

class MacrosPickers extends StatelessWidget {
  final MacroGoals macroGoals;
  final Function(Macro macro, int pickedValue) onValuePicked;

  const MacrosPickers({super.key, required this.macroGoals, required this.onValuePicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: AppPicker(
            label: AppStrings.carbsLabel,
            initialValue: macroGoals.roundedCarbsPercentage,
            onValuePicked: (value) => onValuePicked(Macro.carbohydrates, value),
          ),
        ),
        Expanded(
          child: AppPicker(
            label: AppStrings.proteinLabel,
            initialValue: macroGoals.roundedProteinPercentage,
            onValuePicked: (value) => onValuePicked(Macro.protein, value),
          ),
        ),
        Expanded(
          child: AppPicker(
            label: AppStrings.fatLabel,
            initialValue: macroGoals.roundedFatPercentage,
            onValuePicked: (value) => onValuePicked(Macro.fat, value),
          ),
        ),
      ],
    );
  }
}
