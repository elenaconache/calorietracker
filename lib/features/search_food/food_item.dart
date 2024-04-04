import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/home/home_view.dart';
import 'package:calorietracker/features/search_food/food_item_controller.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/recipe_ingredient.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/numeric_formatting_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final Food? remoteFood;
  final Meal? meal;
  final double servingQuantity;
  final String unitName;
  final Nutrition nutritionPerServingQuantity;
  final LocalFood? localFood;

  const FoodItem({
    super.key,
    this.remoteFood,
    required this.meal,
    required this.servingQuantity,
    required this.unitName,
    required this.nutritionPerServingQuantity,
    this.localFood,
  });

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  late final FoodItemController _controller;

  @override
  void initState() {
    super.initState();
    _controller = locator<FoodItemController>();
  }

  @override
  void dispose() {
    _controller.isLoggingLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => _navigateToAddFood(context),
        child: Ink(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const AppDivider(),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    if (brand != null)
                      Text(
                        brand!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    const SizedBox(height: 2),
                    Text(
                      _caloriesText,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ]),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: ValueListenableBuilder(
                    valueListenable: _controller.isLoggingLoading,
                    builder: (_, loading, __) => loading
                        ? const Center(
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Ink(
                            decoration: _getAddButtonDecoration(context),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => _onAddPressed(context),
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                  ),
                ),
              ]),
              const SizedBox(height: 8),
            ]),
          ),
        ),
      ),
    );
  }

  void _onAddPressed(BuildContext context) {
    if (widget.localFood == null && widget.remoteFood == null) {
      locator<LoggingService>().info('Missing food data, could not log to diary.');
    } else if (widget.meal == null) {
      // TODO: quick add ingredient to recipe
    } else {
      unawaited(_controller
          .logFood(
        food: widget.remoteFood ?? Food.local(localFood: widget.localFood!),
        meal: widget.meal!,
        servingQuantity: widget.servingQuantity,
        localFoodId: widget.localFood?.id,
        remoteFoodId: widget.remoteFood?.id ?? widget.localFood?.foodId,
      )
          .then((added) {
        final message = added ? AppStrings.foodLoggedMessage : AppStrings.errorAddFood;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }));
    }
  }

  String? get name => widget.remoteFood?.name ?? widget.localFood?.name;

  String? get brand => widget.remoteFood?.brandName ?? widget.localFood?.brand;

  BoxDecoration _getAddButtonDecoration(BuildContext context) => BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      );

  String get _caloriesText {
    final numericFormatter = locator<NumericFormattingService>();
    return AppStrings.caloriesServingShortLabel(
      widget.nutritionPerServingQuantity.calories.toStringAsFixed(0),
      numericFormatter.formatDecimals(value: widget.servingQuantity),
      widget.unitName,
    );
  }

  void _navigateToAddFood(BuildContext context) async {
    if (widget.remoteFood == null && widget.localFood == null) {
      locator<LoggingService>().info('Attempt to log food when both collection and local search result were empty.');
      return;
    }
    final result = await Navigator.pushNamed(
      context,
      Routes.addFood.path,
      arguments: AddFoodArguments(
          meal: widget.meal,
          food: widget.remoteFood ?? Food.local(localFood: widget.localFood!),
          localId: widget.localFood?.id),
    );
    if (result is RecipeIngredient) {
      Navigator.of(recipeNavigatorKey.currentContext!).pop(result);
    }
  }
}
