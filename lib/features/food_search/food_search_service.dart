import 'dart:developer';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/helpers/api_response.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_request_body.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_response.dart';
import 'package:calorietracker/service/nutritionix_api_service.dart';
import 'package:flutter/material.dart';

class FoodSearchService {
  final ValueNotifier<ApiResponse<NutritionixSearchResponse>> nutritionixSearchResponse = ValueNotifier(ApiResponse.success(null));

  void searchNutritionix({required String query}) async {
    final nutritionixApiService = await locator.getAsync<NutritionixApiService>();
    nutritionixSearchResponse.value = ApiResponse.loading();
    nutritionixApiService.searchFood(body: NutritionixSearchRequestBody(query: query, detailed: true.toString()))
      ..then((response) => nutritionixSearchResponse.value = ApiResponse.success(NutritionixSearchResponse(
            brandedFoods: response.brandedFoods.where((food) => food.hasMeasurementInfo).toList(),
            commonFoods: response.commonFoods.where((food) => food.hasMeasurementInfo).toList(),
          )))
      ..catchError((error, stackTrace) {
        log('Search failed with error: $error.\n$stackTrace');
        nutritionixSearchResponse.value = ApiResponse.error();
        return const NutritionixSearchResponse(brandedFoods: [], commonFoods: []);
      });
  }

  void clearResults() => nutritionixSearchResponse.value = ApiResponse.success(null);
}
