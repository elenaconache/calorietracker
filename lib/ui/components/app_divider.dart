import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black12,
      child: SizedBox(height: 1),
    );
  }
}
