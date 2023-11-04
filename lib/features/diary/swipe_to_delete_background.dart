import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class SwipeToDeleteBackground extends StatelessWidget {
  final TextDirection direction;

  const SwipeToDeleteBackground({super.key, required this.direction});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Directionality(
          textDirection: direction,
          child: Row(
            textDirection: direction,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.delete, size: 24),
              const SizedBox(width: 8),
              Text(
                AppStrings.deleteEntryLabel,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
