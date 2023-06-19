import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/app/main.dart';
import 'package:calorietracker/features/food_search/food_search_service.dart';
import 'package:calorietracker/features/food_search/search_results_section.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/strings.dart';
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
              child: Row(children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    border: _defaultBorder,
                    focusedBorder: _buildFocusedBorder(context),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 24,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        size: 24,
                      ),
                      onPressed: _clearSearchQuery,
                    ),
                    labelText: AppStrings.searchForFoodLabel,
                  ),
                  controller: _searchQueryTextController,
                  cursorWidth: 1,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (query) => _foodSearchService.searchNutritionix(query: query),
                )),
                const SizedBox(width: 12),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/barcode_scanner.svg',
                    width: 32,
                    height: 32,
                    colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color ?? primaryColor, BlendMode.srcIn),
                  ),
                  onPressed: () {},
                )
              ])),
          Expanded(child: SearchResultsSection(meal: widget.meal)),
        ],
      ),
    );
  }

  OutlineInputBorder get _defaultBorder =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.blueGrey, width: 1));

  OutlineInputBorder _buildFocusedBorder(BuildContext context) =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1));

  void _clearSearchQuery() {
    _searchQueryTextController.clear();
    _foodSearchService.clearResults();
  }
}
