import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final RecipeIngredient ingredient;

  const IngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppDivider(),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        ingredient.food.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        AppStrings.gramsValue(ingredient.servingQuantity),
                        style: Theme.of(context).textTheme.bodySmall,
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
                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
