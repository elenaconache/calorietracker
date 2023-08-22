import 'package:flutter/material.dart';

class DottedItem extends StatelessWidget {
  final String label;
  final String value;

  const DottedItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      DecoratedBox(
        decoration: ShapeDecoration(
          shape: const BeveledRectangleBorder(),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: const SizedBox(
          height: 8,
          width: 8,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
          flex: 2,
          child: Text(
            '$label:',
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      Expanded(
        flex: 1,
        child: Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
