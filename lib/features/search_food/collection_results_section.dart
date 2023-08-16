import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/search_food/empty_view.dart';
import 'package:calorietracker/features/search_food/food_item.dart';
import 'package:calorietracker/features/search_food/search_food_service.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/ui/app_strings.dart';
import 'package:calorietracker/ui/components/general_error_view.dart';
import 'package:flutter/material.dart';
import 'package:calorietracker/models/food.dart';

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
        builder: (context, searchResponse, child) {
          switch (searchResponse.status) {
            case ApiResponseStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ApiResponseStatus.success:
              return searchResponse.data == null
                  ? const SizedBox.shrink()
                  : searchResponse.data!.isEmpty
                      ? const EmptyView()
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            final item = searchResponse.data![index];
                            return FoodItem(
                              foodResponse: Food.collection(food: item),
                              meal: widget.meal,
                              unitName: AppStrings.gramsShortLabel,
                              servingQuantity: 100,
                            );
                          },
                          itemCount: searchResponse.data!.length,
                        );
            default:
              return const GeneralErrorView();
          }
        });
  }
}
