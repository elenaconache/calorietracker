import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/main.dart';
import 'package:calorietracker/shared/data/service/date_formatting_service.dart';
import 'package:calorietracker/ui/widgets/copy_diary_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedDayLine extends StatelessWidget {
  final Function(DateTime date) onDateSelected;
  final DiaryState diary;

  const SelectedDayLine({super.key, required this.onDateSelected, required this.diary});

  @override
  Widget build(BuildContext context) {
    final editable = diary.editMode;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 4),
        SizedBox(
          height: 48,
          width: 48,
          child: editable
              ? Checkbox(
                  tristate: true,
                  value: diary.isDayChecked,
                  onChanged: (checked) => context.read<DiaryBloc>().add(DayCheckChanged(checked: checked)),
                )
              : IconButton(
                  onPressed: _selectPreviousDay,
                  icon: const Icon(Icons.chevron_left),
                ),
        ),
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => showModalBottomSheet(
              context: rootNavigatorKey.currentContext!,
              builder: (_) => const CopyDiaryModal(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                getIt<DateFormattingService>().formatUserFriendly(dateTime: diary.selectedDay.toString()),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 48,
          width: 48,
          child: editable
              ? null
              : IconButton(
                  onPressed: _selectNextDay,
                  icon: const Icon(Icons.chevron_right),
                ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  void _selectPreviousDay() {
    final selection = diary.selectedDay.subtract(const Duration(days: 1));
    onDateSelected(selection);
  }

  void _selectNextDay() {
    final selection = diary.selectedDay.add(const Duration(days: 1));
    onDateSelected(selection);
  }
}
