import 'dart:io';

import 'package:calorietracker/models/collection/add_diary_entry_request.dart';
import 'package:calorietracker/models/collection/add_food_request.dart';
import 'package:calorietracker/models/collection/add_local_diary_entry_request.dart';
import 'package:calorietracker/models/collection/add_local_food_request.dart';
import 'package:calorietracker/models/collection/add_local_data_response.dart';
import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/collection/created_food_response.dart';
import 'package:calorietracker/models/collection/id_response.dart';
import 'package:calorietracker/models/collection/meal_entries_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'collection_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class CollectionApiService {
  factory CollectionApiService(Dio dio, {String baseUrl}) = _CollectionApiService;

  @POST('diary-entries/add')
  Future<IdResponse> createDiaryEntry({@Body() required AddDiaryEntryRequest body});

  @GET('diary-entries/{userId}/{date}')
  Future<List<MealEntriesResponse>> getDiaryEntries(
      {@Path('userId') required String userId, @Path('date') required String date});

  @POST('foods/add')
  Future<CreatedFoodResponse?> createFood({@Body() required AddFoodRequest body});

  @GET('foods/find-by/{query}')
  Future<List<CollectionFood>> searchFood({@Path('query') required String query});

  @POST('foods/add-list')
  Future<List<AddLocalDataResponse>> createFoods({@Body() required List<AddLocalFoodRequest> localFoods});

  @POST('diary-entries/add-list')
  Future<List<AddLocalDataResponse>> createDiaryEntries({
    @Body() required List<AddLocalDiaryEntryRequest> localDiaryEntries,
  });

  @DELETE('diary-entries/delete/{diaryEntryId}')
  Future<void> deleteDiaryEntry({@Path('diaryEntryId') required String diaryEntryId});

  @POST('diary-entries/delete/list')
  @Headers({HttpHeaders.contentTypeHeader: 'application/json'})
  Future<void> deleteDiaryEntries({@Body() required List<String> ids});
}
