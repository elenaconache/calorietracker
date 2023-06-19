import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_food_response.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/service/numeric_formatting_service.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final NutritionixFoodResponse foodResponse;
  final Meal meal;

  //TODO: create a shared model for UI and convert from either Nutritionix or private API

  const FoodItem({super.key, required this.foodResponse, required this.meal});

  @override
  Widget build(BuildContext context) {
    final numericFormatter = locator<NumericFormattingService>();
    return Material(
        child: InkWell(
            onTap: () => _navigateToAddFood(context),
            child: Ink(
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border(top: BorderSide(color: Theme.of(context).dividerColor, width: 0.2))),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(children: [
                      const AppDivider(),
                      Row(children: [
                        Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            foodResponse.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          if (foodResponse.brandName != null)
                            Text(
                              foodResponse.brandName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          const SizedBox(height: 2),
                          Text(
                            AppStrings.caloriesServingShortLabel(foodResponse.nutrition.calories?.toStringAsFixed(0) ?? '0',
                                numericFormatter.formatDecimals(value: foodResponse.servingQuantity ?? 1), foodResponse.servingUnit ?? ''),
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ])),
                        const SizedBox(width: 24),
                        FloatingActionButton(
                          mini: true,
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        )
                      ])
                    ])))));
  }

  void _navigateToAddFood(BuildContext context) => Navigator.pushNamed(context, Routes.addFood.path, arguments: meal);
}
