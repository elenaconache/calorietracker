import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_search_request.g.dart';

@JsonSerializable()
class NutritionixSearchRequest {
  final String query;
  final String detailed;

  const NutritionixSearchRequest({required this.query, required this.detailed});

  factory NutritionixSearchRequest.fromJson(Map<String, dynamic> json) => _$NutritionixSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionixSearchRequestToJson(this);
}

Map<String, dynamic> serializeNutritionixSearchRequest(NutritionixSearchRequest object) => object.toJson();
