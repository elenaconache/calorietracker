import 'package:calorietracker/feature/recipes/details/recipe_details_arguments.dart';
import 'package:calorietracker/shared/model/recipe.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final bool showTopDivider;

  const RecipeItem({super.key, required this.recipe, required this.showTopDivider});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => _navigateToRecipeDetails(context),
        child: Ink(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              if (showTopDivider) const AppDivider(),
              Row(children: [
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    recipe.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 16),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRecipeDetails(BuildContext context) => Navigator.of(context).pushNamed(
        Routes.recipe.path,
        arguments: RecipeDetailsArguments(
          recipeId: recipe.id,
          recipeName: recipe.name,
          cookedQuantity: recipe.cookedWeight,
        ),
      );
}
