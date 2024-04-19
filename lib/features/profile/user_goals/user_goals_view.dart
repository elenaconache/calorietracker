import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/profile/user_goals/macros_form.dart';
import 'package:calorietracker/features/profile/user_goals/macros_pickers.dart';
import 'package:calorietracker/features/profile/user_goals/user_goals_controller.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/macro.dart';
import 'package:calorietracker/models/user_goals.dart';
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
          final goals = _controller.userGoals.value;
          if (goals is FutureSuccess<UserGoals>) {
            _caloriesController.text = goals.data.calories.toString();
            _carbsController.text = _controller.carbsGramsGoal?.toString() ?? '';
            _proteinController.text = _controller.proteinGramsGoal?.toString() ?? '';
            _fatController.text = _controller.fatGramsGoal?.toString() ?? '';
          }
        }),
      ),
    );
    _caloriesController.addListener(_onCaloriesChanged);
  }

  @override
  void dispose() {
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
      appBar: AppBar(title: Text(AppStrings.myGoalsLabel)),
      body: ValueListenableBuilder(
        valueListenable: _controller.userGoals,
        builder: (context, goals, _) => switch (goals) {
          FutureLoading<dynamic> _ => const Center(child: CircularProgressIndicator()),
          FutureSuccess<UserGoals> userGoals => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 16),
                  AppTextField(
                    autofocus: true,
                    validate: locator<FoodValidator>().validateCalories,
                    controller: _caloriesController,
                    maxLength: 5,
                    labelText: AppStrings.caloriesLabel,
                    inputType: TextInputType.number,
                    action: TextInputAction.next,
                  ),
                  TabBar(
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
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        MacrosForm(
                          carbsController: _carbsController,
                          proteinController: _proteinController,
                          fatController: _fatController,
                        ),
                        MacrosPickers(
                          userGoals: userGoals.data,
                          onValuePicked: _onMacroPercentagePicked,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          FutureError<dynamic> _ => const Center(child: GeneralErrorView()),
          _ => const SizedBox.shrink()
        },
      ),
    );
  }

  void _onMacroPercentagePicked(Macro macro, int pickedValue) {}

  void _onCaloriesChanged() {
    final calories = int.tryParse(_caloriesController.text);
    if (calories != null) {
      _controller.onCaloriesGoalChanged(calories: calories);
      _carbsController.text = _controller.carbsGramsGoal?.toString() ?? '';
      _proteinController.text = _controller.proteinGramsGoal?.toString() ?? '';
      _fatController.text = _controller.fatGramsGoal?.toString() ?? '';
    }
  }
}
