import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/diary/nutrient_item.dart';
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
          const SliverPadding(padding: EdgeInsets.only(top: 24)),
          SliverToBoxAdapter(
              child: Text(
            AppStrings.todayTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
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
                style: Theme.of(context).textTheme.titleLarge,
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
                          NutrientItem(value: diaryService.todayNutritionalInfo.carbohydrates ?? 0, name: AppStrings.carbsLabel),
                          NutrientItem(value: diaryService.todayNutritionalInfo.fat ?? 0, name: AppStrings.fatLabel),
                          NutrientItem(value: diaryService.todayNutritionalInfo.protein ?? 0, name: AppStrings.proteinLabel),
                          NutrientItem(value: diaryService.todayNutritionalInfo.calories ?? 0, name: AppStrings.caloriesLabel),
                        ],
                      )),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          const SliverToBoxAdapter(
            child: AppDivider(),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                  child: Text(
                AppStrings.mealsLabel,
                style: Theme.of(context).textTheme.titleLarge,
              ))),
          const SliverPadding(padding: EdgeInsets.only(top: 12)),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: SizedBox(
                              width: double.infinity,
                              child: FilledButton.tonal(
                                onPressed: () => _openSearchFoodScreen(context),
                                child: Text(
                                  AppStrings.addFoodLabel.toUpperCase(),
                                ),
                              )))))),
        ],
      ),
    );
  }

  void _openSearchFoodScreen(BuildContext context) {
    if (context.mounted) {
      Navigator.of(context).pushNamed(Routes.foodSearch.path);
    } else {
      debugPrint('context unmounted, could not navigate to food search'); //TODO: support crashlytics
    }
  }
}
