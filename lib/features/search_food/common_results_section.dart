import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/search_food/empty_view.dart';
import 'package:calorietracker/features/search_food/food_item.dart';
import 'package:calorietracker/features/search_food/search_food_service.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class CommonResultsSection extends StatefulWidget {
  final Meal meal;

  const CommonResultsSection({super.key, required this.meal});

  @override
  State<CommonResultsSection> createState() => _CommonResultsSectionState();
}

class _CommonResultsSectionState extends State<CommonResultsSection> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final foodSearchService = locator<SearchFoodService>();
    return ValueListenableBuilder(
        valueListenable: foodSearchService.nutritionixSearchResponse,
        builder: (context, searchResponse, child) {
          return switch (searchResponse) {
            FutureLoading _ => const Center(child: CircularProgressIndicator()),
            FutureSuccess response => response.data == null
                ? const SizedBox.shrink()
                : response.data!.commonFoods.isEmpty
                    ? const EmptyView()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          final item = response.data!.commonFoods[index];
                          return FoodItem(
                            nutritionPerServingQuantity: item.nutrition,
                            remoteFood: Food.nutritionix(nutritionixFoodResponse: item),
                            meal: widget.meal,
                            servingQuantity: item.servingQuantity ?? 1,
                            unitName: item.servingUnit ?? '',
                          );
                        },
                        itemCount: response.data!.commonFoods.length,
                      ),
            FutureError _ => const GeneralErrorView(),
            FutureInitialState _ => const SizedBox.shrink(),
          };
        });
  }
}
