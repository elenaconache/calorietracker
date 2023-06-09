import 'package:calorietracker/features/food_search/branded_results_section.dart';
import 'package:calorietracker/features/food_search/common_results_section.dart';
import 'package:calorietracker/features/food_search/powered_by_nutritionix_wrapper.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class SearchResultsSection extends StatefulWidget {
  const SearchResultsSection({Key? key}) : super(key: key);

  @override
  State<SearchResultsSection> createState() => _SearchResultsSectionState();
}

class _SearchResultsSectionState extends State<SearchResultsSection> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
                AppStrings.commonLabel,
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                AppStrings.brandedLabel,
                style: Theme.of(context).textTheme.titleMedium,
              ))
        ],
        controller: _tabController,
      ),
      Expanded(
          child: TabBarView(controller: _tabController, children: const [
        PoweredByNutritionixWrapper(child: CommonResultsSection()),
        PoweredByNutritionixWrapper(child: BrandedResultsSection()),
      ]))
    ]);
  }
}
