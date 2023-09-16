import 'package:calorietracker/features/diary/diary_row.dart';
import 'package:calorietracker/features/diary/no_logged_foods_message.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:flutter/material.dart';

class DiaryEntriesSliverList extends StatelessWidget {
  final List<DiaryEntry> entries;
  final bool error;

  const DiaryEntriesSliverList({super.key, required this.entries, required this.error});

  @override
  Widget build(BuildContext context) {
    if (error) {
      return const SliverToBoxAdapter();
    }
    if (entries.isNotEmpty) {
      return SliverList(
        key: UniqueKey(),
        delegate: SliverChildBuilderDelegate(
          (context, index) => DiaryRow(diaryEntry: entries[index]),
          childCount: entries.length,
        ),
      );
    } else {
      return const SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        sliver: SliverToBoxAdapter(child: NoLoggedFoodsMessage()),
      );
    }
  }
}
