import 'dart:math';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/recipes/create_recipe/create_recipe_controller.dart';
import 'package:calorietracker/features/recipes/create_recipe/create_recipe_error.dart';
import 'package:calorietracker/features/recipes/create_recipe/ingredient_item.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
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
  late final TextEditingController _servingSizeTextController;
  late final TextEditingController _nameTextFieldController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _controller = locator<CreateRecipeController>();
    _scrollController = ScrollController();
    _formKey = GlobalKey<FormState>(debugLabel: 'createRecipeForm');
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    Tween<double>(begin: 0, end: pi).animate(_rotationController);
    _servingSizeTextController = TextEditingController()
      ..text = '100'
      ..addListener(_onServingSizeChanged);
    _nameTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _rotationController.dispose();
    _servingSizeTextController
      ..removeListener(_onServingSizeChanged)
      ..dispose();
    _nameTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.createRecipeTitle),
        actions: [
          ValueListenableBuilder(
            valueListenable: _controller.isLoading,
            builder: (_, isLoading, __) => isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : IconButton(
                    onPressed: _saveRecipe,
                    icon: const Icon(Icons.check, size: 32),
                  ),
          )
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (_, isLoading, __) => AppTextField(
                    labelText: AppStrings.recipeNameLabel,
                    action: TextInputAction.next,
                    maxLength: 30,
                    enabled: !isLoading,
                    validate: _validateRecipeName,
                    controller: _nameTextFieldController,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            sliver: SliverToBoxAdapter(
              child: ValueListenableBuilder(
                valueListenable: _controller.isLoading,
                builder: (_, isLoading, __) => AppTextField(
                  labelText: AppStrings.cookedQuantityGramsLabel,
                  inputType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                  maxLength: 6,
                  autofocus: true,
                  action: TextInputAction.done,
                  controller: _servingSizeTextController,
                  hint: '100',
                  enabled: !isLoading,
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
              builder: (_, nutrition, __) => CaloriesMacrosSection(
                calories: nutrition.calories.toInt(),
                carbsInGrams: nutrition.carbohydrates,
                carbsPercentage: nutrition.carbsPercentage,
                fatInGrams: nutrition.fat,
                fatPercentage: nutrition.fatPercentage,
                proteinInGrams: nutrition.protein,
                proteinPercentage: nutrition.proteinPercentage,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: AppDivider(height: 2)),
          SliverToBoxAdapter(
            child: ExpansionTile(
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
              children: [
                ValueListenableBuilder(
                  valueListenable: _controller.recipeNutrition,
                  builder: (_, nutrition, __) => NutritionSection(nutrition: nutrition),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: AppDivider(height: 2)),
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
            builder: (_, ingredients, __) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => IngredientItem(
                  ingredient: ingredients[index],
                  onSwipe: () => _controller.removeIngredient(
                    index: index,
                    cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
                  ),
                  onTap: () => _navigateToIngredientDetails(index),
                ),
                childCount: ingredients.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: _controller.isLoading,
                builder: (_, isLoading, __) => TextButton(
                  onPressed: isLoading ? null : _navigateToSearchFood,
                  child: Text(AppStrings.addIngredientTitle.toUpperCase()),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
          ),
        ],
      ),
    );
  }

  String? _validateRecipeName(text) => (text?.isNotEmpty ?? false) ? null : AppStrings.emptyRecipeNameError;

  void _navigateToSearchFood() async {
    final result = await Navigator.of(context).pushNamed(Routes.foodSearch.path);
    if (result is RecipeIngredient) {
      _controller.addIngredient(
        ingredient: result,
        cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
      );
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

  void _onServingSizeChanged() => _controller.updateNutrition(
        cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
      );

  void _saveRecipe() {
    if (_formKey.currentState?.validate() ?? false) {
      _controller.saveRecipe().then((error) {
        if (error == CreateRecipeError.none) {
          if (context.mounted) {
            Navigator.of(context).pop();
          } else {
            locator<LoggingService>().info('Context unmounted. Could not pop create recipe screen.');
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.errorCreatingRecipeMessage)),
            );
          } else {
            locator<LoggingService>().info('Could not show error snack bar. Context unmounted.');
          }
        }
      });
    }
  }

  void _navigateToIngredientDetails(int index) async {
    final ingredient = _controller.ingredients.value[index];
    final result = await Navigator.of(context).pushNamed(
      Routes.addFood.path,
      arguments: AddFoodArguments(
        meal: null,
        food: ingredient.food,
        localId: ingredient.food.localFood.id,
        servingSize: ingredient.servingQuantity,
      ),
    );
    if (result is RecipeIngredient) {
      _controller.updateIngredientQuantity(
        index: index,
        ingredientQuantity: result.servingQuantity,
        cookedQuantity: int.tryParse(_servingSizeTextController.text) ?? 100,
      );
    }
  }
}
