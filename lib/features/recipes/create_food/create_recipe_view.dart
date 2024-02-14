import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/recipes/create_food/create_recipe_controller.dart';
import 'package:calorietracker/features/recipes/create_food/ingredient_item.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class CreateRecipeView extends StatefulWidget {
  const CreateRecipeView({super.key});

  @override
  State<CreateRecipeView> createState() => _CreateRecipeViewState();
}

class _CreateRecipeViewState extends State<CreateRecipeView> {
  late final CreateRecipeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = locator<CreateRecipeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.createRecipeTitle),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: AppTextField(
                labelText: AppStrings.recipeNameLabel,
                action: TextInputAction.next,
                autofocus: true,
                maxLength: 30,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: AppTextField(
                labelText: AppStrings.servingsLabel,
                inputType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                maxLength: 6,
                autofocus: true,
                action: TextInputAction.done,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 12, bottom: 6),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    AppStrings.ingredientsTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 28,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () => _navigateToSearchFood(context),
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _controller.ingredients,
            builder: (context, ingredients, _) => SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => IngredientItem(
                        ingredient: ingredients[index]
                      ),
                  childCount: ingredients.length),
            ),
          )
        ],
      ),
    );
  }

  void _navigateToSearchFood(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(Routes.foodSearch.path);
    if (result is RecipeIngredient) {
      _controller.addIngredient(ingredient: result);
    }
  }
}
