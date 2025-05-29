import 'package:calorietracker/feature/diary/logic/diary_event.dart';
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
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  late final DiaryService _diaryService;

  @override
  void initState() {
    super.initState();
    _diaryService = getIt<DiaryService>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiaryBloc>(
      create: (context) => getIt<DiaryBloc>(),
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: const DiaryAppBar(),
          body: RefreshIndicator(
            onRefresh: getIt<DataSyncService>().uploadLocalData,
            child: BlocBuilder<DiaryBloc, DiaryState>(
              builder: (context, state) {
                final bloc = context.read<DiaryBloc>();
                return CustomScrollView(
                  slivers: [
                    const SliverPadding(padding: EdgeInsets.only(top: 12)),
                    const SliverToBoxAdapter(child: SelectedDayLine()),
                    const SliverPadding(padding: EdgeInsets.only(top: 12)),
                    const SliverToBoxAdapter(child: DiaryOverviewCarousel()),
                    const SliverPadding(padding: EdgeInsets.only(top: 24)),
                    SliverToBoxAdapter(
                      child: MealTitle(
                        meal: Meal.breakfast,
                        enabledMacrosPercentageMode: state.macrosPercentageEnabled,
                        onTap: () => bloc.add(ToggleMacroPercentageEvent()),
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
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.breakfast),
                              error: dayMealEntries is FutureError,
                              meal: Meal.breakfast,
                            ),
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
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.lunch),
                              error: dayMealEntries is FutureError,
                              meal: Meal.lunch,
                            ),
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
                              entries: _diaryService.getSelectedDayMealEntries(meal: Meal.dinner),
                              error: dayMealEntries is FutureError,
                              meal: Meal.dinner,
                            ),
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
                );
              },
            ),
          )),
    );
  }

  void _openSearchFoodScreen(BuildContext context, Meal meal) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.foodSearch.path, arguments: meal);
    } else {
      debugPrint('context unmounted, could not navigate to food search'); //TODO: support crashlytics
    }
  }
}
