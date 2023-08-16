import 'package:json_annotation/json_annotation.dart';

part 'created_food_response.g.dart';

@JsonSerializable()
class CreatedFoodResponse {
  @JsonKey(required: true)
  final String id;

  const CreatedFoodResponse({required this.id});

  factory CreatedFoodResponse.fromJson(Map<String, dynamic> json) => _$CreatedFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedFoodResponseToJson(this);
}

CreatedFoodResponse deserializeCreatedFoodResponse(Map<String, dynamic> json) => CreatedFoodResponse.fromJson(json);
