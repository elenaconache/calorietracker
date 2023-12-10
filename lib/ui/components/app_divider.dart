import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).dividerColor.withOpacity(0.4),
      child: const SizedBox(
        height: 0.5,
        width: double.infinity,
      ),
    );
  }
}
