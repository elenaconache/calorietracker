import 'package:flutter/material.dart';

class NutrientItem extends StatelessWidget {
  final String formattedValue;
  final String name;

  const NutrientItem({super.key, required this.formattedValue, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          formattedValue,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }
}
