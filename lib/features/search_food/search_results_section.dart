import 'package:calorietracker/features/search_food/branded_results_section.dart';
import 'package:calorietracker/features/search_food/collection_results_section.dart';
import 'package:calorietracker/features/search_food/common_results_section.dart';
import 'package:calorietracker/features/search_food/powered_by_nutritionix_wrapper.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class SearchResultsSection extends StatefulWidget {
  final Meal meal;

  const SearchResultsSection({Key? key, required this.meal}) : super(key: key);

  @override
  State<SearchResultsSection> createState() => _SearchResultsSectionState();
}

class _SearchResultsSectionState extends State<SearchResultsSection> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      TabBar(
        tabs: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                AppStrings.collectionLabel,
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                AppStrings.commonLabel,
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                AppStrings.brandedLabel,
                style: Theme.of(context).textTheme.titleMedium,
              )),
        ],
        controller: _tabController,
      ),
      Expanded(
          child: TabBarView(controller: _tabController, children: [
        CollectionResultsSection(meal: widget.meal),
        PoweredByNutritionixWrapper(child: CommonResultsSection(meal: widget.meal)),
        PoweredByNutritionixWrapper(child: BrandedResultsSection(meal: widget.meal)),
      ]))
    ]);
  }
}
