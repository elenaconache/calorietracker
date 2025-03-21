import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/add_food_arguments.dart';
import 'package:calorietracker/feature/add_food/logic/add_food_controller.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/shared/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/ui/components/calories_macros_section.dart';
import 'package:calorietracker/ui/components/nutrition_section.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button.dart';
import 'package:flutter/material.dart';

class AddFoodView extends StatefulWidget {
  final AddFoodArguments args;

  const AddFoodView({super.key, required this.args});

  @override
  State<AddFoodView> createState() => _AddFoodViewState();
}

class _AddFoodViewState extends State<AddFoodView> {
  late final AddFoodController _controller;
  late final TextEditingController _servingsCountController;

  @override
  void initState() {
    super.initState();
    _controller = getIt<AddFoodController>();
    _controller
      ..selectMeal(meal: widget.args.meal)
      ..initializeNutrients(nutrition: widget.args.food.nutrition);
    final initialServingSize = widget.args.servingSize ?? 100;
    if (initialServingSize != 100) {
      _controller.recalculateNutrition(servingSizeGrams: initialServingSize.toString());
    }
    _servingsCountController = TextEditingController();
    _servingsCountController.addListener(_onServingSizeChanged);
    _servingsCountController.text = initialServingSize.toString();
  }

  @override
  void dispose() {
    _servingsCountController.dispose();
    _controller.selectedMeal.dispose();
    _controller.currentServingSizeNutrients.dispose();
    _servingsCountController.removeListener(_onServingSizeChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.args.meal == null ? AppStrings.addIngredientTitle : AppStrings.logFoodLabel),
          actions: [
            ValueListenableBuilder(
              valueListenable: _controller.isLoading,
              builder: (context, isLoading, _) => isLoading
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : IconButton(
                      // TODO: send barcode as parameter to this view if the user scanned a barcode.
                      onPressed: () => _confirmFood(context),
                      icon: const Icon(Icons.check, size: 32),
                    ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                child: Text(
                  widget.args.food.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (widget.args.food.brandName != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    widget.args.food.brandName!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              const SizedBox(height: 12),
              const AppDivider(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (_, isLoading, __) => AppTextField(
                    enabled: !isLoading,
                    labelText: AppStrings.servingsLabel,
                    suffixIcon: Icons.clear,
                    onSuffixIconPressed: _clearServingsCount,
                    controller: _servingsCountController,
                    inputType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                    maxLength: 6,
                    autofocus: true,
                    action: TextInputAction.done,
                  ),
                ),
              ),
              if (widget.args.meal != null) ...[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder(
                    valueListenable: _controller.isLoading,
                    builder: (_, isLoading, __) => ValueListenableBuilder(
                      valueListenable: _controller.selectedMeal,
                      builder: (_, selection, __) => AppDropdownButton<Meal>(
                        hint: AppStrings.mealLabel,
                        onChanged: (selectedMeal) => _controller.selectMeal(meal: selectedMeal),
                        optionNameMapper: (meal) => meal.label,
                        options: Meal.values,
                        selectedOption: selection,
                        enabled: !isLoading,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              const AppDivider(),
              // TODO: extract model for this component's parameters
              ValueListenableBuilder(
                valueListenable: _controller.currentServingSizeNutrients,
                builder: (_, __, ___) => CaloriesMacrosSection(
                  calories: _controller.calories,
                  carbsPercentage: _controller.carbsPercentage,
                  proteinPercentage: _controller.proteinPercentage,
                  fatPercentage: _controller.fatPercentage,
                  carbsInGrams: _controller.carbsInGrams,
                  fatInGrams: _controller.fatInGrams,
                  proteinInGrams: _controller.proteinInGrams,
                ),
              ),
              const SizedBox(height: 12),
              const AppDivider(),
              ValueListenableBuilder(
                valueListenable: _controller.currentServingSizeNutrients,
                builder: (_, currentServingSizeNutrients, __) =>
                    currentServingSizeNutrients != null ? NutritionSection(nutrition: currentServingSizeNutrients) : const SizedBox.shrink(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ));
  }

  void _confirmFood(BuildContext context) {
    final servingQuantity = double.tryParse(_servingsCountController.text);
    if (servingQuantity == null) {
      getIt<LoggingService>().handle(
        Exception('Could not log food with null serving quantity.'),
        StackTrace.current,
      );
    } else {
      getIt<SearchFoodService>().clearResults();
      if (widget.args.meal == null) {
        _confirmRecipeIngredient(context, servingQuantity);
      } else {
        final date = DateTime.tryParse(getIt<DiaryService>().selectedDay.value);
        if (date == null) {
          getIt<LoggingService>().info('Could not log to diary. Missing date.');
        } else {
          _confirmDiaryLog(servingQuantity, date, context);
        }
      }
    }
  }

  void _confirmDiaryLog(double servingQuantity, DateTime date, BuildContext context) {
    final foodLog = FoodLog(
      meal: widget.args.meal!,
      food: widget.args.food,
      servingQuantity: servingQuantity,
      localFoodId: widget.args.localFoodId,
      date: date,
    );
    unawaited(
      _controller
          .logFood(
              foodLog: foodLog,
              remoteDiaryEntryId: widget.args.diaryEntryId,
              localDiaryEntryId: widget.args.localDiaryEntryId,
              initialMeal: widget.args.meal)
          .then((_) {
        if (context.mounted) {
          Navigator.pop(context);
        } else {
          getIt<LoggingService>().info('Could not pop add food screen. Context unmounted.');
        }
      }).catchError((_, __) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.args.diaryEntryId != null || widget.args.localDiaryEntryId != null ? AppStrings.updateLogError : AppStrings.errorAddFood,
              ),
            ),
          );
        } else {
          getIt<LoggingService>().info('Could not show error snack bar. Context unmounted.');
        }
      }),
    );
  }

  void _confirmRecipeIngredient(BuildContext context, double servingQuantity) {
    _controller.createFood(food: widget.args.food).then((createdFoodId) {
      if (createdFoodId != null) {
        if (context.mounted) {
          Navigator.of(context).pop(
            RecipeIngredient(food: widget.args.food.copyWith(id: createdFoodId), servingQuantity: servingQuantity),
          );
        } else {
          getIt<LoggingService>().info('Could not pop screen. Context unmounted.');
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppStrings.addIngredientError)));
        } else {
          getIt<LoggingService>().info('Could not show error snack bar. Context unmounted.');
        }
      }
    });
  }

  void _clearServingsCount() => _servingsCountController.clear();

  void _onServingSizeChanged() => _controller.recalculateNutrition(servingSizeGrams: _servingsCountController.text);
}
