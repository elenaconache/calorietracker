import 'package:calorietracker/shared/constants.dart';
import 'package:calorietracker/shared/data/model/nutrient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usda_nutrient.g.dart';

@JsonSerializable()
class UsdaNutrient {
  final int nutrientId;

  final String nutrientName;

  final String unitName;

  final double? value;

  bool matchesNutrient({required Nutrient nutrient}) => nutrientId == usdaNutrientMap[nutrient];

  const UsdaNutrient({required this.value, required this.nutrientId, required this.nutrientName, required this.unitName});

  factory UsdaNutrient.fromJson(Map<String, dynamic> json) => _$UsdaNutrientFromJson(json);

  Map<String, dynamic> toJson() => _$UsdaNutrientToJson(this);

  @override
  String toString() => toJson().toString();
}
