import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/add_food_arguments.dart';
import 'package:calorietracker/feature/diary/ui/diary_row/diary_row.dart';
import 'package:calorietracker/feature/diary/ui/no_logged_foods_message.dart';
import 'package:calorietracker/feature/diary/ui/swipe_to_delete_background.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryEntriesSliverList extends StatelessWidget {
  final List<DiaryEntry> entries;
  final bool error;
  final bool loading;
  final Meal meal;
  final DiaryState diary;

  const DiaryEntriesSliverList({
    super.key,
    required this.entries,
    required this.error,
    required this.meal,
    this.loading = false,
    required this.diary,
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
              onDismissed: (direction) => _onEntryDismissed(entry, context),
              background: const SwipeToDeleteBackground(direction: TextDirection.ltr),
              secondaryBackground: const SwipeToDeleteBackground(direction: TextDirection.rtl),
              child: InkWell(
                onLongPress: () => context.read<DiaryBloc>().add(EnterEditModeEvent()),
                onTap: () => _onEntryTap(context, entry),
                child: DiaryRow(
                  diaryEntry: entry,
                  diary: diary,
                ),
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

  void _onEntryDismissed(DiaryEntry entry, BuildContext context) {
    if (entry.localId == null) {
      getIt<LoggingService>().info('Could not delete diary entry, local id is null.');
    } else {
      context.read<DiaryBloc>().add(RemoveEntryEvent(localId: entry.localId!));
    }
  }

  void _onEntryTap(BuildContext context, DiaryEntry entry) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.addFood.path,
          arguments: AddFoodArguments(
            meal: meal,
            food: entry.food,
            localFoodId: entry.food.localId,
            servingSize: entry.servingQuantity,
            diaryEntryId: entry.collectionId,
            localDiaryEntryId: entry.localId,
          ));
    }
  }
}
