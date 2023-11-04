import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/diary_app_bar.dart';
import 'package:calorietracker/features/diary/diary_controller.dart';
import 'package:calorietracker/features/diary/diary_entries_sliver_list.dart';
import 'package:calorietracker/features/diary/diary_overview_carousel.dart';
import 'package:calorietracker/features/diary/meal_title.dart';
import 'package:calorietracker/models/helpers/future_response_status.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/diary_service.dart';
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
            onRefresh: _diaryService.fetchDiary,
            child: CustomScrollView(
              slivers: [
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(
                    child: Text(
                  AppStrings.todayTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                )),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                const SliverToBoxAdapter(child: DiaryOverviewCarousel()),
                const SliverPadding(padding: EdgeInsets.only(top: 24)),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: SliverToBoxAdapter(
                        child: ValueListenableBuilder(
                            valueListenable: _controller.enabledMacrosPercentageMode,
                            builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                                  meal: Meal.breakfast,
                                  enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                                  onTap: _controller.toggleMacrosMode,
                                )))),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: ValueListenableBuilder(
                        valueListenable: _diaryService.dayMealEntries,
                        builder: (context, dayMealEntries, __) => DiaryEntriesSliverList(
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.breakfast),
                              error: dayMealEntries.status == FutureResponseStatus.error,
                              meal: Meal.breakfast,
                            ))),
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
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: SliverToBoxAdapter(
                        child: ValueListenableBuilder(
                            valueListenable: _controller.enabledMacrosPercentageMode,
                            builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                                  meal: Meal.lunch,
                                  enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                                  onTap: _controller.toggleMacrosMode,
                                )))),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: ValueListenableBuilder(
                        valueListenable: _diaryService.dayMealEntries,
                        builder: (context, dayMealEntries, __) => DiaryEntriesSliverList(
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.lunch),
                              error: dayMealEntries.status == FutureResponseStatus.error,
                              meal: Meal.lunch,
                            ))),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                      child: Center(
                          child: TextButton(
                    onPressed: () => _openSearchFoodScreen(context, Meal.lunch),
                    child: Text(AppStrings.logFoodLabel.toUpperCase()),
                  ))),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: SliverToBoxAdapter(
                        child: ValueListenableBuilder(
                            valueListenable: _controller.enabledMacrosPercentageMode,
                            builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                                  meal: Meal.dinner,
                                  enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                                  onTap: _controller.toggleMacrosMode,
                                )))),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: ValueListenableBuilder(
                        valueListenable: _diaryService.dayMealEntries,
                        builder: (context, dayMealEntries, __) => DiaryEntriesSliverList(
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.dinner),
                              error: dayMealEntries.status == FutureResponseStatus.error,
                              meal: Meal.dinner,
                            ))),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                      child: Center(
                          child: TextButton(
                    onPressed: () => _openSearchFoodScreen(context, Meal.dinner),
                    child: Text(AppStrings.logFoodLabel.toUpperCase()),
                  ))),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: SliverToBoxAdapter(
                        child: ValueListenableBuilder(
                            valueListenable: _controller.enabledMacrosPercentageMode,
                            builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                                  meal: Meal.snacks,
                                  enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                                  onTap: _controller.toggleMacrosMode,
                                )))),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: ValueListenableBuilder(
                        valueListenable: _diaryService.dayMealEntries,
                        builder: (context, dayMealEntries, __) => DiaryEntriesSliverList(
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.snacks),
                              error: dayMealEntries.status == FutureResponseStatus.error,
                              meal: Meal.snacks,
                            ))),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                      child: Center(
                          child: TextButton(
                    onPressed: () => _openSearchFoodScreen(context, Meal.snacks),
                    child: Text(AppStrings.logFoodLabel.toUpperCase()),
                  ))),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 32)),
              ],
            )));
  }

  void _openSearchFoodScreen(BuildContext context, Meal meal) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.foodSearch.path, arguments: meal);
    } else {
      debugPrint('context unmounted, could not navigate to food search'); //TODO: support crashlytics
    }
  }
}
