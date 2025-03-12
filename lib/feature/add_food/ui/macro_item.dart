import 'package:flutter/material.dart';

class MacroItem extends StatelessWidget {
  final int percentage;
  final double quantityInGrams;
  final String name;
  final Color color;

  const MacroItem({super.key, required this.percentage, required this.quantityInGrams, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$percentage%',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
        ),
        Text(
          '${quantityInGrams.toStringAsFixed(1)}g',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
