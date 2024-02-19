import 'dart:math';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/recipes/create_food/create_recipe_controller.dart';
import 'package:calorietracker/features/recipes/create_food/ingredient_item.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/calories_macros_section.dart';
import 'package:calorietracker/ui/components/nutrition_section.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class CreateRecipeView extends StatefulWidget {
  const CreateRecipeView({super.key});

  @override
  State<CreateRecipeView> createState() => _CreateRecipeViewState();
}

class _CreateRecipeViewState extends State<CreateRecipeView> with SingleTickerProviderStateMixin {
  late final CreateRecipeController _controller;
  late final ScrollController _scrollController;
  late final AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _controller = locator<CreateRecipeController>();
    _scrollController = ScrollController();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    Tween<double>(begin: 0, end: pi).animate(_rotationController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.createRecipeTitle),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: AppTextField(
                labelText: AppStrings.recipeNameLabel,
                action: TextInputAction.next,
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
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: _controller.ingredients,
              builder: (_, ingredients, __) {
                final nutrition = _controller.recipeNutrition;
                return CaloriesMacrosSection(
                  calories: nutrition.calories.toInt(),
                  carbsInGrams: nutrition.carbohydrates,
                  carbsPercentage: nutrition.carbsPercentage,
                  fatInGrams: nutrition.fat,
                  fatPercentage: nutrition.fatPercentage,
                  proteinInGrams: nutrition.protein,
                  proteinPercentage: nutrition.proteinPercentage,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ExpansionTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
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
              children: [
                ValueListenableBuilder(
                  valueListenable: _controller.ingredients,
                  builder: (_, ingredients, __) {
                    final nutrition = _controller.recipeNutrition;
                    return NutritionSection(nutrition: nutrition);
                  },
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 18, right: 12, bottom: 6),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    AppStrings.ingredientsTitle,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  const SizedBox(width: 12),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      size: 28,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: _navigateToSearchFood,
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _controller.ingredients,
            builder: (_, ingredients, __) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => IngredientItem(ingredient: ingredients[index]),
                childCount: ingredients.length,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          )
        ],
      ),
    );
  }

  void _navigateToSearchFood() async {
    final result = await Navigator.of(context).pushNamed(Routes.foodSearch.path);
    if (result is RecipeIngredient) {
      _controller.addIngredient(ingredient: result);
      if (context.mounted) {
        FocusScope.of(context).unfocus();
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + MediaQuery.of(context).padding.bottom,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    }
  }
}
