import 'package:calorietracker/shared/data/model/nutrient.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:calorietracker/shared/data/model/usda/usda_nutrient.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

part 'usda_food.g.dart';

@JsonSerializable()
class UsdaFood {
  @JsonKey(name: 'fdcId')
  final int id;

  @JsonKey(name: 'description')
  final String name;

  final List<UsdaNutrient>? foodNutrients;

  final String? brandOwner;

  @JsonKey(name: 'gtinUpc')
  final String? barcode;

  const UsdaFood({
    required this.name,
    required this.id,
    this.foodNutrients,
    this.brandOwner,
    this.barcode,
  });

  factory UsdaFood.fromJson(Map<String, dynamic> json) => _$UsdaFoodFromJson(json);

  Map<String, dynamic> toJson() => _$UsdaFoodToJson(this);

  @override
  String toString() => toJson().toString();

  Nutrition get nutrition => Nutrition(
        calories: _getNutrientValue(Nutrient.calories),
        fat: _getNutrientValue(Nutrient.fat),
        fatSaturated: _getNutrientValue(Nutrient.fatSaturated),
        fatTrans: _getNutrientValue(Nutrient.fatTrans),
        cholesterol: _getNutrientValue(Nutrient.cholesterol),
        carbohydrates: _getNutrientValue(Nutrient.carbohydrates),
        fiber: _getNutrientValue(Nutrient.fiber),
        sugar: _getNutrientValue(Nutrient.sugar),
        protein: _getNutrientValue(Nutrient.protein),
        sodium: _getNutrientValue(Nutrient.sodium),
        potassium: _getNutrientValue(Nutrient.potassium),
        calcium: _getNutrientValue(Nutrient.calcium),
        iron: _getNutrientValue(Nutrient.iron),
        vitaminA: _getNutrientValue(Nutrient.vitaminA),
        vitaminC: _getNutrientValue(Nutrient.vitaminC),
        vitaminD: _getNutrientValue(Nutrient.vitaminD),
      );

  double _getNutrientValue(Nutrient nutrient) =>
      foodNutrients?.firstWhereOrNull((foodNutrient) => foodNutrient.matchesNutrient(nutrient: nutrient))?.value ?? 0;
}
