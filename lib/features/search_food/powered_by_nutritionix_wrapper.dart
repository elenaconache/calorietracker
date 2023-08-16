import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class PoweredByNutritionixWrapper extends StatelessWidget {
  final Widget child;

  const PoweredByNutritionixWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(child: child),
      const AppDivider(),
      const SizedBox(height: 12),
      Center(
          child: Text(
        AppStrings.poweredByNutritionixLabel,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300),
      )),
    ]));
  }
}
