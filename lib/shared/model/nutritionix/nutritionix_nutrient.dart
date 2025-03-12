import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/model/nutrient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_nutrient.g.dart';

@JsonSerializable()
class NutritionixNutrient {
  @JsonKey(name: 'value')
  final double value;

  @JsonKey(name: 'attr_id')
  final int nutrientId;

  bool matchesNutrient({required Nutrient nutrient}) => nutrientId == nutrientsAttributes[nutrient];

  const NutritionixNutrient({required this.value, required this.nutrientId});

  factory NutritionixNutrient.fromJson(Map<String, dynamic> json) => _$NutritionixNutrientFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionixNutrientToJson(this);

  @override
  String toString() => toJson().toString();
}
