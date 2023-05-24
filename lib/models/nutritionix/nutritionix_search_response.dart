import 'package:calorietracker/models/nutritionix/nutritionix_food_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_search_response.g.dart';

@JsonSerializable()
class NutritionixSearchResponse {
  @JsonKey(name: 'branded')
  final List<NutritionixFoodResponse> brandedFoods;

  @JsonKey(name: 'common')
  final List<NutritionixFoodResponse> commonFoods;

  const NutritionixSearchResponse({required this.brandedFoods, required this.commonFoods});

  factory NutritionixSearchResponse.fromJson(Map<String, dynamic> json) => _$NutritionixSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionixSearchResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

NutritionixSearchResponse deserializeNutritionixSearchResponse(Map<String, dynamic> json) => NutritionixSearchResponse.fromJson(json);
