import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/diary/ui/diary_app_bar.dart';
import 'package:calorietracker/feature/diary/logic/diary_controller.dart';
import 'package:calorietracker/feature/diary/ui/diary_entries_sliver_list.dart';
import 'package:calorietracker/feature/diary/ui/carousel/diary_overview_carousel.dart';
import 'package:calorietracker/feature/diary/ui/meal_title.dart';
import 'package:calorietracker/feature/diary/ui/selected_day_line.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/shared/service/data_sync_service.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  late final DiaryService _diaryService;
  late final DiaryController _controller;

  @override
  void initState() {
    _diaryService = locator<DiaryService>();
    _controller = locator<DiaryController>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.enabledMacrosPercentageMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const DiaryAppBar(),
        body: RefreshIndicator(
          onRefresh: locator<DataSyncService>().uploadLocalData,
          child: CustomScrollView(
            slivers: [
              const SliverPadding(padding: EdgeInsets.only(top: 12)),
              const SliverToBoxAdapter(child: SelectedDayLine()),
              const SliverPadding(padding: EdgeInsets.only(top: 12)),
              const SliverToBoxAdapter(child: DiaryOverviewCarousel()),
              const SliverPadding(padding: EdgeInsets.only(top: 24)),
              SliverToBoxAdapter(
                  child: ValueListenableBuilder(
                      valueListenable: _controller.enabledMacrosPercentageMode,
                      builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                            meal: Meal.breakfast,
                            enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                            onTap: _controller.toggleMacrosMode,
                          ))),
              ValueListenableBuilder(
                  valueListenable: _diaryService.dayMealEntries,
                  builder: (context, dayMealEntries, __) => dayMealEntries is FutureLoading
                      ? const SliverPadding(
                          padding: EdgeInsets.only(top: 12),
                          sliver: SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        )
                      : DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.breakfast),
                          error: dayMealEntries is FutureError,
                          meal: Meal.breakfast,
                        )),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                    child: Center(
                        child: TextButton(
                  onPressed: () => _openSearchFoodScreen(context, Meal.breakfast),
                  child: Text(AppStrings.logFoodLabel.toUpperCase()),
                ))),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 12)),
              SliverToBoxAdapter(
                  child: ValueListenableBuilder(
                      valueListenable: _controller.enabledMacrosPercentageMode,
                      builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                            meal: Meal.lunch,
                            enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                            onTap: _controller.toggleMacrosMode,
                          ))),
              ValueListenableBuilder(
                  valueListenable: _diaryService.dayMealEntries,
                  builder: (context, dayMealEntries, __) => dayMealEntries is FutureLoading
                      ? const SliverPadding(
                          padding: EdgeInsets.only(top: 12),
                          sliver: SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        )
                      : DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.lunch),
                          error: dayMealEntries is FutureError,
                          meal: Meal.lunch,
                        )),
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
                  child: ValueListenableBuilder(
                      valueListenable: _controller.enabledMacrosPercentageMode,
                      builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                            meal: Meal.dinner,
                            enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                            onTap: _controller.toggleMacrosMode,
                          ))),
              ValueListenableBuilder(
                  valueListenable: _diaryService.dayMealEntries,
                  builder: (context, dayMealEntries, __) => dayMealEntries is FutureLoading
                      ? const SliverPadding(
                          padding: EdgeInsets.only(top: 12),
                          sliver: SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        )
                      : DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.dinner),
                          error: dayMealEntries is FutureError,
                          meal: Meal.dinner,
                        )),
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
                child: ValueListenableBuilder(
                  valueListenable: _controller.enabledMacrosPercentageMode,
                  builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                    meal: Meal.snacks,
                    enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                    onTap: _controller.toggleMacrosMode,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: _diaryService.dayMealEntries,
                builder: (context, dayMealEntries, __) => dayMealEntries is FutureLoading
                    ? const SliverPadding(
                        padding: EdgeInsets.only(top: 12),
                        sliver: SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : DiaryEntriesSliverList(
                        loading: dayMealEntries is FutureLoading,
                        entries: _diaryService.getSelectedDayMealEntries(meal: Meal.snacks),
                        error: dayMealEntries is FutureError,
                        meal: Meal.snacks,
                      ),
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
          ),
        ));
  }

  void _openSearchFoodScreen(BuildContext context, Meal meal) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.foodSearch.path, arguments: meal);
    } else {
      debugPrint('context unmounted, could not navigate to food search'); //TODO: support crashlytics
    }
  }
}
