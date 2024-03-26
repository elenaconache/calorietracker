import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/database/diary_logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:calorietracker/app/main.dart';

class CopyFromModalContent extends StatelessWidget {
  final Meal? meal;

  const CopyFromModalContent({super.key, this.meal});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppStrings.copyFromTitle,
                style: Theme.of(context).textTheme.titleLarge,
              )),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    unawaited(
                      locator<DiaryLoggingService>().copyFromYesterday(meal: meal).then((copied) {
                        if (!copied) {
                          ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
                            SnackBar(
                              content: Text(AppStrings.copyYesterdayError),
                            ),
                          );
                        }
                      }),
                    );
                    Navigator.of(rootNavigatorKey.currentContext!).pop();
                  },
                  child: Text(AppStrings.previousDayLabel.toUpperCase()),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.anotherDayLabel.toUpperCase()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
