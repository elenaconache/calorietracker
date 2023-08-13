import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:flutter/material.dart';

class FoodFormRow extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final String? thirdLabel;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final String? Function(String? text) firstValidation;
  final String? Function(String? text) secondValidation;

  const FoodFormRow({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    this.thirdLabel,
    required this.firstController,
    required this.secondController,
    required this.firstValidation,
    required this.secondValidation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: AppTextField(
          labelText: firstLabel,
          controller: firstController,
          inputType: const TextInputType.numberWithOptions(signed: false, decimal: true),
          validate: firstValidation,
          maxLength: AppTextField.maxNumericInputLength,
          isDense: true,
        )),
        const SizedBox(width: 12),
        Expanded(
            child: AppTextField(
          labelText: secondLabel,
          controller: secondController,
          inputType: TextInputType.number,
          validate: secondValidation,
          maxLength: AppTextField.maxNumericInputLength,
          isDense: true,
        )),
      ],
    );
  }
}
