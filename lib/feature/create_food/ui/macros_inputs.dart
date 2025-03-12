import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:flutter/material.dart';

class MacrosInputSection extends StatelessWidget {
  final TextEditingController carbsController;
  final TextEditingController fatController;
  final TextEditingController proteinController;
  final bool enabled;

  const MacrosInputSection({
    super.key,
    required this.carbsController,
    required this.fatController,
    required this.proteinController,
    required this.enabled,
  });

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
              labelText: AppStrings.carbsGramsLabel,
              controller: carbsController,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validate: validator.validateMacro,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
              enabled: enabled,
            )),
            const SizedBox(width: 12),
            Expanded(
                child: AppTextField(
              labelText: AppStrings.fatGramsLabel,
              controller: fatController,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validate: validator.validateMacro,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
              enabled: enabled,
            )),
            const SizedBox(width: 12),
            Expanded(
                child: AppTextField(
              labelText: AppStrings.proteinGramsLabel,
              controller: proteinController,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              validate: validator.validateMacro,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
              enabled: enabled,
            ))
          ],
        ));
  }
}
