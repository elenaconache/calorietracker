import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/app/main.dart';
import 'package:calorietracker/features/food_search/food_search_service.dart';
import 'package:calorietracker/features/food_search/search_results_section.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodSearchView extends StatefulWidget {
  final Meal meal;

  const FoodSearchView({super.key, required this.meal});

  @override
  State<FoodSearchView> createState() => _FoodSearchViewState();
}

class _FoodSearchViewState extends State<FoodSearchView> {
  late final FoodSearchService _foodSearchService;
  late final TextEditingController _searchQueryTextController;

  @override
  void initState() {
    _foodSearchService = locator<FoodSearchService>();
    _searchQueryTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _foodSearchService.clearResults();
    _searchQueryTextController.dispose();
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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                    child: AppTextField(
                  prefixIcon: Icons.search,
                  suffixIcon: Icons.clear,
                  onSuffixIconPressed: _clearSearchQuery,
                  labelText: AppStrings.searchForFoodLabel,
                  controller: _searchQueryTextController,
                  action: TextInputAction.search,
                  onSubmitted: (query) => _foodSearchService.searchNutritionix(query: query),
                )),
                const SizedBox(width: 4),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/barcode_scanner.svg',
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color ?? primaryColor, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 28,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () => _navigateToCreateFood(context),
                )
              ])),
          Expanded(child: SearchResultsSection(meal: widget.meal)),
        ],
      ),
    );
  }

  void _clearSearchQuery() {
    _searchQueryTextController.clear();
    _foodSearchService.clearResults();
  }

  void _navigateToCreateFood(BuildContext context) => Navigator.of(context).pushNamed(
        Routes.createFood.path,
        arguments: widget.meal,
      );
}
