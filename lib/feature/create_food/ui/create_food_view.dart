import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/add_food_arguments.dart';
import 'package:calorietracker/feature/create_food/logic/create_food_controller.dart';
import 'package:calorietracker/feature/create_food/data/food_error.dart';
import 'package:calorietracker/feature/create_food/ui/food_form.dart';
import 'package:calorietracker/feature/create_food/ui/food_input.dart';
import 'package:calorietracker/shared/model/food.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/error_box.dart';
import 'package:flutter/material.dart';

class CreateFoodView extends StatefulWidget {
  final Meal? meal;

  const CreateFoodView({super.key, required this.meal});

  @override
  State<CreateFoodView> createState() => _CreateFoodViewState();
}

class _CreateFoodViewState extends State<CreateFoodView> with TickerProviderStateMixin {
  late final TextEditingController _foodNameController;
  late final TextEditingController _brandNameController;
  late final TextEditingController _servingSizeController;
  late final TextEditingController _caloriesController;
  late final TextEditingController _carbsController;
  late final TextEditingController _fatController;
  late final TextEditingController _proteinController;
  late final TextEditingController _sugarController;
  late final TextEditingController _fiberController;
  late final TextEditingController _insolubleFiberController;
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

  late final CreateFoodController _controller;
  late final AnimationController _errorAnimationController;

  final _formKey = GlobalKey<FormState>(debugLabel: 'createFoodForm');

  @override
  void initState() {
    super.initState();
    _controller = getIt<CreateFoodController>();
    _initTextControllers();
    _addTextListeners();

    _servingSizeController.text = 100.toString();

    _errorAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
  }

