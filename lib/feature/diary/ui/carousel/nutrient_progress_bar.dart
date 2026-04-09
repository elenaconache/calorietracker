import 'package:flutter/material.dart';

class NutrientProgressBar extends StatelessWidget {
  final double current;
  final int? goal;
  final String label;

  const NutrientProgressBar({super.key, required this.current, required this.goal, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(label),
            ),
            Expanded(
              flex: 1,
              child: Text(current.toStringAsFixed(0)),
            ),
            Expanded(
              flex: 1,
              child: goal == null ? const SizedBox.shrink() : Text(goal.toString()),
            ),
            Expanded(
              flex: 1,
              child: goal == null ? const SizedBox.shrink() : Text((goal! - current).toStringAsFixed(0)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: (goal ?? 0) == 0 ? 0 : current / goal!,
        ),
      ],
    );
  }
}
