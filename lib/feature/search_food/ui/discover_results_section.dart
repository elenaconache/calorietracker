import 'package:calorietracker/shared/data/model/usda/usda_search_response.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/feature/search_food/ui/food_item.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class DiscoverResultsSection extends StatefulWidget {
  final Meal? meal;
  final FutureResponse<UsdaSearchResponse> response;

  const DiscoverResultsSection({super.key, required this.meal, required this.response});

  @override
  State<DiscoverResultsSection> createState() => _DiscoverResultsSectionState();
}

class _DiscoverResultsSectionState extends State<DiscoverResultsSection> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return switch (widget.response) {
      FutureLoading _ => const Center(child: CircularProgressIndicator()),
      FutureSuccess<UsdaSearchResponse> response => response.data.foods.isEmpty
          ? const EmptyView()
          : ListView.builder(
              itemBuilder: (context, index) {
                final item = response.data.foods[index];
                return FoodItem(
                  remoteFood: Food.usda(usdaFood: item),
                  nutritionPerServingQuantity: item.nutrition,
                  meal: widget.meal,
                  unitName: AppStrings.gramsShortLabel,
                  servingQuantity: 100,
                );
              },
              itemCount: response.data.foods.length,
            ),
      FutureError _ => const GeneralErrorView(),
      FutureInitialState _ => const SizedBox.shrink(),
    };
  }
}
