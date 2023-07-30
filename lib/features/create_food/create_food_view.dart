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

  final _formKey = GlobalKey<FormState>(debugLabel: 'createFoodForm');

  @override
  void initState() {
    _foodNameController = TextEditingController();
    _brandNameController = TextEditingController();
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
            ),
            body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Expanded(
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          const SizedBox(height: 36),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: AppTextField(
                                controller: _foodNameController,
                                action: TextInputAction.next,
                                autofocus: true,
                                maxLength: _maxTextLength,
                                labelText: AppStrings.foodNameLabel,
                                validate: _validateFoodName,
                              )),
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: AppTextField(
                                controller: _brandNameController,
                                action: TextInputAction.next,
                                maxLength: _maxTextLength,
                                labelText: AppStrings.brandNameLabel,
                              )),
                        ],
                      ))),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 40,
                  ),
                  child: FilledButton(
                      onPressed: _onLoginPressed,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )),
                      ),
                      child: Text(AppStrings.saveFoodLabel))),
            ])));
  }

  String? _validateFoodName(String? text) {
    if (text == null || text.isEmpty) {
      return AppStrings.emptyFoodNameError;
    }
    return null;
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: call API to save food
    }
  }
}
