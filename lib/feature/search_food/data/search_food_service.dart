import 'dart:async';
import 'dart:developer';

import 'package:calorietracker/shared/app_environment.dart';
import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/local/local_diary_entry.dart';
import 'package:calorietracker/shared/data/model/local/local_food.dart';
import 'package:calorietracker/shared/data/model/usda/usda_search_response.dart';
import 'package:calorietracker/shared/data/service/api/collection_api_service.dart';
import 'package:calorietracker/shared/data/service/database/food_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/service/api/usda_api_service.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchFoodService {
  final ValueNotifier<FutureResponse<UsdaSearchResponse>> usdaSearchResponse = ValueNotifier(FutureInitialState());
  final ValueNotifier<FutureResponse<List<Food>>> collectionSearchResponse = ValueNotifier(FutureInitialState());
  final ValueNotifier<FutureResponse<Map<LocalFood, LocalDiaryEntry?>>> localSearchResponse = ValueNotifier(FutureInitialState());

  String? currentSearchQuery;

  void searchRemotely({required String query}) {
    currentSearchQuery = query;
    unawaited(_searchUsda(query: query));
    unawaited(_searchCollection(query: query));
  }

  Future<void> _searchUsda({required String query}) async {
    final usdaApiService = await getIt.getAsync<UsdaApiService>();
    final env = await getIt.getAsync<AppEnvironment>();
    usdaSearchResponse.value = FutureLoading();
    await usdaApiService
        .searchFood(
            query: query,
            apiKey: env.getString(
              key: usdaApiKey,
            ))
        .then((response) {
      usdaSearchResponse.value = FutureSuccess(data: response);
    }).catchError((error, stackTrace) {
      log('Search failed with error: $error.\n$stackTrace');
      usdaSearchResponse.value = FutureError();
    });
  }

  Future<void> _searchCollection({required String query}) async {
    final collectionApiService = getIt.get<CollectionApiService>();
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
    usdaSearchResponse.value = FutureInitialState();
    collectionSearchResponse.value = FutureInitialState();
    localSearchResponse.value = FutureInitialState();
  }

  Future<void> searchLocally({required String query}) async {
    currentSearchQuery = query;
    final foodService = getIt.get<FoodService>();
    final results = await foodService.searchFood(query: query);
    if (currentSearchQuery != query) {
      return;
    }
    localSearchResponse.value = FutureSuccess(data: results);
  }
}
