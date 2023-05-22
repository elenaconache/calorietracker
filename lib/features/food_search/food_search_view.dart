import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/food_search/food_search_controller.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
import 'package:calorietracker/ui/strings.dart';
import 'package:flutter/material.dart';

class FoodSearchView extends StatefulWidget {
  const FoodSearchView({super.key});

  @override
  State<FoodSearchView> createState() => _FoodSearchViewState();
}

class _FoodSearchViewState extends State<FoodSearchView> {
  late final FoodSearchController _controller;

  @override
  void initState() {
    _controller = locator<FoodSearchController>();

    super.initState();
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
          const SizedBox(height: 24),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                onChanged: _onSearchQueryChanged,
              )),
          const SizedBox(height: 12),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: _controller.nutritionixSearchResponse,
            builder: (context, searchResponse, child) {
              if (searchResponse.status == ApiResponseStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (searchResponse.status == ApiResponseStatus.success) {
                if (searchResponse.data != null) {
                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              AppStrings.poweredByNutritionixLabel,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          )),
                      const SliverPadding(padding: EdgeInsets.only(top: 16)),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), child: Text(searchResponse.data!.brandedFoods[index].name)),
                              childCount: searchResponse.data!.brandedFoods.length))
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              } else {
                return Center(child: Text(AppStrings.generalErrorMessage));
              }
            },
          ))
        ],
      ),
    );
  }

  OutlineInputBorder get _defaultBorder {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: const BorderSide(color: Colors.blueGrey, width: 1));
  }

  OutlineInputBorder _buildFocusedBorder(BuildContext context) {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1));
  }

//TODO: debounce logic
  void _onSearchQueryChanged(String text) {
    //TODO: search from history only here
  }
}
