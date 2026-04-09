import 'package:flutter/material.dart';

const _size = 8.0;

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorLight,
      ),
      child: const SizedBox(
        width: _size,
        height: _size,
      ),
    );
  }
}
