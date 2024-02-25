import 'package:calorietracker/features/diary/swipe_to_delete_background.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final RecipeIngredient ingredient;
  final VoidCallback onSwipe;

  const IngredientItem({super.key, required this.ingredient, required this.onSwipe});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) => onSwipe(),
      background: const SwipeToDeleteBackground(direction: TextDirection.ltr),
      secondaryBackground: const SwipeToDeleteBackground(direction: TextDirection.rtl),
      child: Column(
        children: [
          const AppDivider(),
          InkWell(
            onTap: () {},
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
                    (ingredient.servingQuantity * ingredient.food.nutrition.calories ~/ 100).toString(),
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
