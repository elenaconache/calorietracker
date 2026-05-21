import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/feature/diary/ui/user_avatar_action.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool editable;
  final VoidCallback onExitEditMode;

  const DiaryAppBar({super.key, required this.editable, required this.onExitEditMode});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Text(
          editable ? AppStrings.deleteEntriesTitle : AppStrings.diaryTitle,
          key: ValueKey(editable ? AppStrings.deleteEntriesTitle : AppStrings.diaryTitle),
        ),
      ),
      scrolledUnderElevation: 8,
      leading: editable
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: onExitEditMode,
            )
          : null,
      actions: editable
          ? [
              IconButton(
                icon: const Icon(Icons.done),
                onPressed: () => _onDonePressed(context),
              )
            ]
          : const [UserAvatarAction()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _onDonePressed(BuildContext context) => context.read<DiaryBloc>().add(RemoveCheckedEntriesEvent());
}
