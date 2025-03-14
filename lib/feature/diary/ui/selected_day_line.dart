import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/main.dart';
import 'package:calorietracker/shared/service/date_formatting_service.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/ui/components/copy_diary_modal.dart';
import 'package:flutter/material.dart';

class SelectedDayLine extends StatelessWidget {
  const SelectedDayLine({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = getIt<DiaryService>();
    return ValueListenableBuilder(
      valueListenable: diaryService.diaryEditModeEnabled,
      builder: (_, editable, child) => Row(
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
        builder: (context, selectedDay, _) => InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => showModalBottomSheet(
            context: rootNavigatorKey.currentContext!,
            builder: (_) => const CopyDiaryModal(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              getIt<DateFormattingService>().formatUserFriendly(dateTime: selectedDay),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
