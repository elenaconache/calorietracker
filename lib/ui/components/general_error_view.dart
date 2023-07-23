import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class GeneralErrorView extends StatelessWidget {
  const GeneralErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
          padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
          child: Icon(
            Icons.emoji_food_beverage,
            size: 100,
          )),
      const SizedBox(height: 24),
      Text(
        AppStrings.generalErrorMessage,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      )
    ]);
  }
}
