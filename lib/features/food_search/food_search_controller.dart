import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/helpers/api_response.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_request_body.dart';
import 'package:calorietracker/service/nutritionix_api_service.dart';
import 'package:flutter/material.dart';

import '../../models/nutritionix/nutritionix_search_response.dart';

class FoodSearchController {
  final ValueNotifier<ApiResponse<NutritionixSearchResponse>> nutritionixSearchResponse = ValueNotifier(ApiResponse.success(null));

  void searchNutritionix({required String query}) async {
    final nutritionixApiService = await locator.getAsync<NutritionixApiService>();
    nutritionixSearchResponse.value = ApiResponse.loading();
    nutritionixApiService.searchFood(body: NutritionixSearchRequestBody(query: query, detailed: true.toString())).then((value) {
      nutritionixSearchResponse.value = ApiResponse.success(value);
      debugPrint('search results: $value');
    }).catchError((error, stackTrace) {
      debugPrint('Search failed with error: $error.\n$stackTrace');
      nutritionixSearchResponse.value = ApiResponse.error();
    });
  }
}
