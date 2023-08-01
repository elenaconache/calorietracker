import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:flutter/material.dart';

class MacrosInputSection extends StatelessWidget {
  final TextEditingController carbsController;
  final TextEditingController fatController;
  final TextEditingController proteinController;

  const MacrosInputSection({super.key, required this.carbsController, required this.fatController, required this.proteinController});

  @override
  Widget build(BuildContext context) {
    final validator = locator<FoodValidator>();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: AppTextField(
              labelText: AppStrings.carbsLabel,
              controller: carbsController,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validate: validator.validateMacro,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
            )),
            const SizedBox(width: 12),
            Expanded(
                child: AppTextField(
              labelText: AppStrings.fatLabel,
              controller: fatController,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validate: validator.validateMacro,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
            )),
            const SizedBox(width: 12),
            Expanded(
                child: AppTextField(
              labelText: AppStrings.proteinLabel,
              controller: proteinController,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validate: validator.validateMacro,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
            ))
          ],
        ));
  }
}
