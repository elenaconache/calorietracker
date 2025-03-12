import 'package:calorietracker/shared/model/nutritionix/nutritionix_search_request.dart';
import 'package:calorietracker/shared/model/nutritionix/nutritionix_search_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'nutritionix_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class NutritionixApiService {
  factory NutritionixApiService(Dio dio, {String baseUrl}) = _NutritionixApiService;

  @POST('v2/search/instant')
  Future<NutritionixSearchResponse> searchFood({@Body() required NutritionixSearchRequest body});
}
