import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class UserGoalsView extends StatelessWidget {
  const UserGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.myGoalsLabel)),
    );
  }
}
