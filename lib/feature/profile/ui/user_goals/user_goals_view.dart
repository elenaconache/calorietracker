import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/profile/ui/user_goals/macro_percentage_goals.dart';
import 'package:calorietracker/feature/profile/ui/user_goals/macros_form.dart';
import 'package:calorietracker/feature/profile/logic/user_goals_controller.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/macro.dart';
import 'package:calorietracker/shared/model/user_goals.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:flutter/material.dart';

class UserGoalsView extends StatefulWidget {
  const UserGoalsView({super.key});

  @override
  State<UserGoalsView> createState() => _UserGoalsViewState();
}

class _UserGoalsViewState extends State<UserGoalsView> with SingleTickerProviderStateMixin {
  late final TextEditingController _caloriesController;
  late final TextEditingController _carbsController;
  late final TextEditingController _proteinController;
  late final TextEditingController _fatController;
  late final TabController _tabController;
  late final UserGoalsController _controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _caloriesController = TextEditingController();
    _carbsController = TextEditingController();
    _proteinController = TextEditingController();
    _fatController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _controller = locator<UserGoalsController>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => unawaited(
        _controller.fetchStoredUserGoals().then((_) {
          final goals = _controller.macroGoals.value;
          _caloriesController.text = goals.calories.toString();
          _carbsController.text = goals.roundedCarbsGrams.toString();
          _proteinController.text = goals.roundedProteinGrams.toString();
          _fatController.text = goals.roundedFatGrams.toString();
          _addMacrosListeners();
        }),
      ),
    );
    _caloriesController.addListener(_onCaloriesChanged);
    _formKey = GlobalKey<FormState>(debugLabel: 'goalsForm');
  }

  @override
  void dispose() {
    _caloriesController.removeListener(_onCaloriesChanged);
    _removeMacrosListeners();
    _caloriesController.dispose();
    _carbsController.dispose();
    _proteinController.dispose();
    _fatController.dispose();
    _tabController.dispose();
    _controller.userGoals.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.myGoalsLabel),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: _onDonePressed,
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: _controller.userGoals,
        builder: (context, goals, _) => switch (goals) {
          FutureLoading<dynamic> _ => const Center(child: CircularProgressIndicator()),
          FutureSuccess<UserGoals> _ => Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: AppTextField(
                      autofocus: true,
                      validate: locator<FoodValidator>().validateCalories,
                      controller: _caloriesController,
                      maxLength: 5,
                      labelText: AppStrings.caloriesLabel,
                      inputType: TextInputType.number,
                      action: TextInputAction.next,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBar(
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          AppStrings.gramsLabel,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          AppStrings.percentagesLabel,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                    controller: _tabController,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MacrosForm(
                          carbsController: _carbsController,
                          proteinController: _proteinController,
                          fatController: _fatController,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: _controller.macroGoals,
                        builder: (_, macroGoals, __) => MacroPercentageGoals(
                          macroGoals: macroGoals,
                          onMacroPercentagePicked: _onMacroPercentagePicked,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          FutureError<dynamic> _ => const Center(child: GeneralErrorView()),
          _ => const SizedBox.shrink()
        },
      ),
    );
  }

  void _onMacroPercentagePicked(Macro macro, int pickedValue) {
    _controller.onMacroPercentageChanged(macro: macro, value: pickedValue);
    final goals = _controller.macroGoals.value;
    if (goals.roundedCarbsPercentage + goals.roundedFatPercentage + goals.roundedProteinPercentage == 100) {
      _carbsController.text = goals.roundedCarbsGrams.toString();
      _proteinController.text = goals.roundedProteinGrams.toString();
      _fatController.text = goals.roundedFatGrams.toString();
    }
  }

  void _removeMacrosListeners() {
    _carbsController.removeListener(_onCarbsGramsChanged);
    _proteinController.removeListener(_onProteinGramsChanged);
    _fatController.removeListener(_onFatGramsChanged);
  }

  void _addMacrosListeners() {
    _carbsController.addListener(_onCarbsGramsChanged);
    _proteinController.addListener(_onProteinGramsChanged);
    _fatController.addListener(_onFatGramsChanged);
  }

  void _onCaloriesChanged() {
    final calories = double.tryParse(_caloriesController.text);
    if (calories != null && calories != _controller.macroGoals.value.calories) {
      _removeMacrosListeners();
      _controller.onCaloriesGoalChanged(calories: calories);
      _carbsController.text = _controller.macroGoals.value.roundedCarbsGrams.toString();
      _proteinController.text = _controller.macroGoals.value.roundedProteinGrams.toString();
      _fatController.text = _controller.macroGoals.value.roundedFatGrams.toString();
      _addMacrosListeners();
    }
  }

  void _onCarbsGramsChanged() {
    _removeMacrosListeners();
    final carbs = int.tryParse(_carbsController.text);
    if (carbs != null && carbs != _controller.macroGoals.value.roundedCarbsGrams) {
      _controller.onCarbsGramsChanged(value: carbs);
      _updateCaloriesGoal();
    }
    _addMacrosListeners();
  }

  void _updateCaloriesGoal() {
    _caloriesController.removeListener(_onCaloriesChanged);
    _caloriesController.text =
        (_controller.userGoals.value as FutureSuccess<UserGoals>).data.calories.toInt().toString();
    _caloriesController.addListener(_onCaloriesChanged);
  }

  void _onProteinGramsChanged() {
    _removeMacrosListeners();
    final protein = int.tryParse(_proteinController.text);
    if (protein != null && protein != _controller.macroGoals.value.roundedProteinGrams) {
      _controller.onProteinGramsChanged(value: protein);
      _updateCaloriesGoal();
    }
    _addMacrosListeners();
  }

  void _onFatGramsChanged() {
    _removeMacrosListeners();
    final fat = int.tryParse(_fatController.text);
    if (fat != null && fat != _controller.macroGoals.value.roundedFatGrams) {
      _controller.onFatGramsChanged(value: fat);
      _updateCaloriesGoal();
    }
    _addMacrosListeners();
  }

  void _onDonePressed() {
    if (_formKey.currentState?.validate() ?? false) {}
  }
}
