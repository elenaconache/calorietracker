import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/day_nutrition_summary.dart';
import 'package:calorietracker/features/diary/diary_controller.dart';
import 'package:calorietracker/features/diary/diary_entries_sliver_list.dart';
import 'package:calorietracker/features/diary/meal_title.dart';
import 'package:calorietracker/features/diary/user_avatar_action.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _diaryService.fetchDiary());
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
        appBar: AppBar(
          title: Text(AppStrings.diaryTitle),
          scrolledUnderElevation: 8,
          actions: const [UserAvatarAction()],
        ),
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
                const SliverToBoxAdapter(
                  child: AppDivider(),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverToBoxAdapter(
                        child: Text(
                      AppStrings.nutrientsLabel,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverToBoxAdapter(
                    child: DayNutritionSummary(),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 12)),
                SliverToBoxAdapter(
                    child: ValueListenableBuilder(
                        valueListenable: _controller.enabledMacrosPercentageMode,
                        builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                              meal: Meal.breakfast,
                              enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                              onTap: _controller.toggleMacrosMode,
                            ))),
                ValueListenableBuilder(
                    valueListenable: _diaryService.selectedDayMealEntries,
                    builder: (context, selectedDayMealEntries, __) => DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.breakfast),
                          error: selectedDayMealEntries.status == ApiResponseStatus.error,
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
                    valueListenable: _diaryService.selectedDayMealEntries,
                    builder: (context, selectedDayMealEntries, __) => DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.lunch),
                          error: selectedDayMealEntries.status == ApiResponseStatus.error,
                        )),
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
                SliverToBoxAdapter(
                    child: ValueListenableBuilder(
                        valueListenable: _controller.enabledMacrosPercentageMode,
                        builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                              meal: Meal.dinner,
                              enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                              onTap: _controller.toggleMacrosMode,
                            ))),
                ValueListenableBuilder(
                    valueListenable: _diaryService.selectedDayMealEntries,
                    builder: (context, selectedDayMealEntries, __) => DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.dinner),
                          error: selectedDayMealEntries.status == ApiResponseStatus.error,
                        )),
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
                SliverToBoxAdapter(
                    child: ValueListenableBuilder(
                        valueListenable: _controller.enabledMacrosPercentageMode,
                        builder: (context, enabledMacrosPercentageMode, _) => MealTitle(
                              meal: Meal.snacks,
                              enabledMacrosPercentageMode: enabledMacrosPercentageMode,
                              onTap: _controller.toggleMacrosMode,
                            ))),
                ValueListenableBuilder(
                    valueListenable: _diaryService.selectedDayMealEntries,
                    builder: (context, selectedDayMealEntries, __) => DiaryEntriesSliverList(
                          entries: _diaryService.getSelectedDayMealEntries(meal: Meal.snacks),
                          error: selectedDayMealEntries.status == ApiResponseStatus.error,
                        )),
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
