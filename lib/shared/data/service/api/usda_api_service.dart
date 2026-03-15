import 'package:calorietracker/shared/data/model/usda/usda_search_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'usda_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class UsdaApiService {
  factory UsdaApiService(Dio dio, {String baseUrl}) = _UsdaApiService;

  @GET('v1/foods/search')
  Future<UsdaSearchResponse> searchFood({
    @Query('api_key') required String apiKey,
    @Query('query') required String query,
    @Query('pageSize') int pageSize = 40,
    @Query('pageNumber') int pageNumber = 1,
  });
}
