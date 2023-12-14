import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/features/search_food/food_item.dart';
import 'package:calorietracker/features/search_food/search_food_service.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class BrandedResultsSection extends StatefulWidget {
  final Meal meal;

  const BrandedResultsSection({Key? key, required this.meal}) : super(key: key);

  @override
  State<BrandedResultsSection> createState() => _BrandedResultsSectionState();
}

class _BrandedResultsSectionState extends State<BrandedResultsSection> with AutomaticKeepAliveClientMixin {
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
                : response.data!.brandedFoods.isEmpty
                    ? const EmptyView()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          final item = response.data!.brandedFoods[index];
                          return FoodItem(
                            remoteFood: Food.nutritionix(nutritionixFoodResponse: item),
                            nutritionPerServingQuantity: item.nutrition,
                            meal: widget.meal,
                            servingQuantity: item.servingQuantity ?? 1,
                            unitName: item.servingUnit ?? '',
                          );
                        },
                        itemCount: response.data!.brandedFoods.length,
                      ),
            FutureError _ => const GeneralErrorView(),
            FutureInitialState _ => const SizedBox.shrink(),
          };
        });
  }
}
