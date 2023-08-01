import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:flutter/material.dart';

class FoodFormRow extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final String? thirdLabel;
  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController? thirdController;
  final String? Function(String? text) firstValidation;
  final String? Function(String? text) secondValidation;
  final String? Function(String? text)? thirdValidation;

  const FoodFormRow({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    this.thirdLabel,
    required this.firstController,
    required this.secondController,
    this.thirdController,
    required this.firstValidation,
    required this.secondValidation,
    this.thirdValidation,
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
          inputType: TextInputType.number,
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
        if (thirdLabel != null) ...[
          const SizedBox(width: 12),
          Expanded(
              child: AppTextField(
            labelText: thirdLabel,
            controller: thirdController,
            inputType: TextInputType.number,
            validate: thirdValidation,
            maxLength: AppTextField.maxNumericInputLength,
            isDense: true,
          )),
        ]
      ],
    );
  }
}
