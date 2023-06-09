import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
          padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
          child: Icon(
            Icons.ramen_dining,
            size: 100,
          )),
      const SizedBox(height: 24),
      Text(
        AppStrings.noResultsTitle,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      )
    ]);
  }
}
