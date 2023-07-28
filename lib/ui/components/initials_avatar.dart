import 'package:flutter/material.dart';

const _defaultSize = 36.0;

class InitialsAvatar extends StatelessWidget {
  final String text;
  final double size;

  const InitialsAvatar({super.key, required this.text, this.size = _defaultSize});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _color,
        shape: BoxShape.circle,
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
            child: Text(
          _initials,
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }

  Color get _color {
    String firstLetter = text.substring(0, 1).toUpperCase();
    int hashCode = firstLetter.hashCode;
    Color color = Colors.primaries[hashCode % Colors.primaries.length];
    return color;
  }

  String get _initials => text.split(' ').take(2).map((word) => word.characters.isEmpty ? '' : word[0].toUpperCase()).join('');
}
