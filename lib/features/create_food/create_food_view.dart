import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:flutter/material.dart';

const _maxTextLength = 100;

class CreateFoodView extends StatefulWidget {
  const CreateFoodView({super.key});

  @override
  State<CreateFoodView> createState() => _CreateFoodViewState();
}

class _CreateFoodViewState extends State<CreateFoodView> {
  late final TextEditingController _foodNameController;
  late final TextEditingController _brandNameController;
  late final TextEditingController _servingSizeController;
  late final TextEditingController _caloriesController;
  late final TextEditingController _carbsController;
  late final TextEditingController _fatController;
  late final TextEditingController _proteinController;

  final _formKey = GlobalKey<FormState>(debugLabel: 'createFoodForm');

  @override
  void initState() {
    _foodNameController = TextEditingController();
    _brandNameController = TextEditingController();
    _servingSizeController = TextEditingController();
    _caloriesController = TextEditingController();
    _carbsController = TextEditingController();
    _fatController = TextEditingController();
    _proteinController = TextEditingController();

    _servingSizeController.text = 100.toString();

    super.initState();
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _brandNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.createFoodLabel),
            actions: [
              IconButton(
                  onPressed: _onDonePressed,
                  icon: const Icon(
                    Icons.check,
                    size: 32,
                  ))
            ],
          ),
          body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 12),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextField(
                        controller: _foodNameController,
                        action: TextInputAction.next,
                        autofocus: true,
                        maxLength: _maxTextLength,
                        labelText: AppStrings.foodLabel,
                        validate: _validateFoodName,
                      )),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextField(
                        controller: _brandNameController,
                        action: TextInputAction.next,
                        maxLength: _maxTextLength,
                        labelText: AppStrings.brandNameLabel,
                      )),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextField(
                        labelText: AppStrings.servingsLabel,
                        controller: _servingSizeController,
                        inputType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        maxLength: 6,
                        validate: _validateServingSize,
                      )),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        AppStrings.nutritionPerServingMessage,
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                  const SizedBox(height: 12),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextField(
                        labelText: AppStrings.caloriesLabel,
                        controller: _caloriesController,
                        inputType: TextInputType.number,
                        validate: _validateNutritionField,
                      )),
                  const SizedBox(height: 12),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: AppTextField(
                            labelText: AppStrings.carbsLabel,
                            controller: _carbsController,
                            inputType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            validate: _validateNutritionField,
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                              child: AppTextField(
                            labelText: AppStrings.fatLabel,
                            controller: _fatController,
                            inputType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            validate: _validateNutritionField,
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                              child: AppTextField(
                            labelText: AppStrings.proteinLabel,
                            controller: _proteinController,
                            inputType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            validate: _validateNutritionField,
                          ))
                        ],
                      )),
                ],
              ))),
    );
  }

  String? _validateFoodName(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.emptyFoodNameError;
    }
    return null;
  }

  void _onDonePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: call API to save food
    }
  }

  String? _validateServingSize(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.emptyServingError;
    }
    if (double.tryParse(text) == null) {
      return AppStrings.invalidServingError;
    }
    return null;
  }

  String? _validateNutritionField(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.requiredError;
    }
    if (double.tryParse(text) == null) {
      return AppStrings.invalidError;
    }
    return null;
  }

// TODO: calculate if number of calories and macros make sense, if not, show an error message above calories
}
