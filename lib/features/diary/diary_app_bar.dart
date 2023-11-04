import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/user_avatar_action.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
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
            ? [IconButton(icon: const Icon(Icons.done), onPressed: diaryService.exitEditMode)]
            : const [UserAvatarAction()],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
