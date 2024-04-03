import 'dart:async';
import 'dart:developer';

import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/models/local/local_food.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_request.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_search_response.dart';
import 'package:calorietracker/services/api/collection_api_service.dart';
import 'package:calorietracker/services/database/food_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/api/nutritionix_api_service.dart';
import 'package:flutter/material.dart';

class SearchFoodService {
  final ValueNotifier<FutureResponse<NutritionixSearchResponse>> nutritionixSearchResponse =
      ValueNotifier(FutureInitialState());
  final ValueNotifier<FutureResponse<List<Food>>> collectionSearchResponse = ValueNotifier(FutureInitialState());
  final ValueNotifier<FutureResponse<Map<LocalFood, LocalDiaryEntry?>>> localSearchResponse =
      ValueNotifier(FutureInitialState());

  String? currentSearchQuery;

  void searchRemotely({required String query}) {
    currentSearchQuery = query;
    unawaited(_searchNutritionix(query: query));
    unawaited(_searchCollection(query: query));
  }

  Future<void> _searchNutritionix({required String query}) async {
    final nutritionixApiService = await locator.getAsync<NutritionixApiService>();
    nutritionixSearchResponse.value = FutureLoading();
    await nutritionixApiService
        .searchFood(body: NutritionixSearchRequest(query: query, detailed: true.toString()))
        .then((response) {
      nutritionixSearchResponse.value = FutureSuccess(
          data: NutritionixSearchResponse(
        brandedFoods: response.brandedFoods.where((food) => food.hasMeasurementInfo).toList(),
        commonFoods: response.commonFoods.where((food) => food.hasMeasurementInfo).toList(),
      ));
    }).catchError((error, stackTrace) {
      log('Search failed with error: $error.\n$stackTrace');
      nutritionixSearchResponse.value = FutureError();
    });
  }

  Future<void> _searchCollection({required String query}) async {
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    collectionSearchResponse.value = FutureLoading();
    localSearchResponse.value = FutureInitialState();
    await collectionApiService.searchFood(query: query).then((response) {
      collectionSearchResponse.value =
          FutureSuccess(data: response.map((collectionFood) => Food.collection(food: collectionFood)).toList());
    }).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      collectionSearchResponse.value = FutureError();
    });
  }

  void clearResults() {
    nutritionixSearchResponse.value = FutureInitialState();
    collectionSearchResponse.value = FutureInitialState();
    localSearchResponse.value = FutureInitialState();
  }

  // TODO: Show a different empty state when nothing is found locally while typing.
  Future<void> searchLocally({required String query}) async {
    currentSearchQuery = query;
    final foodService = await locator.getAsync<FoodService>();
    final results = await foodService.searchFood(query: query);
    if (currentSearchQuery != query) {
      return;
    }
    localSearchResponse.value = FutureSuccess(data: results);
  }
}
