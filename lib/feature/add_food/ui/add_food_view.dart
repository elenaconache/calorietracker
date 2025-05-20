import 'dart:async';

import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/add_food_arguments.dart';
import 'package:calorietracker/feature/add_food/logic/add_food_cubit.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/ui/components/calories_macros_section.dart';
import 'package:calorietracker/ui/components/nutrition_section.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/components/text_field/app_text_field.dart';
import 'package:calorietracker/ui/components/dropdown/app_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFoodView extends StatelessWidget {
  final AddFoodArguments args;

  const AddFoodView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddFoodCubit>(
      create: (_) {
        final cubit = getIt<AddFoodCubit>()
          ..selectMeal(meal: args.meal)
          ..initializeNutrients(nutrition: args.food.nutrition);
        if ((args.servingSize ?? 100) != 100) {
          cubit.recalculateNutrition(servingSizeGrams: args.servingSize.toString());
        }
        return cubit;
      },
      child: BlocBuilder<AddFoodCubit, AddFoodState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(args.meal == null ? AppStrings.addIngredientTitle : AppStrings.logFoodLabel),
                actions: [
                  state.isLoading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : IconButton(
                          // TODO: send barcode as parameter to this view if the user scanned a barcode.
                          onPressed: () => _confirmFood(context, state.servingSize ?? 100),
                          icon: const Icon(Icons.check, size: 32),
                        ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                      child: Text(
                        args.food.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (args.food.brandName != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          args.food.brandName!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    const SizedBox(height: 12),
                    const AppDivider(),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppTextField(
                        enabled: !state.isLoading,
                        initialValue: (args.servingSize ?? 100).toString(),
                        labelText: AppStrings.servingsLabel,
                        suffixIcon: Icons.clear,
                        onSuffixIconPressed: () => _onServingSizeChanged(context, ''),
                        onChanged: (value) => _onServingSizeChanged(context, value),
                        inputType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                        maxLength: 6,
                        autofocus: true,
                        action: TextInputAction.done,
                      ),
                    ),
                    if (args.meal != null) ...[
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppDropdownButton<Meal>(
                          hint: AppStrings.mealLabel,
                          onChanged: (selectedMeal) => context.read<AddFoodCubit>().selectMeal(meal: selectedMeal),
                          optionNameMapper: (meal) => meal.label,
                          options: Meal.values,
                          selectedOption: state.selectedMeal,
                          enabled: !state.isLoading,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    const AppDivider(),
                    CaloriesMacrosSection(
                      nutrition: Nutrition.perServing(
                        nutritionPer100Grams: state.nutrition,
                        servingSizeGrams: state.servingSize ?? 100,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const AppDivider(),
                    NutritionSection(
                      nutrition: Nutrition.perServing(
                        nutritionPer100Grams: state.nutrition,
                        servingSizeGrams: state.servingSize ?? 100,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ));
        },
      ),
    );
  }

  void _confirmFood(BuildContext context, double? servingQuantity) {
    if (servingQuantity == null) {
      getIt<LoggingService>().handle(
        Exception('Could not log food with null serving quantity.'),
        StackTrace.current,
      );
    } else {
      getIt<SearchFoodService>().clearResults();
      if (args.meal == null) {
        _confirmRecipeIngredient(context, servingQuantity);
      } else {
        final date = DateTime.tryParse(getIt<DiaryService>().selectedDay.value);
        if (date == null) {
          getIt<LoggingService>().info('Could not log to diary. Missing date.');
        } else {
          _confirmDiaryLog(servingQuantity, date, context);
        }
      }
    }
  }

  void _confirmDiaryLog(double servingQuantity, DateTime date, BuildContext context) {
    final foodLog = FoodLog(
      meal: args.meal!,
      food: args.food,
      servingQuantity: servingQuantity,
      localFoodId: args.localFoodId,
      date: date,
    );
    unawaited(
      context
          .read<AddFoodCubit>()
          .logFood(foodLog: foodLog, remoteDiaryEntryId: args.diaryEntryId, localDiaryEntryId: args.localDiaryEntryId, initialMeal: args.meal)
          .then((_) {
        if (context.mounted) {
          Navigator.pop(context);
        } else {
          getIt<LoggingService>().info('Could not pop add food screen. Context unmounted.');
        }
      }).catchError((_, __) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                args.diaryEntryId != null || args.localDiaryEntryId != null ? AppStrings.updateLogError : AppStrings.errorAddFood,
              ),
            ),
          );
        } else {
          getIt<LoggingService>().info('Could not show error snack bar. Context unmounted.');
        }
      }),
    );
  }

  void _confirmRecipeIngredient(BuildContext context, double servingQuantity) {
    context.read<AddFoodCubit>().createFood(food: args.food).then((createdFoodId) {
      if (createdFoodId != null) {
        if (context.mounted) {
          Navigator.of(context).pop(
            RecipeIngredient(food: args.food.copyWith(id: createdFoodId), servingQuantity: servingQuantity),
          );
        } else {
          getIt<LoggingService>().info('Could not pop screen. Context unmounted.');
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppStrings.addIngredientError)));
        } else {
          getIt<LoggingService>().info('Could not show error snack bar. Context unmounted.');
        }
      }
    });
  }

  void _onServingSizeChanged(BuildContext context, String? value) {
    context.read<AddFoodCubit>().recalculateNutrition(servingSizeGrams: value ?? '');
  }
}
