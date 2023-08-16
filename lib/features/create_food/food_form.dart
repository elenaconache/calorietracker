import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/create_food/food_form_row.dart';
import 'package:calorietracker/features/create_food/macros_inputs.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:calorietracker/validators/food_validator.dart';
import 'package:flutter/material.dart';

class FoodForm extends StatelessWidget {
  final TextEditingController foodNameController;
  final TextEditingController brandNameController;
  final TextEditingController servingSizeController;
  final TextEditingController caloriesController;
  final TextEditingController carbsController;
  final TextEditingController fatController;
  final TextEditingController proteinController;
  final TextEditingController sugarController;
  final TextEditingController fiberController;
  final TextEditingController insolubleFiberController;
  final TextEditingController fatSaturatedController;
  final TextEditingController fatTransController;
  final TextEditingController fatPolyunsaturatedController;
  final TextEditingController fatMonounsaturatedController;
  final TextEditingController cholesterolController;
  final TextEditingController saltController;
  final TextEditingController potassiumController;
  final TextEditingController calciumController;
  final TextEditingController ironController;
  final TextEditingController vitaminAController;
  final TextEditingController vitaminCController;
  final TextEditingController vitaminDController;
  final bool enabled;

  const FoodForm({
    super.key,
    required this.foodNameController,
    required this.brandNameController,
    required this.servingSizeController,
    required this.caloriesController,
    required this.carbsController,
    required this.fatController,
    required this.proteinController,
    required this.sugarController,
    required this.fiberController,
    required this.fatSaturatedController,
    required this.fatTransController,
    required this.fatPolyunsaturatedController,
    required this.fatMonounsaturatedController,
    required this.cholesterolController,
    required this.saltController,
    required this.potassiumController,
    required this.calciumController,
    required this.ironController,
    required this.vitaminAController,
    required this.vitaminCController,
    required this.vitaminDController,
    required this.insolubleFiberController,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final validator = locator<FoodValidator>();
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppTextField(
              controller: foodNameController,
              action: TextInputAction.next,
              autofocus: true,
              maxLength: AppTextField.maxTextInputLength,
              labelText: AppStrings.foodLabel,
              validate: validator.validateFoodName,
              isDense: true,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppTextField(
              controller: brandNameController,
              action: TextInputAction.next,
              maxLength: AppTextField.maxTextInputLength,
              labelText: AppStrings.brandNameLabel,
              isDense: true,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.servingsLabel,
              secondLabel: AppStrings.caloriesLabel,
              firstController: servingSizeController,
              secondController: caloriesController,
              secondValidation: validator.validateCalories,
              firstValidation: validator.validateServingSize,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        MacrosInputSection(
          carbsController: carbsController,
          fatController: fatController,
          proteinController: proteinController,
          enabled: enabled,
        ),
        const SizedBox(height: 8),
        const AppDivider(),
        const SizedBox(height: 12),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppTextField(
              labelText: AppStrings.sugarGramsLabel,
              controller: sugarController,
              inputType: const TextInputType.numberWithOptions(signed: false, decimal: true),
              validate: validator.validateMicronutrient,
              maxLength: AppTextField.maxNumericInputLength,
              isDense: true,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.fiberGramsLabel,
              firstController: fiberController,
              secondLabel: AppStrings.insolubleFiberGramsLabel,
              secondController: insolubleFiberController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.saturatedFatGramsLabel,
              firstController: fatSaturatedController,
              secondLabel: AppStrings.transFatGramsLabel,
              secondController: fatTransController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.monoFatGramsLabel,
              firstController: fatMonounsaturatedController,
              secondLabel: AppStrings.polyFatGramsLabel,
              secondController: fatPolyunsaturatedController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.cholesterolMgLabel,
              firstController: cholesterolController,
              secondLabel: AppStrings.saltGramsLabel,
              secondController: saltController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.ironMgLabel,
              firstController: ironController,
              secondLabel: AppStrings.potassiumMgLabel,
              secondController: potassiumController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.calciumMgLabel,
              firstController: calciumController,
              secondLabel: AppStrings.vitaminDIULabel,
              secondController: vitaminDController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.vitaminAIULabel,
              firstController: vitaminAController,
              secondLabel: AppStrings.vitaminCMgLabel,
              secondController: vitaminCController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              enabled: enabled,
            )),
      ],
    );
  }
}