  @override
  void dispose() {
    _removeTextListeners();
    _disposeTextControllers();
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
              ValueListenableBuilder(
                  valueListenable: _controller.isLoading,
                  builder: (_, isLoading, __) => isLoading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16), child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator()))
                      : IconButton(
                          onPressed: () => _onDonePressed(context),
                          icon: const Icon(
                            Icons.check,
                            size: 32,
                          )))
            ],
          ),
          body: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: _controller.foodError,
                  builder: (_, foodError, __) {
                    if (foodError == null && _errorAnimationController.status == AnimationStatus.dismissed) {
                      return const SizedBox.shrink();
                    } else {
                      _animateErrorBox(foodError);
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                        child: ErrorBox(
                            message: _getErrorMessage(foodError),
                            animationController: _errorAnimationController,
                            onErrorDismissed: () => _errorAnimationController.reverse().then((value) => _controller.hideError())),
                      );
                    }
                  }),
              Expanded(
                  child: Form(
                      key: _formKey,
                      child: ValueListenableBuilder(
                          valueListenable: _controller.isLoading,
                          builder: (_, isLoading, __) => FoodForm(
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
                                insolubleFiberController: _insolubleFiberController,
                                enabled: !isLoading,
                              ))))
            ],
          ),
        ));
  }

  String _getErrorMessage(FoodError? foodError) => foodError == null
      ? ''
      : _getGroupErrorMessage(
          foodError: foodError,
        );

  void _animateErrorBox(FoodError? foodError) {
    if (foodError == null) {
      _errorAnimationController.reverse();
    } else {
      _errorAnimationController.forward();
    }
  }

  void _onDonePressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final isNutritionValid = _controller.validateNutrition(foodInput: _foodInput);
      if (isNutritionValid) {
        unawaited(_controller.createFood(foodInput: _foodInput).then((response) {
          if (response.localId == null && response.createdFoodId == null) {
            getIt<LoggingService>().info('Could not save food locally neither on the API.');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(AppStrings.errorCreateFood)),
              );
            }
          } else {
            if (context.mounted) {
              final food = Food.input(foodInput: _foodInput, id: response.createdFoodId);
              Navigator.of(context)
                  .pushNamed(Routes.addFood.path,
                      arguments: AddFoodArguments(
                        meal: widget.meal,
                        food: food,
                        localFoodId: response.localId,
                      ))
                  .then((value) {
                if (context.mounted) {
                  Navigator.of(context).pop(value);
                }
              });
            } else {
              getIt<LoggingService>().info('Could not navigate to add food screen. Context unmounted.');
            }
          }
        }));
      }
    }
  }

  String _getGroupErrorMessage({required FoodError foodError}) {
    return switch (foodError) {
      MacrosNotMatchingCaloriesError _ => AppStrings.macrosOrCaloriesError(foodError.expectedCalories),
      MacrosNotMatchingServingSizeError _ => AppStrings.macrosExceedServingSizeError(foodError.expectedServingSize),
      SugarsExceedNetCarbsError _ => AppStrings.sugarsExceedNetCarbsLabel,
      FatsSumExceedsTotalFatError _ => AppStrings.sumFatsExceedsTotalFatError(foodError.expectedFat),
      CholesterolExceedsTotalFatError _ => AppStrings.cholesterolExceedsFatError,
      CholesterolExceedsMaxPerServingError _ => AppStrings.cholesterolExceedsMaxPerServingError(foodError.expectedCholesterolMg),
      InsolubleFiberExceedsFiberError _ => AppStrings.insolubleFiberExceedsFiberError,
      SaltExceedsServingSizeError _ => AppStrings.saltExceedsServingSizeError,
      IronExceedsMaxIronPerServingError _ => AppStrings.ironExceedsMaxPerServingError(foodError.expectedIronMg),
      PotassiumExceedsMaxPotassiumPerServingError _ => AppStrings.potassiumExceedsMaxPerServingError(foodError.expectedPotassiumMg),
      CalciumExceedsMaxCalciumPerServingError _ => AppStrings.calciumExceedsMaxPerServingError(foodError.expectedCalciumMg),
      VitaminAExceedsMaxPerServingError _ => AppStrings.vitaminAExceedsMaxPerServingError(foodError.expectedVitaminAIU),
      VitaminCExceedsMaxPerServingError _ => AppStrings.vitaminCExceedsMaxPerServingError(foodError.expectedVitaminCMg),
      VitaminDExceedsMaxPerServingError _ => AppStrings.vitaminDExceedsMaxPerServingError(foodError.expectedVitaminDIU),
    };
  }

  void _initTextControllers() {
    _foodNameController = TextEditingController();
    _brandNameController = TextEditingController();
    _servingSizeController = TextEditingController();
    _caloriesController = TextEditingController();
    _carbsController = TextEditingController();
    _fatController = TextEditingController();
    _proteinController = TextEditingController();
    _fiberController = TextEditingController();
    _insolubleFiberController = TextEditingController();
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
  }

  void _addTextListeners() {
    _foodNameController.addListener(_controller.hideError);
    _brandNameController.addListener(_controller.hideError);
    _servingSizeController.addListener(_controller.hideError);
    _caloriesController.addListener(_controller.hideError);
    _carbsController.addListener(_controller.hideError);
    _fatController.addListener(_controller.hideError);
    _proteinController.addListener(_controller.hideError);
    _fiberController.addListener(_controller.hideError);
    _insolubleFiberController.addListener(_controller.hideError);
    _sugarController.addListener(_controller.hideError);
    _fatSaturatedController.addListener(_controller.hideError);
    _fatTransController.addListener(_controller.hideError);
    _fatMonounsaturatedController.addListener(_controller.hideError);
    _fatPolyunsaturatedController.addListener(_controller.hideError);
    _cholesterolController.addListener(_controller.hideError);
    _saltController.addListener(_controller.hideError);
    _potassiumController.addListener(_controller.hideError);
    _calciumController.addListener(_controller.hideError);
    _ironController.addListener(_controller.hideError);
    _vitaminAController.addListener(_controller.hideError);
    _vitaminCController.addListener(_controller.hideError);
    _vitaminDController.addListener(_controller.hideError);
  }

  void _removeTextListeners() {
    _foodNameController.removeListener(_controller.hideError);
    _brandNameController.removeListener(_controller.hideError);
    _servingSizeController.removeListener(_controller.hideError);
    _caloriesController.removeListener(_controller.hideError);
    _carbsController.removeListener(_controller.hideError);
    _fatController.removeListener(_controller.hideError);
    _proteinController.removeListener(_controller.hideError);
    _fiberController.removeListener(_controller.hideError);
    _insolubleFiberController.removeListener(_controller.hideError);
    _sugarController.removeListener(_controller.hideError);
    _fatSaturatedController.removeListener(_controller.hideError);
    _fatTransController.removeListener(_controller.hideError);
    _fatMonounsaturatedController.removeListener(_controller.hideError);
    _fatPolyunsaturatedController.removeListener(_controller.hideError);
    _cholesterolController.removeListener(_controller.hideError);
    _saltController.removeListener(_controller.hideError);
    _potassiumController.removeListener(_controller.hideError);
    _calciumController.removeListener(_controller.hideError);
    _ironController.removeListener(_controller.hideError);
    _vitaminAController.removeListener(_controller.hideError);
    _vitaminCController.removeListener(_controller.hideError);
    _vitaminDController.removeListener(_controller.hideError);
  }

  void _disposeTextControllers() {
    _foodNameController.dispose();
    _brandNameController.dispose();
    _servingSizeController.dispose();
    _caloriesController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    _proteinController.dispose();
    _fiberController.dispose();
    _insolubleFiberController.dispose();
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
  }

  FoodInput get _foodInput => FoodInput(
        name: _foodNameController.text,
        brand: _brandNameController.text,
        servingSize: _servingSizeController.text,
        calories: _caloriesController.text,
        carbs: _carbsController.text,
        protein: _proteinController.text,
        fat: _fatController.text,
        sugar: _sugarController.text,
        fiber: _fiberController.text,
        insolubleFiber: _insolubleFiberController.text,
        saturatedFat: _fatSaturatedController.text,
        transFat: _fatTransController.text,
        monoFat: _fatMonounsaturatedController.text,
        polyFat: _fatPolyunsaturatedController.text,
        cholesterol: _cholesterolController.text,
        salt: _saltController.text,
        iron: _ironController.text,
        potassium: _potassiumController.text,
        calcium: _calciumController.text,
        vitaminA: _vitaminAController.text,
        vitaminC: _vitaminCController.text,
        vitaminD: _vitaminDController.text,
      );
}
