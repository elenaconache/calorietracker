import 'package:calorietracker/feature/diary/ui/swipe_to_delete_background.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final RecipeIngredient ingredient;
  final VoidCallback onSwipe;
  final VoidCallback onTap;
  final bool enabled;

  const IngredientItem({
    super.key,
    required this.ingredient,
    required this.onSwipe,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final calories = ingredient.servingQuantity * ingredient.food.nutrition.calories ~/ 100;
    return Dismissible(
      key: UniqueKey(),
      direction: enabled ? DismissDirection.horizontal : DismissDirection.none,
      onDismissed: (_) => onSwipe(),
      background: const SwipeToDeleteBackground(direction: TextDirection.ltr),
      secondaryBackground: const SwipeToDeleteBackground(direction: TextDirection.rtl),
      child: Column(
        children: [
          const AppDivider(),
          InkWell(
            onTap: enabled ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          ingredient.food.name,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          AppStrings.gramsValue(ingredient.servingQuantity),
                          style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppStrings.caloriesShortLabel(calories),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
