import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/add_food/add_food_controller.dart';
import 'package:calorietracker/features/add_food/food_log.dart';
import 'package:calorietracker/ui/components/calories_macros_section.dart';
import 'package:calorietracker/features/add_food/nutrition_section.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
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
    _controller = locator<AddFoodController>();
    _controller.selectMeal(meal: widget.args.meal);
    _controller.initializeNutrients(nutrition: widget.args.food.nutrition);

    _servingsCountController = TextEditingController();
    _servingsCountController.text = 100.toString();
    _servingsCountController.addListener(_onServingSizeChanged);
    super.initState();
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
          title: Text(AppStrings.logFoodLabel),
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
                        ))
                    : IconButton(
                        // TODO: send barcode as parameter to this view if the user scanned a barcode.
                        onPressed: () => _logFood(context),
                        icon: const Icon(
                          Icons.check,
                          size: 32,
                        )))
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
                  )),
              if (widget.args.food.brandName != null)
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      widget.args.food.brandName!,
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
              const SizedBox(height: 12),
              const AppDivider(),
              const SizedBox(height: 24),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder(
                      valueListenable: _controller.isLoading,
                      builder: (context, isLoading, _) => AppTextField(
                            enabled: !isLoading,
                            labelText: AppStrings.servingsLabel,
                            suffixIcon: Icons.clear,
                            onSuffixIconPressed: _clearServingsCount,
                            controller: _servingsCountController,
                            inputType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            maxLength: 6,
                            autofocus: true,
                            action: TextInputAction.done,
                          ))),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder(
                      valueListenable: _controller.isLoading,
                      builder: (context, isLoading, _) => ValueListenableBuilder(
                          valueListenable: _controller.selectedMeal,
                          builder: (context, selection, child) => AppDropdownButton<Meal>(
                                hint: AppStrings.mealLabel,
                                onChanged: (selectedMeal) => _controller.selectMeal(meal: selectedMeal),
                                optionNameMapper: (meal) => meal.label,
                                options: Meal.values,
                                selectedOption: selection,
                                enabled: !isLoading,
                              )))),
              const SizedBox(height: 24),
              const AppDivider(),
              // TODO: extract model for this component's parameters
              ValueListenableBuilder(
                  valueListenable: _controller.currentServingSizeNutrients,
                  builder: (context, value, child) => CaloriesMacrosSection(
                      calories: _controller.calories,
                      carbsPercentage: _controller.carbsPercentage,
                      proteinPercentage: _controller.proteinPercentage,
                      fatPercentage: _controller.fatPercentage,
                      carbsInGrams: _controller.carbsInGrams,
                      fatInGrams: _controller.fatInGrams,
                      proteinInGrams: _controller.proteinInGrams)),
              const SizedBox(height: 12),
              const AppDivider(),
              ValueListenableBuilder(
                  valueListenable: _controller.currentServingSizeNutrients,
                  builder: (context, currentServingSizeNutrients, child) => currentServingSizeNutrients != null
                      ? NutritionSection(nutrition: currentServingSizeNutrients)
                      : const SizedBox.shrink()),
              const SizedBox(height: 24),
            ],
          ),
        ));
  }

  void _logFood(BuildContext context) {
    final servingQuantity = double.tryParse(_servingsCountController.text);
    if (servingQuantity == null) {
      locator<LoggingService>().handle(
        Exception('Could not log food with null serving quantity.'),
        StackTrace.current,
      );
    } else {
      final foodLog = FoodLog(
        meal: widget.args.meal,
        food: widget.args.food,
        servingQuantity: servingQuantity,
        localFoodId: widget.args.localId,
        date: DateTime.now(), // TODO: handle logging a food for a different date too, not just for today
      );
      unawaited(_controller.logFood(foodLog: foodLog).then((_) {
        if (context.mounted) {
          Navigator.pop(context);
        } else {
          locator<LoggingService>().info('Could not pop add food screen. Context unmounted.');
        }
      }).catchError((_, __) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppStrings.errorAddFood)));
        } else {
          locator<LoggingService>().info('Could not show error snack bar. Context unmounted.');
        }
      }));
    }
  }

  void _clearServingsCount() => _servingsCountController.clear();

  void _onServingSizeChanged() => _controller.recalculateNutrition(servingSizeGrams: _servingsCountController.text);
}
