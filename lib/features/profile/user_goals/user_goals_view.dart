import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/profile/user_goals/macros_form.dart';
import 'package:calorietracker/features/profile/user_goals/macros_pickers.dart';
import 'package:calorietracker/ui/app_strings.dart';
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

  @override
  void initState() {
    super.initState();
    _caloriesController = TextEditingController();
    _carbsController = TextEditingController();
    _proteinController = TextEditingController();
    _fatController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
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
      appBar: AppBar(title: Text(AppStrings.myGoalsLabel)),
      body: Padding(
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
                  const MacrosPickers(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
