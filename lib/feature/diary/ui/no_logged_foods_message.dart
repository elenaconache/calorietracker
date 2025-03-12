import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class NoLoggedFoodsMessage extends StatelessWidget {
  const NoLoggedFoodsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.noFoodLoggedMessage,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
