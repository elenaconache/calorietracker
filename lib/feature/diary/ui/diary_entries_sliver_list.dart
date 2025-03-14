import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/add_food_arguments.dart';
import 'package:calorietracker/feature/diary/ui/diary_row/diary_row.dart';
import 'package:calorietracker/feature/diary/ui/no_logged_foods_message.dart';
import 'package:calorietracker/feature/diary/ui/swipe_to_delete_background.dart';
import 'package:calorietracker/shared/model/diary_entry.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
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
          (context, index) {
            final entry = entries[index];
            return Dismissible(
              key: ValueKey(entry),
              onDismissed: (direction) => _onEntryDismissed(entry),
              background: const SwipeToDeleteBackground(direction: TextDirection.ltr),
              secondaryBackground: const SwipeToDeleteBackground(direction: TextDirection.rtl),
              child: InkWell(
                onLongPress: getIt<DiaryService>().enterEditMode,
                onTap: () => _onEntryTap(context, entry),
                child: DiaryRow(diaryEntry: entry),
              ),
            );
          },
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

  void _onEntryDismissed(DiaryEntry entry) => unawaited(
        getIt<DiaryService>().removeSingleDiaryEntry(meal: meal, collectionId: entry.collectionId, localId: entry.localId),
      );

  void _onEntryTap(BuildContext context, DiaryEntry entry) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.addFood.path,
          arguments: AddFoodArguments(
            meal: meal,
            // TODO: copy local food id in the food object instead of passing it separately
            food: entry.food,
            localFoodId: entry.food.localId,
            servingSize: entry.servingQuantity,
            diaryEntryId: entry.collectionId,
            localDiaryEntryId: entry.localId,
          ));
      // TODO: update locally with some flag,
      // TODO: if there's a remote food id, call API to update diary entry
    }
  }
}
