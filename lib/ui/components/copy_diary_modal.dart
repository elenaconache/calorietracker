import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:calorietracker/main.dart';

class CopyDiaryModal extends StatelessWidget {
  final Meal? meal;

  const CopyDiaryModal({super.key, this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24, width: double.infinity),
          Text(
            AppStrings.copyDiaryTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: _copyFromPreviousDay,
            child: Text(AppStrings.fromPreviousDayLabel.toUpperCase()),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _selectDate(context, true),
            child: Text(AppStrings.fromAnotherDayLabel.toUpperCase()),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _copyToToday,
            child: Text(AppStrings.toTodayLabel.toUpperCase()),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _selectDate(context, false),
            child: Text(AppStrings.toAnotherDayLabel.toUpperCase()),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _copyFromPreviousDay() {
    final previousDay = locator<DiaryService>().selectedDayDateTime?.subtract(const Duration(days: 1));
    unawaited(
      locator<DiaryLoggingService>().copyDiary(meal: meal, fromDate: previousDay).then((copied) {
        if (!copied) {
          ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
            SnackBar(
              content: Text(AppStrings.copyDiaryError),
            ),
          );
        }
      }),
    );
    Navigator.of(rootNavigatorKey.currentContext!).pop();
  }

  void _copyToToday() {
    unawaited(
      locator<DiaryLoggingService>().copyDiary(meal: meal, toDate: DateTime.now()).then((copied) {
        if (!copied) {
          ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
            SnackBar(
              content: Text(AppStrings.copyDiaryError),
            ),
          );
        }
      }),
    );
    Navigator.of(rootNavigatorKey.currentContext!).pop();
  }

  void _selectDate(BuildContext context, bool isFromSelection) {
    Navigator.of(rootNavigatorKey.currentContext!).pop();
    final now = DateTime.now();
    showDatePicker(
      context: context,
      firstDate: now.copyWith(year: now.year - 1),
      lastDate: now,
    ).then((selectedDate) {
      if (selectedDate != null) {
        unawaited(
          locator<DiaryLoggingService>()
              .copyDiary(meal: meal, fromDate: isFromSelection ? selectedDate : null, toDate: isFromSelection ? null : selectedDate)
              .then((copied) {
            if (!copied) {
              ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
                SnackBar(content: Text(AppStrings.copyDiaryError)),
              );
            }
          }),
        );
      }
    });
  }
}
