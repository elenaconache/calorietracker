import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_picker.dart';
import 'package:flutter/cupertino.dart';

class MacrosPickers extends StatelessWidget {
  const MacrosPickers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: AppPicker(label: AppStrings.carbsLabel)),
        Expanded(child: AppPicker(label: AppStrings.proteinLabel)),
        Expanded(child: AppPicker(label: AppStrings.fatLabel)),
      ],
    );
  }
}
