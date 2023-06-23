import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/add_food/add_food_controller.dart';
import 'package:calorietracker/features/add_food/calories_macros_pie_chart.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button.dart';
import 'package:calorietracker/ui/strings.dart';
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

    _servingsCountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _servingsCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.addFoodLabel),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check,
                  size: 32,
                ))
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
                  child: AppTextField(
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
                  )),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ValueListenableBuilder(
                      valueListenable: _controller.selectedMeal,
                      builder: (context, selection, child) => AppDropdownButton<Meal>(
                            hint: AppStrings.mealLabel,
                            onChanged: (selectedMeal) => _controller.selectMeal(meal: selectedMeal),
                            optionNameMapper: (meal) => meal.label,
                            options: Meal.values,
                            selectedOption: selection,
                          ))),
              const SizedBox(height: 24),
              const AppDivider(),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CaloriesMacrosPieChart(carbs: 10, fat: 20, protein: 30, calories: 240)],
              ),
              const SizedBox(width: 16),
            ],
          ),
        ));
  }

  void _clearServingsCount() => _servingsCountController.clear();
}
