import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:flutter/material.dart';

class RecipeNameField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController textController;
  final bool enabled;

  const RecipeNameField({
    super.key,
    required this.formKey,
    required this.textController,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AppTextField(
        labelText: AppStrings.recipeNameLabel,
        action: TextInputAction.next,
        maxLength: 30,
        enabled: enabled,
        validate: _validateRecipeName,
        controller: textController,
        textColor: !enabled ? Theme.of(context).textTheme.bodyLarge?.color : null,
      ),
    );
  }

  String? _validateRecipeName(String? text) => (text?.isNotEmpty ?? false) ? null : AppStrings.emptyRecipeNameError;
}
