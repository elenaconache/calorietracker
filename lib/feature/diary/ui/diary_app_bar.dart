import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/diary/ui/user_avatar_action.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = getIt<DiaryService>();
    return ValueListenableBuilder(
      valueListenable: diaryService.diaryEditModeEnabled,
      builder: (context, editable, _) => AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            editable ? AppStrings.deleteEntriesTitle : AppStrings.diaryTitle,
            key: ValueKey(editable ? AppStrings.deleteEntriesTitle : AppStrings.diaryTitle),
          ),
        ),
        scrolledUnderElevation: 8,
        leading: editable ? IconButton(icon: const Icon(Icons.close), onPressed: diaryService.exitEditMode) : null,
        actions: editable
            ? [
                IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: _onDonePressed,
                )
              ]
            : const [UserAvatarAction()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _onDonePressed() => unawaited(getIt<DiaryService>().removeCheckedDiaryEntries());
}
