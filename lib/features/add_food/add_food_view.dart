import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class AddFoodView extends StatelessWidget {
  final Meal meal;

  const AddFoodView({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addFoodLabel),
      ),
    );
  }
}
