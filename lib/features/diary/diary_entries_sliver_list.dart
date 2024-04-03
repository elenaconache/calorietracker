import 'dart:async';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/diary_row/diary_row.dart';
import 'package:calorietracker/features/diary/no_logged_foods_message.dart';
import 'package:calorietracker/features/diary/swipe_to_delete_background.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:flutter/material.dart';

class DiaryEntriesSliverList extends StatelessWidget {
  final List<DiaryEntry> entries;
  final bool error;
  final bool loading;
  final Meal meal;

  const DiaryEntriesSliverList({
    super.key,
    required this.entries,
    required this.error,
    required this.meal,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (error) {
      return const SliverPadding(padding: EdgeInsets.zero);
    } else if (loading) {
      return const SliverToBoxAdapter(
        child: CircularProgressIndicator(),
      );
    } else if (entries.isNotEmpty) {
      return SliverList(
        key: UniqueKey(),
        delegate: SliverChildBuilderDelegate(
          (context, index) => Dismissible(
              key: ValueKey(entries[index]),
              onDismissed: (direction) => _onEntryDismissed(entries[index]),
              background: const SwipeToDeleteBackground(direction: TextDirection.ltr),
              secondaryBackground: const SwipeToDeleteBackground(direction: TextDirection.rtl),
              child: InkWell(
                onLongPress: locator<DiaryService>().enterEditMode,
                child: DiaryRow(diaryEntry: entries[index]),
              )),
          childCount: entries.length,
        ),
      );
    } else {
      return const SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        sliver: SliverToBoxAdapter(child: NoLoggedFoodsMessage()),
      );
    }
  }

  void _onEntryDismissed(DiaryEntry entry) =>
      unawaited(locator<DiaryService>().removeSingleDiaryEntry(meal: meal, diaryEntry: entry));
}
