import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/feature/search_food/ui/discover_results_section.dart';
import 'package:calorietracker/feature/search_food/ui/collection_results_section.dart';
import 'package:calorietracker/feature/search_food/ui/powered_by_nutritionix_wrapper.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:flutter/material.dart';

class SearchResultsSection extends StatefulWidget {
  final Meal? meal;

  const SearchResultsSection({super.key, required this.meal});

  @override
  State<SearchResultsSection> createState() => _SearchResultsSectionState();
}

class _SearchResultsSectionState extends State<SearchResultsSection> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final foodSearchService = getIt<SearchFoodService>();
    return SafeArea(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                  AppStrings.discoverLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                )),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              CollectionResultsSection(meal: widget.meal),
              PoweredByWrapper(
                child: ValueListenableBuilder(
                  valueListenable: foodSearchService.usdaSearchResponse,
                  builder: (context, searchResponse, child) {
                    return DiscoverResultsSection(
                      meal: widget.meal,
                      response: searchResponse,
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
