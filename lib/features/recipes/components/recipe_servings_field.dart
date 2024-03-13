import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class RecipeServingsField extends StatelessWidget {
  final TextEditingController textController;
  final bool isLoading;
  final bool enabled;

  const RecipeServingsField({
    super.key,
    required this.textController,
    required this.isLoading,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      labelText: AppStrings.cookedQuantityGramsLabel,
      inputType: const TextInputType.numberWithOptions(decimal: true, signed: false),
      maxLength: 6,
      autofocus: true,
      action: TextInputAction.done,
      controller: textController,
      hint: '100',
      enabled: enabled && !isLoading,
      textColor: !isLoading ? Theme.of(context).textTheme.bodyLarge?.color : null,
    );
  }
}
