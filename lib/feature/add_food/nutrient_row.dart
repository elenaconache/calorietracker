import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class NutrientRow extends StatelessWidget {
  final String name;
  final String displayValue;
  final bool isLast;

  const NutrientRow({
    super.key,
    required this.name,
    required this.displayValue,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const AppDivider(),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),
            Text(
              displayValue,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    ]);
  }
}
