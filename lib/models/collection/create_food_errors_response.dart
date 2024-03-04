import 'package:calorietracker/models/collection/create_food_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_food_errors_response.g.dart';

@JsonSerializable()
class CreateFoodErrorsResponse {
  @JsonKey(required: true)
  final List<CreateFoodError> errors;

  const CreateFoodErrorsResponse({required this.errors});

  factory CreateFoodErrorsResponse.fromJson(Map<String, dynamic> json) => _$CreateFoodErrorsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFoodErrorsResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

CreateFoodErrorsResponse deserializeCreateFoodErrorsResponse(Map<String, dynamic> json) =>
    CreateFoodErrorsResponse.fromJson(json);
