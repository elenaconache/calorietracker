import 'dart:async';
import 'dart:developer';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_request.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_response.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/nutritionix_api_service.dart';
import 'package:flutter/material.dart';

class SearchFoodService {
  final ValueNotifier<FutureResponse<NutritionixSearchResponse>> nutritionixSearchResponse = ValueNotifier(FutureResponse.success(null));
  final ValueNotifier<FutureResponse<List<CollectionFood>>> collectionSearchResponse = ValueNotifier(FutureResponse.success(null));

  void search({required String query}) {
    unawaited(_searchNutritionix(query: query));
    unawaited(_searchCollection(query: query));
  }

  Future<void> _searchNutritionix({required String query}) async {
    final nutritionixApiService = await locator.getAsync<NutritionixApiService>();
    nutritionixSearchResponse.value = FutureResponse.loading();
    nutritionixApiService.searchFood(body: NutritionixSearchRequest(query: query, detailed: true.toString()))
      ..then((response) => nutritionixSearchResponse.value = FutureResponse.success(NutritionixSearchResponse(
            brandedFoods: response.brandedFoods.where((food) => food.hasMeasurementInfo).toList(),
            commonFoods: response.commonFoods.where((food) => food.hasMeasurementInfo).toList(),
          )))
      ..catchError((error, stackTrace) {
        log('Search failed with error: $error.\n$stackTrace');
        nutritionixSearchResponse.value = FutureResponse.error();
        return const NutritionixSearchResponse(brandedFoods: [], commonFoods: []);
      });
  }

  Future<void> _searchCollection({required String query}) async {
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    collectionSearchResponse.value = FutureResponse.loading();
    collectionApiService.searchFood(query: query)
      ..then((response) => collectionSearchResponse.value = FutureResponse.success(response))
      ..catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        nutritionixSearchResponse.value = FutureResponse.error();
        return <CollectionFood>[];
      });
  }

  void clearResults() {
    nutritionixSearchResponse.value = FutureResponse.success(null);
    collectionSearchResponse.value = FutureResponse.success(null);
  }
}
