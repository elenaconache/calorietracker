import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class PoweredByNutritionixWrapper extends StatelessWidget {
  final Widget child;

  const PoweredByNutritionixWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(child: child),
      const AppDivider(),
      const SizedBox(height: 12),
      Center(
          child: Text(
        AppStrings.poweredByNutritionixLabel,
        style: Theme.of(context).textTheme.bodySmall,
      )),
      const SizedBox(height: 16),
    ]);
  }
}
