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
    return DecoratedBox(
        decoration: BoxDecoration(
            border: isLast ? null : Border(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor))),
        child: Padding(
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
                )
              ],
            )));
  }
}
