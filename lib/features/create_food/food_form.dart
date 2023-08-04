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
  });

  @override
  Widget build(BuildContext context) {
    final validator = locator<FoodValidator>();
    return ListView(
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
            )),
        const SizedBox(height: 8),
        MacrosInputSection(
          carbsController: carbsController,
          fatController: fatController,
          proteinController: proteinController,
        ),
        const SizedBox(height: 8),
        const AppDivider(),
        const SizedBox(height: 12),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.sugarLabel,
              firstController: sugarController,
              secondLabel: AppStrings.fiberLabel,
              secondController: fiberController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.saturatedFatLabel,
              firstController: fatSaturatedController,
              secondLabel: AppStrings.transFatLabel,
              secondController: fatTransController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.monoFatShortLabel,
              firstController: fatMonounsaturatedController,
              secondLabel: AppStrings.polyFatShortLabel,
              secondController: fatPolyunsaturatedController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.cholesterolLabel,
              firstController: cholesterolController,
              secondLabel: AppStrings.saltLabel,
              secondController: saltController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.ironLabel,
              firstController: ironController,
              secondLabel: AppStrings.potassiumLabel,
              secondController: potassiumController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              thirdLabel: AppStrings.calciumLabel,
              thirdValidation: validator.validateMicronutrient,
              thirdController: calciumController,
            )),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FoodFormRow(
              firstLabel: AppStrings.vitaminALabel,
              firstController: vitaminAController,
              secondLabel: AppStrings.vitaminCLabel,
              secondController: vitaminCController,
              thirdLabel: AppStrings.vitaminDLabel,
              thirdController: vitaminDController,
              firstValidation: validator.validateMicronutrient,
              secondValidation: validator.validateMicronutrient,
              thirdValidation: validator.validateMicronutrient,
            )),
      ],
    );
  }
}
