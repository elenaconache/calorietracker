import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:flutter/material.dart';

class MacrosForm extends StatelessWidget {
  final TextEditingController carbsController;
  final TextEditingController proteinController;
  final TextEditingController fatController;

  const MacrosForm({
    super.key,
    required this.carbsController,
    required this.proteinController,
    required this.fatController,
  });

  @override
  Widget build(BuildContext context) {
    final foodValidator = locator<FoodValidator>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        AppTextField(
          validate: foodValidator.validateMacro,
          controller: carbsController,
          maxLength: 4,
          labelText: AppStrings.carbsLabel,
          inputType: TextInputType.number,
          action: TextInputAction.next,
        ),
        const SizedBox(height: 8),
        AppTextField(
          validate: foodValidator.validateMacro,
          controller: proteinController,
          maxLength: 4,
          labelText: AppStrings.proteinLabel,
          inputType: TextInputType.number,
          action: TextInputAction.next,
        ),
        const SizedBox(height: 8),
        AppTextField(
          validate: foodValidator.validateMacro,
          controller: fatController,
          maxLength: 4,
          labelText: AppStrings.fatLabel,
          inputType: TextInputType.number,
          action: TextInputAction.next,
        ),
      ],
    );
  }
}
