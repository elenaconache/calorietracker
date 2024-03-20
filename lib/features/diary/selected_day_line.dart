import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:flutter/material.dart';

class SelectedDayLine extends StatelessWidget {
  const SelectedDayLine({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
    return ValueListenableBuilder(
      valueListenable: diaryService.diaryEditModeEnabled,
      builder: (context, editable, child) => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: 4),
          SizedBox(
            height: 48,
            width: 48,
            child: editable
                ? ValueListenableBuilder(
                    valueListenable: diaryService.checkedDiaryEntries,
                    builder: (context, _, __) => Checkbox(
                      tristate: true,
                      value: diaryService.isDayChecked,
                      onChanged: (checked) => diaryService.onDayCheckChanged(checked: checked),
                    ),
                  )
                : IconButton(
                    onPressed: diaryService.selectPreviousDay,
                    icon: const Icon(Icons.chevron_left),
                  ),
          ),
          Expanded(child: child!),
          SizedBox(
            height: 48,
            width: 48,
            child: editable
                ? null
                : IconButton(
                    onPressed: diaryService.selectNextDay,
                    icon: const Icon(Icons.chevron_right),
                  ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: diaryService.selectedDay,
        builder: (context, selectedDay, _) => Text(
          locator<DateFormattingService>().formatUserFriendly(dateTime: selectedDay),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
