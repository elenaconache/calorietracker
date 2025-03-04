import 'package:calorietracker/shared/model/collection/user_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @GET('find/{username}')
  Future<UserResponse> getUserId({@Path('username') required String username});
}
