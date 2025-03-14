import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/diary_entry.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:flutter/material.dart';

class DiaryRowCheckBox extends StatelessWidget {
  final DiaryEntry diaryEntry;

  const DiaryRowCheckBox({super.key, required this.diaryEntry});

  @override
  Widget build(BuildContext context) {
    final diaryService = getIt<DiaryService>();
    return ValueListenableBuilder(
        valueListenable: diaryService.dayMealEntries,
        builder: (context, _, __) => ValueListenableBuilder(
            valueListenable: diaryService.diaryEditModeEnabled,
            builder: (context, editable, _) => editable
                ? ValueListenableBuilder(
                    valueListenable: diaryService.checkedDiaryEntries,
                    builder: (context, _, __) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: diaryService.isEntryChecked(entry: diaryEntry),
                          onChanged: (checked) => diaryService.onDiaryEntryCheckChanged(entry: diaryEntry, checked: checked),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()));
  }
}
