import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:calorietracker/ui/colors.dart';

class PercentagesTotal extends StatelessWidget {
  final int totalPercentage;

  const PercentagesTotal({super.key, required this.totalPercentage});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.totalLabel,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(AppStrings.macroPercentagesSumMessage),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$totalPercentage%',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: totalPercentage == 100 ? pastelGreen : bittersweetRed),
            ),
          ],
        ),
      ),
    );
  }
}
