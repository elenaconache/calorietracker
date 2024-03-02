import 'package:calorietracker/models/recipe.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final bool showTopDivider;

  const RecipeItem({Key? key, required this.recipe, required this.showTopDivider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => _navigateToAddRecipe(context),
        child: Ink(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              if (showTopDivider)const AppDivider(),
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

  void _navigateToAddRecipe(BuildContext context) {}
}
