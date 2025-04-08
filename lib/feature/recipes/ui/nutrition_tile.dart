import 'dart:math';

import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/nutrition_section.dart';
import 'package:flutter/material.dart';

class NutritionTile extends StatefulWidget {
  final Nutrition nutrition;

  const NutritionTile({super.key, required this.nutrition});

  @override
  State<NutritionTile> createState() => _NutritionTileState();
}

class _NutritionTileState extends State<NutritionTile> with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    Tween<double>(begin: 0, end: pi).animate(_rotationController);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      title: Text(
        AppStrings.nutritionTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: IconButton(
        padding: EdgeInsets.zero,
        icon: RotationTransition(
          turns: _rotationController,
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 28,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        onPressed: null,
      ),
      onExpansionChanged: (expanded) {
        _rotationController.animateTo(
          expanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
        );
      },
      tilePadding: const EdgeInsets.only(left: 18, right: 12),
      children: [NutritionSection(nutrition: widget.nutrition)],
    );
  }
}
