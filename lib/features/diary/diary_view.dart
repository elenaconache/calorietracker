import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/meal_title.dart';
import 'package:calorietracker/features/diary/no_logged_foods_message.dart';
import 'package:calorietracker/features/diary/nutrient_item.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/service/diary_service.dart';
import 'package:calorietracker/ui/components/app_divider.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final diaryService = locator<DiaryService>();
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: ValueListenableBuilder(
                  valueListenable: diaryService.dailyNutrition,
                  builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NutrientItem(
                              formattedValue: diaryService.todayNutritionalInfo.carbohydrates?.toStringAsFixed(1) ?? '0.0',
                              name: AppStrings.carbsLabel),
                          NutrientItem(formattedValue: diaryService.todayNutritionalInfo.fat?.toStringAsFixed(1) ?? '0.0', name: AppStrings.fatLabel),
                          NutrientItem(
                              formattedValue: diaryService.todayNutritionalInfo.protein?.toStringAsFixed(1) ?? '0.0', name: AppStrings.proteinLabel),
                          NutrientItem(
                              formattedValue: diaryService.todayNutritionalInfo.calories?.toStringAsFixed(0) ?? '0', name: AppStrings.caloriesLabel),
                        ],
                      )),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverToBoxAdapter(child: AppDivider()),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                  child: MealTitle(
                mealCalories: 0,
                mealLabel: AppStrings.breakfastLabel,
              ))),
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
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                  child: MealTitle(
                mealCalories: 0,
                mealLabel: AppStrings.lunchLabel,
              ))),
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
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                  child: MealTitle(
                mealCalories: 0,
                mealLabel: AppStrings.dinnerLabel,
              ))),
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
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                  child: MealTitle(
                mealCalories: 0,
                mealLabel: AppStrings.snacksLabel,
              ))),
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
