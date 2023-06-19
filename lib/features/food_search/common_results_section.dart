import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/food_search/empty_view.dart';
import 'package:calorietracker/features/food_search/food_item.dart';
import 'package:calorietracker/features/food_search/food_search_service.dart';
import 'package:calorietracker/models/helpers/api_response_status.dart';
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
    final foodSearchService = locator<FoodSearchService>();
    return ValueListenableBuilder(
        valueListenable: foodSearchService.nutritionixSearchResponse,
        builder: (context, searchResponse, child) {
          switch (searchResponse.status) {
            case ApiResponseStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ApiResponseStatus.success:
              return searchResponse.data == null
                  ? const SizedBox.shrink()
                  : searchResponse.data!.commonFoods.isEmpty
                      ? const EmptyView()
                      : ListView.builder(
                itemBuilder: (context, index) => FoodItem(foodResponse: searchResponse.data!.commonFoods[index], meal: widget.meal),
                          itemCount: searchResponse.data!.commonFoods.length,
                        );
            default:
              return const GeneralErrorView();
          }
        });
  }
}
