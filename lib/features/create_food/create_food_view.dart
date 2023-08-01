import 'package:calorietracker/features/create_food/create_food_form.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

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
  late final TextEditingController _sugarController;
  late final TextEditingController _fiberController;
  late final TextEditingController _fatSaturatedController;
  late final TextEditingController _fatTransController;
  late final TextEditingController _fatPolyunsaturatedController;
  late final TextEditingController _fatMonounsaturatedController;
  late final TextEditingController _cholesterolController;
  late final TextEditingController _saltController;
  late final TextEditingController _potassiumController;
  late final TextEditingController _calciumController;
  late final TextEditingController _ironController;
  late final TextEditingController _vitaminAController;
  late final TextEditingController _vitaminCController;
  late final TextEditingController _vitaminDController;

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
    _fiberController = TextEditingController();
    _sugarController = TextEditingController();
    _fatSaturatedController = TextEditingController();
    _fatTransController = TextEditingController();
    _fatMonounsaturatedController = TextEditingController();
    _fatPolyunsaturatedController = TextEditingController();
    _cholesterolController = TextEditingController();
    _saltController = TextEditingController();
    _potassiumController = TextEditingController();
    _calciumController = TextEditingController();
    _ironController = TextEditingController();
    _vitaminAController = TextEditingController();
    _vitaminCController = TextEditingController();
    _vitaminDController = TextEditingController();

    _servingSizeController.text = 100.toString();

    super.initState();
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _brandNameController.dispose();
    _servingSizeController.dispose();
    _caloriesController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    _proteinController.dispose();
    _fiberController.dispose();
    _sugarController.dispose();
    _fatSaturatedController.dispose();
    _fatTransController.dispose();
    _fatPolyunsaturatedController.dispose();
    _fatMonounsaturatedController.dispose();
    _cholesterolController.dispose();
    _saltController.dispose();
    _potassiumController.dispose();
    _calciumController.dispose();
    _ironController.dispose();
    _vitaminAController.dispose();
    _vitaminCController.dispose();
    _vitaminDController.dispose();
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
              child: FoodForm(
                brandNameController: _brandNameController,
                caloriesController: _caloriesController,
                carbsController: _carbsController,
                fatController: _fatController,
                foodNameController: _foodNameController,
                proteinController: _proteinController,
                servingSizeController: _servingSizeController,
                sugarController: _sugarController,
                fiberController: _fiberController,
                fatSaturatedController: _fatSaturatedController,
                fatTransController: _fatTransController,
                fatMonounsaturatedController: _fatMonounsaturatedController,
                fatPolyunsaturatedController: _fatPolyunsaturatedController,
                cholesterolController: _cholesterolController,
                ironController: _ironController,
                potassiumController: _potassiumController,
                saltController: _saltController,
                calciumController: _calciumController,
                vitaminAController: _vitaminAController,
                vitaminCController: _vitaminCController,
                vitaminDController: _vitaminDController,
              )),
        ));
  }

  void _onDonePressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: call API to save food
    }
  }

// TODO: calculate if number of calories and macros make sense, if not, show an error message above calories
}
