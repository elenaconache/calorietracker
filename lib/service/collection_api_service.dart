import 'package:calorietracker/models/collection/add_diary_entry_with_food_request.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'collection_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class CollectionApiService {
  factory CollectionApiService(Dio dio, {String baseUrl}) = _CollectionApiService;

  @POST('diary-entries/add-with-food')
  Future<void> createDiaryEntryWithFood({@Body() required AddDiaryEntryWithFoodRequest body});
}
