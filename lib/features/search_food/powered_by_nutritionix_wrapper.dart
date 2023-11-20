import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/shadows.dart';
import 'package:flutter/material.dart';

class PoweredByNutritionixWrapper extends StatelessWidget {
  final Widget child;

  const PoweredByNutritionixWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(child: child),
      DecoratedBox(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: Theme.of(context).dividerColor)),
            boxShadow: const [subtleBackgroundShadow],
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              AppStrings.poweredByNutritionixLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    ]);
  }
}
