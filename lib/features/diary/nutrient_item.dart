import 'package:flutter/material.dart';

class NutrientItem extends StatelessWidget {
  final double value;
  final String name;

  const NutrientItem({super.key, required this.value, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
