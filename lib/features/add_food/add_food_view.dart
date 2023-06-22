import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/features/add_food/add_food_controller.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
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

  @override
  void initState() {
    _controller = locator<AddFoodController>();
    _controller.selectMeal(meal: widget.args.meal);
    super.initState();
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                  valueListenable: _controller.selectedMeal,
                  builder: (context, selection, child) => AppDropdownButton<Meal>(
                        hint: AppStrings.mealLabel,
                        onChanged: (selectedMeal) => _controller.selectMeal(meal: selectedMeal),
                        optionNameMapper: _mealToNameMapper,
                        options: Meal.values,
                        selectedOption: selection,
                      )))
        ])));
  }

  String _mealToNameMapper(meal) {
    switch (meal) {
      case Meal.breakfast:
        return AppStrings.breakfastLabel;
      case Meal.lunch:
        return AppStrings.lunchLabel;
      case Meal.dinner:
        return AppStrings.dinnerLabel;
      case Meal.snacks:
        return AppStrings.snacksLabel;
      default:
        return '';
    }
  }
}
