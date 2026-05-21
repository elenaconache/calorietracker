import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryRowCheckBox extends StatelessWidget {
  final DiaryEntry diaryEntry;
  final DiaryState diary;

  const DiaryRowCheckBox({
    super.key,
    required this.diary,
    required this.diaryEntry,
  });

  @override
  Widget build(BuildContext context) {
    final editable = diary.editMode;
    final isChecked = diary.isEntryChecked(entry: diaryEntry);
    return editable
        ? Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: isChecked,
                onChanged: (checked) => context.read<DiaryBloc>().add(
                      EntryCheckChanged(checked: checked ?? false, entry: diaryEntry),
                    ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
