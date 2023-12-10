import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/search_food/empty_view.dart';
import 'package:calorietracker/features/search_food/food_item.dart';
import 'package:calorietracker/features/search_food/search_food_service.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class CollectionResultsSection extends StatefulWidget {
  final Meal meal;

  const CollectionResultsSection({Key? key, required this.meal}) : super(key: key);

  @override
  State<CollectionResultsSection> createState() => _CollectionResultsSectionState();
}

class _CollectionResultsSectionState extends State<CollectionResultsSection> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final foodSearchService = locator<SearchFoodService>();
    return ValueListenableBuilder(
        valueListenable: foodSearchService.collectionSearchResponse,
        builder: (_, collectionResponse, __) => ValueListenableBuilder(
            valueListenable: foodSearchService.localSearchResponse,
            builder: (_, localResponse, __) {
              final hasRemoteResults = localResponse is FutureInitialState;
              final searchResponse = hasRemoteResults ? collectionResponse : localResponse;
              return switch (searchResponse) {
                FutureLoading _ => const Center(child: CircularProgressIndicator()),
                FutureSuccess response => response.data == null
                    ? const SizedBox.shrink()
                    : response.data!.isEmpty
                        ? const EmptyView()
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              final item = response.data![index];
                              final remoteFood = hasRemoteResults ? item as Food : null;
                              final localFood = hasRemoteResults ? null : item as LocalFood;
                              final nutrition = remoteFood?.nutrition ??
                                  (localFood == null ? null : Nutrition.local(localNutrition: localFood.nutritionInfo));
                              if (nutrition == null) return const SizedBox.shrink();
                              return FoodItem(
                                nutritionPerServingQuantity: nutrition,
                                remoteFood: hasRemoteResults ? item as Food : null,
                                localFood: hasRemoteResults ? null : item as LocalFood,
                                meal: widget.meal,
                                unitName: AppStrings.gramsShortLabel,
                                servingQuantity: 100,
                              );
                            },
                            itemCount: response.data!.length,
                          ),
                FutureError _ => const GeneralErrorView(),
                FutureInitialState _ => const SizedBox.shrink(),
              };
            }));
  }
}
