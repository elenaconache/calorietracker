import 'dart:async';
import 'dart:developer';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_request.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_response.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/api/nutritionix_api_service.dart';
import 'package:flutter/material.dart';

class SearchFoodService {
  final ValueNotifier<FutureResponse<NutritionixSearchResponse>> nutritionixSearchResponse =
      ValueNotifier(FutureResponse.success(null));
  final ValueNotifier<FutureResponse<List<Food>>> collectionSearchResponse =
      ValueNotifier(FutureResponse.success(null));

  String? currentSearchQuery;

  void searchRemotely({required String query}) {
    currentSearchQuery = query;
    unawaited(_searchNutritionix(query: query));
    unawaited(_searchCollection(query: query));
  }

  Future<void> _searchNutritionix({required String query}) async {
    final nutritionixApiService = await locator.getAsync<NutritionixApiService>();
    nutritionixSearchResponse.value = FutureResponse.loading();
    await nutritionixApiService
        .searchFood(body: NutritionixSearchRequest(query: query, detailed: true.toString()))
        .then((response) => nutritionixSearchResponse.value = FutureResponse.success(NutritionixSearchResponse(
              brandedFoods: response.brandedFoods.where((food) => food.hasMeasurementInfo).toList(),
              commonFoods: response.commonFoods.where((food) => food.hasMeasurementInfo).toList(),
            )))
        .catchError((error, stackTrace) {
      log('Search failed with error: $error.\n$stackTrace');
      nutritionixSearchResponse.value = FutureResponse.error();
      return nutritionixSearchResponse.value;
    });
  }

  Future<void> _searchCollection({required String query}) async {
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    collectionSearchResponse.value = FutureResponse.loading();
    await collectionApiService
        .searchFood(query: query)
        .then((response) => collectionSearchResponse.value =
            FutureResponse.success(response.map((collectionFood) => Food.collection(food: collectionFood)).toList()))
        .catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      collectionSearchResponse.value = FutureResponse.error();
      return collectionSearchResponse.value;
    });
  }

  void clearResults() {
    nutritionixSearchResponse.value = FutureResponse.success(null);
    collectionSearchResponse.value = FutureResponse.success(null);
  }

  // TODO: Set a flag to know whether the search was submitted or it only has local items.
  // TODO: Show a different empty state when nothing is found locally while typing.
  Future<void> searchLocally({required String query}) async {
    currentSearchQuery = query;
    final foodService = await locator.getAsync<FoodService>();
    final results = await foodService.searchFood(query: query);
    if (currentSearchQuery != query) {
      return;
    }
    collectionSearchResponse.value =
        FutureResponse.success(results.map((localFood) => Food.local(localFood: localFood)).toList());
  }
}
