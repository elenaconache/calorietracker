import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/food_search/food_search_service.dart';
import 'package:calorietracker/features/food_search/search_results_section.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class FoodSearchView extends StatefulWidget {
  const FoodSearchView({super.key});

  @override
  State<FoodSearchView> createState() => _FoodSearchViewState();
}

class _FoodSearchViewState extends State<FoodSearchView> {
  late final FoodSearchService _foodSearchService;

  @override
  void initState() {
    _foodSearchService = locator<FoodSearchService>();
    super.initState();
  }

  @override
  void dispose() {
    _foodSearchService.clearResults();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.searchFoodsLabel),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: _defaultBorder,
                  focusedBorder: _buildFocusedBorder(context),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 24,
                  ),
                  labelText: AppStrings.searchForFoodLabel,
                ),
                cursorWidth: 1,
                textInputAction: TextInputAction.search,
                onSubmitted: (query) => _foodSearchService.searchNutritionix(query: query),
              )),
          const Expanded(child: SearchResultsSection()),
        ],
      ),
    );
  }

  OutlineInputBorder get _defaultBorder =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.blueGrey, width: 1));

  OutlineInputBorder _buildFocusedBorder(BuildContext context) =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1));
}
