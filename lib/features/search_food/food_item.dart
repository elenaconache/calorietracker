import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/numeric_formatting_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final Food foodResponse;
  final Meal meal;
  final double servingQuantity;
  final String unitName;

  const FoodItem({
    super.key,
    required this.foodResponse,
    required this.meal,
    required this.servingQuantity,
    required this.unitName,
  });

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
                            AppStrings.caloriesServingShortLabel(
                              foodResponse.nutrition.calories.toStringAsFixed(0),
                              numericFormatter.formatDecimals(
                                value: servingQuantity,
                              ),
                              unitName,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ])),
                        const SizedBox(width: 24),
                        SizedBox(
                            width: 48,
                            height: 48,
                            child: Ink(
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                )))
                      ])
                    ])))));
  }

  void _navigateToAddFood(BuildContext context) => Navigator.pushNamed(
        context,
        Routes.addFood.path,
        arguments: AddFoodArguments(meal: meal, food: foodResponse),
      );
}
