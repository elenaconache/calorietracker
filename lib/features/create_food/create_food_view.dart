import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class CreateFoodView extends StatefulWidget {
  const CreateFoodView({super.key});

  @override
  State<CreateFoodView> createState() => _CreateFoodViewState();
}

class _CreateFoodViewState extends State<CreateFoodView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.createFoodLabel),
      ),
    );
  }
}
