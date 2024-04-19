import 'package:calorietracker/models/macro.dart';
import 'package:calorietracker/models/user_goals.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_picker.dart';
import 'package:flutter/cupertino.dart';

class MacrosPickers extends StatelessWidget {
  final UserGoals userGoals;
  final Function(Macro macro, int pickedValue) onValuePicked;

  const MacrosPickers({super.key, required this.userGoals, required this.onValuePicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: AppPicker(
            label: AppStrings.carbsLabel,
            initialValue: userGoals.carbsPercentage,
            onValuePicked: (value) => onValuePicked(Macro.carbohydrates, value),
          ),
        ),
        Expanded(
          child: AppPicker(
            label: AppStrings.proteinLabel,
            initialValue: userGoals.proteinPercentage,
            onValuePicked: (value) => onValuePicked(Macro.protein, value),
          ),
        ),
        Expanded(
          child: AppPicker(
            label: AppStrings.fatLabel,
            initialValue: userGoals.fatPercentage,
            onValuePicked: (value) => onValuePicked(Macro.fat, value),
          ),
        ),
      ],
    );
  }
}
