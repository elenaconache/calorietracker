import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/recipes/ui/nutrition_tile.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_name_field.dart';
import 'package:calorietracker/feature/recipes/ui/recipe_servings_field.dart';
import 'package:calorietracker/feature/recipes/ui/create_recipe/ingredient_item.dart';
import 'package:calorietracker/feature/recipes/details/recipe_details_arguments.dart';
import 'package:calorietracker/feature/recipes/details/recipe_details_controller.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/nutrition.dart';
import 'package:calorietracker/shared/model/recipe_ingredient.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/calories_macros_section.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class RecipeDetailsView extends StatefulWidget {
  final RecipeDetailsArguments arguments;

  const RecipeDetailsView({super.key, required this.arguments});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  late final ScrollController _scrollController;
  late final RecipeDetailsController _controller;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameTextFieldController;
  late final TextEditingController _servingSizeTextController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = getIt<RecipeDetailsController>();
    _formKey = GlobalKey<FormState>(debugLabel: 'recipeDetailsForm');
    _nameTextFieldController = TextEditingController();
    _nameTextFieldController.text = widget.arguments.recipeName;
    _servingSizeTextController = TextEditingController()
      ..text = '100'
      ..addListener(_onServingSizeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_controller.initializeRecipe(
        recipeId: widget.arguments.recipeId,
        cookedQuantity: widget.arguments.cookedQuantity,
      ));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.isLoading.dispose();
    _nameTextFieldController.dispose();
    _servingSizeTextController
      ..removeListener(_onServingSizeChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.recipeDetailsTitle)),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: ValueListenableBuilder(
                valueListenable: _controller.isLoading,
                builder: (_, isLoading, __) => RecipeNameField(
                  formKey: _formKey,
                  isLoading: isLoading,
                  textController: _nameTextFieldController,
                  enabled: false,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: ValueListenableBuilder(
                valueListenable: _controller.isLoading,
                builder: (_, isLoading, __) => RecipeServingsField(
                  textController: _servingSizeTextController,
                  isLoading: isLoading,
                  enabled: false,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 18, right: 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppStrings.summary100GramsMessage,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
                valueListenable: _controller.recipeNutrition,
                builder: (_, nutrition, __) {
                  return switch (nutrition) {
                    FutureLoading _ => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    FutureSuccess<Nutrition> nutrition => CaloriesMacrosSection(
                        calories: nutrition.data.calories.toInt(),
                        carbsInGrams: nutrition.data.carbohydrates,
                        carbsPercentage: nutrition.data.carbsPercentage,
                        fatInGrams: nutrition.data.fat,
                        fatPercentage: nutrition.data.fatPercentage,
                        proteinInGrams: nutrition.data.protein,
                        proteinPercentage: nutrition.data.proteinPercentage,
                      ),
                    _ => const GeneralErrorView(),
                  };
                }),
          ),
          ValueListenableBuilder(
            valueListenable: _controller.recipeNutrition,
            builder: (_, nutrition, __) => nutrition is! FutureSuccess<Nutrition>
                ? const SliverPadding(padding: EdgeInsets.zero)
                : SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const AppDivider(height: 2),
                        NutritionTile(nutrition: nutrition.data),
                        const AppDivider(height: 2),
                      ],
                    ),
                  ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16, left: 18, right: 12),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppStrings.ingredientsTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 16)),
          ValueListenableBuilder(
            valueListenable: _controller.ingredients,
            builder: (_, ingredients, __) {
              return switch (ingredients) {
                FutureLoading _ => const SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                FutureSuccess<List<RecipeIngredient>> _ => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, index) => IngredientItem(
                        ingredient: ingredients.data[index],
                        onSwipe: () {},
                        onTap: () {},
                        enabled: false,
                      ),
                      childCount: ingredients.data.length,
                    ),
                  ),
                _ => const SliverToBoxAdapter(child: GeneralErrorView()),
              };
            },
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 2 * MediaQuery.of(context).padding.bottom),
          ),
        ],
      ),
    );
  }

  void _onServingSizeChanged() => _controller.updateNutrition(
        cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
      );
}
