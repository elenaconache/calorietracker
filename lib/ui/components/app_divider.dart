import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double height;

  const AppDivider({super.key, this.height = 0.5});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).dividerColor.withOpacity(0.4),
      child: SizedBox(
        height: height,
        width: double.infinity,
      ),
    );
  }
}
