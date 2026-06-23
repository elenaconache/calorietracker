import 'dart:async';

import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/service/database/diary_logging_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:calorietracker/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            onPressed: () => _copyFromPreviousDay(context),
            child: Text(AppStrings.fromPreviousDayLabel.toUpperCase()),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _selectDate(context, true),
            child: Text(AppStrings.fromAnotherDayLabel.toUpperCase()),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _copyToToday(context),
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

  void _copyFromPreviousDay(BuildContext context) {
    final selectedDay = context.read<DiaryBloc>().state.selectedDay;
    final previousDay = selectedDay.subtract(const Duration(days: 1));
    unawaited(
      getIt<DiaryLoggingService>()
          .copyDiary(
        meal: meal,
        fromDate: previousDay,
        selectedDay: selectedDay,
      )
          .then((copied) {
        if (!copied) {
          // TODO: Use Scaffold messenger set in Material App instead
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

  void _copyToToday(BuildContext context) {
    final selectedDay = context.read<DiaryBloc>().state.selectedDay;
    unawaited(
      getIt<DiaryLoggingService>()
          .copyDiary(
        meal: meal,
        toDate: DateTime.now(),
        selectedDay: selectedDay,
      )
          .then((copied) {
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
    final selectedDiaryDay = context.read<DiaryBloc>().state.selectedDay;
    showDatePicker(
      context: context,
      firstDate: now.copyWith(year: now.year - 1),
      lastDate: now,
    ).then((selectedDate) {
      if (selectedDate != null) {
        unawaited(
          getIt<DiaryLoggingService>()
              .copyDiary(
            meal: meal,
            fromDate: isFromSelection ? selectedDate : null,
            toDate: isFromSelection ? null : selectedDate,
            selectedDay: selectedDiaryDay,
          )
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
