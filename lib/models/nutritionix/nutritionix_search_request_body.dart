import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_search_request_body.g.dart';

@JsonSerializable()
class NutritionixSearchRequestBody {
  final String query;
  final String detailed;

  const NutritionixSearchRequestBody({required this.query, required this.detailed});

  factory NutritionixSearchRequestBody.fromJson(Map<String, dynamic> json) => _$NutritionixSearchRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionixSearchRequestBodyToJson(this);
}

Map<String, dynamic> serializeNutritionixSearchRequestBody(NutritionixSearchRequestBody object) => object.toJson();
