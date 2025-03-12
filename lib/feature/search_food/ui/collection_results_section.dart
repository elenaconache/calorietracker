import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/local/local_diary_entry.dart';
import 'package:calorietracker/ui/components/empty_view.dart';
import 'package:calorietracker/feature/search_food/ui/food_item.dart';
import 'package:calorietracker/feature/search_food/data/search_food_service.dart';
import 'package:calorietracker/shared/model/food.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/local/local_food.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/model/nutrition.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';

class CollectionResultsSection extends StatefulWidget {
  final Meal? meal;

  const CollectionResultsSection({super.key, required this.meal});

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
                FutureSuccess<List<Food>> remoteResponse => remoteResponse.data.isEmpty
                    ? const EmptyView()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          final item = remoteResponse.data[index];
                          final nutrition = item.nutrition;
                          return FoodItem(
                            nutritionPerServingQuantity: nutrition,
                            remoteFood: item,
                            localFood: null,
                            meal: widget.meal,
                            unitName: AppStrings.gramsShortLabel,
                            servingQuantity: 100,
                          );
                        },
                        itemCount: remoteResponse.data.length,
                      ),
                FutureSuccess<Map<LocalFood, LocalDiaryEntry?>> localResponse => localResponse.data.isEmpty
                    ? const EmptyView()
                    : ListView.builder(
                        itemBuilder: (_, index) {
                          final item = localResponse.data.entries.toList()[index];
                          final nutrition = item.key.nutrition;
                          final quantity = item.value?.servingQuantity ?? 100;
                          return FoodItem(
                            nutritionPerServingQuantity: Nutrition.perServing(
                              nutritionPer100Grams: nutrition,
                              servingSizeGrams: quantity,
                            ),
                            remoteFood: null,
                            localFood: item.key,
                            meal: widget.meal,
                            unitName: AppStrings.gramsShortLabel,
                            servingQuantity: quantity,
                          );
                        },
                        itemCount: localResponse.data.length,
                      ),
                FutureError _ => const GeneralErrorView(),
                _ => const SizedBox.shrink(),
              };
            }));
  }
}
