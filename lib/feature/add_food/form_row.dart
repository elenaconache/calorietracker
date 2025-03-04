import 'package:flutter/material.dart';

class FormRow extends StatelessWidget {
  final Widget valueWidget;
  final String label;

  const FormRow({super.key, required this.valueWidget, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 16),
      Expanded(
          flex: 1,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      const SizedBox(width: 8),
      Expanded(flex: 2, child: valueWidget),
      const SizedBox(width: 16),
    ]);
  }
}
