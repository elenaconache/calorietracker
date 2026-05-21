import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/diary/ui/diary_app_bar.dart';
import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/feature/diary/ui/diary_entries_sliver_list.dart';
import 'package:calorietracker/feature/diary/ui/carousel/diary_overview_carousel.dart';
import 'package:calorietracker/feature/diary/ui/meal_title.dart';
import 'package:calorietracker/feature/diary/ui/selected_day_line.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/data/service/data_sync_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryBloc, DiaryState>(builder: (context, state) {
      final bloc = context.read<DiaryBloc>();
      final dayMealEntries = state.selectedDayMealEntries;
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: DiaryAppBar(
          editable: state.editMode,
          onExitEditMode: () => _onExitEditMode(context),
        ),
        body: RefreshIndicator(
            onRefresh: () => getIt<DataSyncService>().uploadLocalData(selectedDay: state.selectedDay),
            child: CustomScrollView(
              slivers: [
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(
                  child: SelectedDayLine(
                    onDateSelected: (date) => _onDateSelected(context, date),
                    diary: state,
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(child: DiaryOverviewCarousel(diary: state)),
                const SliverPadding(padding: EdgeInsets.only(top: 24)),
                SliverToBoxAdapter(
                  child: MealTitle(
                    meal: Meal.breakfast,
                    enabledMacrosPercentageMode: state.macrosPercentageEnabled,
                    onTap: () => bloc.add(ToggleMacroPercentageEvent()),
                    diary: state,
                  ),
                ),
                dayMealEntries.status is LoadingStatus
                    ? const SliverPadding(
                        padding: EdgeInsets.only(top: 12),
                        sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : DiaryEntriesSliverList(
                        entries: state.getMealEntries(meal: Meal.breakfast),
                        error: dayMealEntries.status is FailureStatus,
                        meal: Meal.breakfast,
                        diary: state,
                      ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _openSearchFoodScreen(context, Meal.breakfast),
                        child: Text(AppStrings.logFoodLabel.toUpperCase()),
                      ),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(
                  child: MealTitle(
                    meal: Meal.lunch,
                    enabledMacrosPercentageMode: state.macrosPercentageEnabled,
                    onTap: () => bloc.add(ToggleMacroPercentageEvent()),
                    diary: state,
                  ),
                ),
                dayMealEntries is FutureLoading
                    ? const SliverPadding(
                        padding: EdgeInsets.only(top: 12),
                        sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : DiaryEntriesSliverList(
                        entries: state.getMealEntries(meal: Meal.lunch),
                        error: dayMealEntries is FutureError,
                        meal: Meal.lunch,
                        diary: state,
                      ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _openSearchFoodScreen(context, Meal.lunch),
                        child: Text(AppStrings.logFoodLabel.toUpperCase()),
                      ),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(
                  child: MealTitle(
                    meal: Meal.dinner,
                    enabledMacrosPercentageMode: state.macrosPercentageEnabled,
                    onTap: () => bloc.add(ToggleMacroPercentageEvent()),
                    diary: state,
                  ),
                ),
                dayMealEntries.status is LoadingStatus
                    ? const SliverPadding(
                        padding: EdgeInsets.only(top: 12),
                        sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : DiaryEntriesSliverList(
                        entries: state.getMealEntries(meal: Meal.dinner),
                        error: dayMealEntries is FutureError,
                        meal: Meal.dinner,
                        diary: state,
                      ),
                SliverToBoxAdapter(
                  child: Center(
                    child: TextButton(
                      onPressed: () => _openSearchFoodScreen(context, Meal.dinner),
                      child: Text(AppStrings.logFoodLabel.toUpperCase()),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(
                  child: MealTitle(
                    meal: Meal.snacks,
                    enabledMacrosPercentageMode: state.macrosPercentageEnabled,
                    onTap: () => bloc.add(ToggleMacroPercentageEvent()),
                    diary: state,
                  ),
                ),
                dayMealEntries.status is LoadingStatus
                    ? const SliverPadding(
                        padding: EdgeInsets.only(top: 12),
                        sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : DiaryEntriesSliverList(
                        entries: state.getMealEntries(meal: Meal.snacks),
                        error: dayMealEntries is FutureError,
                        meal: Meal.snacks,
                        diary: state,
                      ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: TextButton(
                        onPressed: () => _openSearchFoodScreen(context, Meal.snacks),
                        child: Text(AppStrings.logFoodLabel.toUpperCase()),
                      ),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 100)),
              ],
            )),
      );
    });
  }

  void _openSearchFoodScreen(BuildContext context, Meal meal) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.foodSearch.path, arguments: meal);
    } else {
      getIt<LoggingService>().info('context unmounted, could not navigate to food search');
    }
  }

  void _onDateSelected(BuildContext context, DateTime date) {
    if (context.mounted) {
      final bloc = context.read<DiaryBloc>();
      bloc.add(SelectDayEvent(date: date));
    } else {
      getIt<LoggingService>().info('context unmounted, could not select day');
    }
  }

  void _onExitEditMode(BuildContext context) {
    if (context.mounted) {
      final bloc = context.read<DiaryBloc>();
      bloc.add(ExitEditModeEvent());
    } else {
      getIt<LoggingService>().info('context unmounted, could not exit edit mode');
    }
  }
}
