import 'dart:async';
import 'dart:developer';

import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/food.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/model/local/local_food.dart';
import 'package:calorietracker/shared/model/nutritionix/nutritionix_search_request.dart';
import 'package:calorietracker/shared/model/nutritionix/nutritionix_search_response.dart';
import 'package:calorietracker/shared/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/service/database/food_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/shared/service/api/nutritionix_api_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchFoodService {
  final ValueNotifier<FutureResponse<NutritionixSearchResponse>> nutritionixSearchResponse = ValueNotifier(FutureInitialState());
  final ValueNotifier<FutureResponse<List<Food>>> collectionSearchResponse = ValueNotifier(FutureInitialState());
  final ValueNotifier<FutureResponse<Map<LocalFood, LocalDiaryEntry?>>> localSearchResponse = ValueNotifier(FutureInitialState());

  String? currentSearchQuery;

  void searchRemotely({required String query}) {
    currentSearchQuery = query;
    unawaited(_searchNutritionix(query: query));
    unawaited(_searchCollection(query: query));
  }

  Future<void> _searchNutritionix({required String query}) async {
    final nutritionixApiService = await getIt.getAsync<NutritionixApiService>();
    nutritionixSearchResponse.value = FutureLoading();
    await nutritionixApiService.searchFood(body: NutritionixSearchRequest(query: query, detailed: true.toString())).then((response) {
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
    final collectionApiService = await getIt.getAsync<CollectionApiService>();
    collectionSearchResponse.value = FutureLoading();
    localSearchResponse.value = FutureInitialState();
    await collectionApiService.searchFood(query: query).then((response) {
      collectionSearchResponse.value = FutureSuccess(
        data: response.map((collectionFood) => Food.collection(food: collectionFood)).toList(),
      );
    }).catchError((error, stackTrace) {
      getIt<LoggingService>().handle(error, stackTrace);
      collectionSearchResponse.value = FutureError();
    });
  }

  void clearResults() {
    nutritionixSearchResponse.value = FutureInitialState();
    collectionSearchResponse.value = FutureInitialState();
    localSearchResponse.value = FutureInitialState();
  }

  Future<void> searchLocally({required String query}) async {
    currentSearchQuery = query;
    final foodService =  getIt.get<FoodService>();
    final results = await foodService.searchFood(query: query);
    if (currentSearchQuery != query) {
      return;
    }
    localSearchResponse.value = FutureSuccess(data: results);
  }
}
