import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/day_nutrition_summary.dart';
import 'package:calorietracker/features/diary/meal_title.dart';
import 'package:calorietracker/features/diary/no_logged_foods_message.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/service/diary_service.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({super.key});

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends State<DiaryView> {
  late final DiaryService _diaryService;

  @override
  void initState() {
    _diaryService = locator<DiaryService>();
    WidgetsBinding.instance.addPostFrameCallback((_) => _diaryService.fetchDiary());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.diaryTitle,
        ),
        scrolledUnderElevation: 8,
      ),
      body: CustomScrollView(
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
          const SliverToBoxAdapter(child: AppDivider()),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: MealTitle(meal: Meal.breakfast))),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: NoLoggedFoodsMessage())),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
                child: Center(
                    child: TextButton(
              onPressed: () => _openSearchFoodScreen(context, Meal.breakfast),
              child: Text(AppStrings.addFoodLabel.toUpperCase()),
            ))),
          ),
          const SliverToBoxAdapter(child: AppDivider()),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: MealTitle(meal: Meal.lunch))),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: NoLoggedFoodsMessage())),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
                child: Center(
                    child: TextButton(
              onPressed: () => _openSearchFoodScreen(context, Meal.lunch),
              child: Text(AppStrings.addFoodLabel.toUpperCase()),
            ))),
          ),
          const SliverToBoxAdapter(child: AppDivider()),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: MealTitle(meal: Meal.dinner))),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: NoLoggedFoodsMessage())),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
                child: Center(
                    child: TextButton(
              onPressed: () => _openSearchFoodScreen(context, Meal.dinner),
              child: Text(AppStrings.addFoodLabel.toUpperCase()),
            ))),
          ),
          const SliverToBoxAdapter(child: AppDivider()),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: MealTitle(meal: Meal.snacks))),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 24), sliver: SliverToBoxAdapter(child: NoLoggedFoodsMessage())),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
                child: Center(
                    child: TextButton(
              onPressed: () => _openSearchFoodScreen(context, Meal.snacks),
              child: Text(AppStrings.addFoodLabel.toUpperCase()),
            ))),
          ),
          const SliverToBoxAdapter(child: AppDivider()),
        ],
      ),
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
