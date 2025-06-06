import 'dart:async';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/main.dart';
import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/feature/search_food/ui/search_results_section.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/recipe_ingredient.dart';
import 'package:calorietracker/shared/navigation/routes.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/text_field/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFoodView extends StatefulWidget {
  final Meal? meal;

  const SearchFoodView({super.key, this.meal});

  @override
  State<SearchFoodView> createState() => _SearchFoodViewState();
}

class _SearchFoodViewState extends State<SearchFoodView> {
  late final SearchFoodService _foodSearchService;
  late final TextEditingController _searchQueryTextController;

  @override
  void initState() {
    super.initState();
    _foodSearchService = getIt<SearchFoodService>();
    _searchQueryTextController = TextEditingController()..addListener(_onSearchQueryChanged);
  }

  @override
  void dispose() {
    _searchQueryTextController.removeListener(_onSearchQueryChanged);
    _searchQueryTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal == null ? AppStrings.searchIngredientTitle : AppStrings.searchFoodsLabel),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: SearchTextField(
                    labelText: AppStrings.searchForFoodLabel,
                    controller: _searchQueryTextController,
                    onSubmitted: (query) => _foodSearchService.searchRemotely(query: query),
                  ),
                ),
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

  void _navigateToCreateFood(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(
      Routes.createFood.path,
      arguments: widget.meal,
    );
    if (result is RecipeIngredient && context.mounted) {
      Navigator.of(context).pop(result);
    }
  }

  void _onSearchQueryChanged() {
    if (_searchQueryTextController.text.length < 3) {
      _foodSearchService.clearResults();
      return;
    }
    unawaited(_foodSearchService.searchLocally(query: _searchQueryTextController.text));
  }
}
