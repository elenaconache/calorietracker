import 'package:calorietracker/features/add_food/add_food_arguments.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class AddFoodView extends StatelessWidget {
  final AddFoodArguments args;

  const AddFoodView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.addFoodLabel),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check,
                  size: 32,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Text(
                '${args.food.name}${args.food.brandName != null ? ' (${args.food.brandName})' : ''}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ))
        ])));
  }
}
