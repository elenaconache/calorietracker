import 'package:calorietracker/feature/profile/logic/user_goals_cubit.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/profile/ui/user_goals/macro_percentage_goals.dart';
import 'package:calorietracker/feature/profile/ui/user_goals/macros_form.dart';
import 'package:calorietracker/shared/data/model/macro.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:calorietracker/shared/data/validators/food_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _caloriesController = TextEditingController();
    _carbsController = TextEditingController();
    _proteinController = TextEditingController();
    _fatController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
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
      body: BlocConsumer<UserGoalsCubit, UserGoalsState>(
        listenWhen: (previous, current) => previous.macroGoals.data != current.macroGoals.data || previous.userGoals.data != current.userGoals.data,
        listener: (context, state) {
          final goals = state.macroGoals.data;
          if (goals != null) {
            _caloriesController.text = goals.calories.toString();
            _carbsController.text = goals.roundedCarbsGrams.toString();
            _proteinController.text = goals.roundedProteinGrams.toString();
            _fatController.text = goals.roundedFatGrams.toString();

            _addMacrosListeners();
          }
        },
        buildWhen: (previous, current) =>
            previous.userGoals.status != current.userGoals.status || previous.macroGoals.status != current.macroGoals.status,
        builder: (context, state) {
          return switch (state.userGoals.status) {
            LoadingStatus _ => const Center(child: CircularProgressIndicator()),
            SuccessStatus _ => Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: AppTextField(
                        autofocus: true,
                        validate: getIt<FoodValidator>().validateCalories,
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
                        state.macroGoals.data == null
                            ? const SizedBox.shrink()
                            : MacroPercentageGoals(
                                macroGoals: state.macroGoals.data!,
                                onMacroPercentagePicked: _onMacroPercentagePicked,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            FutureError<dynamic> _ => const Center(child: GeneralErrorView()),
            _ => const SizedBox.shrink()
          };
        },
      ),
    );
  }

  void _onMacroPercentagePicked(Macro macro, int pickedValue) {
    context.read<UserGoalsCubit>().onMacroPercentageChanged(macro: macro, value: pickedValue);
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
    final cubit = context.read<UserGoalsCubit>();
    final state = cubit.state.macroGoals.data;
    final calories = double.tryParse(_caloriesController.text);
    if (calories != null && calories != state?.calories) {
      _removeMacrosListeners();
      cubit.onCaloriesChanged(calories: calories);
    }
  }

  void _onCarbsGramsChanged() {
    final cubit = context.read<UserGoalsCubit>();
    final state = cubit.state.macroGoals.data;
    final carbs = int.tryParse(_carbsController.text);
    if (carbs != null && carbs != state?.roundedCarbsGrams) {
      _removeMacrosListeners();
      cubit.onMacroGramsChanged(macro: Macro.carbohydrates, value: carbs);
    }
  }

  void _onProteinGramsChanged() {
    final cubit = context.read<UserGoalsCubit>();
    final state = cubit.state.macroGoals.data;
    final protein = int.tryParse(_proteinController.text);
    if (protein != null && protein != state?.roundedProteinGrams) {
      _removeMacrosListeners();
      cubit.onMacroGramsChanged(macro: Macro.protein, value: protein);
    }
  }

  void _onFatGramsChanged() {
    final cubit = context.read<UserGoalsCubit>();
    final state = cubit.state.macroGoals.data;
    final fat = int.tryParse(_fatController.text);
    if (fat != null && fat != state?.roundedFatGrams) {
      _removeMacrosListeners();
      cubit.onMacroGramsChanged(macro: Macro.fat, value: fat);
    }
  }

  void _onDonePressed() {
    if (_formKey.currentState?.validate() ?? false) {}
  }
}
