import 'package:calorietracker/features/add_food/nutrient_row.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class NutritionSection extends StatelessWidget {
  final Nutrition nutrition;

  const NutritionSection({super.key, required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NutrientRow(name: AppStrings.caloriesLabel, displayValue: nutrition.formattedCalories),
        NutrientRow(name: AppStrings.fatLabel, displayValue: nutrition.formattedFat),
        NutrientRow(name: AppStrings.saturatedFatLabel, displayValue: nutrition.formattedSaturatedFat),
        NutrientRow(name: AppStrings.polyunsaturatedFatLabel, displayValue: nutrition.formattedPolyunsaturatedFat),
        NutrientRow(name: AppStrings.monounsaturatedFatLabel, displayValue: nutrition.formattedMonounsaturatedFat),
        NutrientRow(name: AppStrings.transFatLabel, displayValue: nutrition.formattedTransFat),
        NutrientRow(name: AppStrings.cholesterolLabel, displayValue: nutrition.formattedCholesterol),
        NutrientRow(name: AppStrings.sodiumLabel, displayValue: nutrition.formattedSodium),
        NutrientRow(name: AppStrings.potassiumLabel, displayValue: nutrition.formattedPotassium),
        NutrientRow(name: AppStrings.carbohydratesLabel, displayValue: nutrition.formattedCarbs),
        NutrientRow(name: AppStrings.fiberLabel, displayValue: nutrition.formattedFiber),
        NutrientRow(name: AppStrings.sugarLabel, displayValue: nutrition.formattedSugar),
        NutrientRow(name: AppStrings.vitaminALabel, displayValue: nutrition.formattedVitaminA),
        NutrientRow(name: AppStrings.vitaminCLabel, displayValue: nutrition.formattedVitaminC),
        NutrientRow(name: AppStrings.vitaminDLabel, displayValue: nutrition.formattedVitaminD),
        NutrientRow(name: AppStrings.calciumLabel, displayValue: nutrition.formattedCalcium),
        NutrientRow(name: AppStrings.ironLabel, displayValue: nutrition.formattedIron),
      ],
    );
  }
}
