import 'package:calorietracker/models/collection/add_diary_entry_with_food_request.dart';
import 'package:calorietracker/models/collection/add_food_request.dart';
import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/collection/created_food_response.dart';
import 'package:calorietracker/models/collection/meal_entries_response.dart';
import 'package:calorietracker/models/collection/user_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'collection_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class CollectionApiService {
  factory CollectionApiService(Dio dio, {String baseUrl}) = _CollectionApiService;

  @POST('diary-entries/add-with-food')
  Future<void> createDiaryEntryWithFood({@Body() required AddDiaryEntryWithFoodRequest body});

  @GET('diary-entries/{userId}/{date}')
  Future<List<MealEntriesResponse>> getDiaryEntries({@Path('userId') required String userId, @Path('date') required String date});

  @GET('users/{username}')
  Future<UserResponse> getUserId({@Path('username') required String username});

  @POST('foods/add')
  Future<CreatedFoodResponse?> createFood({@Body() required AddFoodRequest body});

  @GET('foods/find-by/{query}')
  Future<List<CollectionFood>> searchFood({@Path('query') required String query});
}
