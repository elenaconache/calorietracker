import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_food_response.g.dart';

@JsonSerializable()
class NutritionixFoodResponse {
  @JsonKey(name: 'food_name')
  final String name;

  const NutritionixFoodResponse({required this.name});

  factory NutritionixFoodResponse.fromJson(Map<String, dynamic> json) => _$NutritionixFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionixFoodResponseToJson(this);
}
