import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/feature/search_food/ui/food_item.dart';
import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class BrandedResultsSection extends StatefulWidget {
  final Meal? meal;

  const BrandedResultsSection({super.key, required this.meal});

  @override
  State<BrandedResultsSection> createState() => _BrandedResultsSectionState();
}

class _BrandedResultsSectionState extends State<BrandedResultsSection> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final foodSearchService = getIt<SearchFoodService>();
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
