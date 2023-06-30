import 'package:calorietracker/models/nutrient.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_nutrient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_food_response.g.dart';

@JsonSerializable()
class NutritionixFoodResponse {
  @JsonKey(name: 'food_name')
  final String name;

  @JsonKey(name: 'brand_name')
  final String? brandName;

  @JsonKey(name: 'full_nutrients')
  final List<NutritionixNutrient> nutrients;

  @JsonKey(name: 'serving_weight_grams')
  final double? servingWeightGrams;

  @JsonKey(name: 'serving_unit')
  final String? servingUnit;

  @JsonKey(name: 'serving_qty')
  final double? servingQuantity;

  const NutritionixFoodResponse(
      {this.brandName, required this.nutrients, required this.servingWeightGrams, this.servingUnit, this.servingQuantity, required this.name});

  factory NutritionixFoodResponse.fromJson(Map<String, dynamic> json) => _$NutritionixFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionixFoodResponseToJson(this);

  @override
  String toString() => toJson().toString();

  Nutrition get nutrition => Nutrition(
        calories: _getNutrientValue(Nutrient.calories),
        fat: _getNutrientValue(Nutrient.fat),
        fatSaturated: _getNutrientValue(Nutrient.fatSaturated),
        fatTrans: _getNutrientValue(Nutrient.fatTrans),
        fatPolyunsaturated: _getNutrientValue(Nutrient.fatPolyunsaturated),
        fatMonounsaturated: _getNutrientValue(Nutrient.fatMonounsaturated),
        cholesterol: _getNutrientValue(Nutrient.cholesterol),
        carbohydrates: _getNutrientValue(Nutrient.carbohydrates),
        fiber: _getNutrientValue(Nutrient.fiber),
        sugar: _getNutrientValue(Nutrient.sugar),
        protein: _getNutrientValue(Nutrient.protein),
        sodium: _getNutrientValue(Nutrient.sodium),
        magnesium: _getNutrientValue(Nutrient.magnesium),
        potassium: _getNutrientValue(Nutrient.potassium),
        calcium: _getNutrientValue(Nutrient.calcium),
        iron: _getNutrientValue(Nutrient.iron),
        vitaminA: _getNutrientValue(Nutrient.vitaminA),
        vitaminC: _getNutrientValue(Nutrient.vitaminC),
        vitaminD: _getNutrientValue(Nutrient.vitaminD),
      );

  Nutrition get nutritionPer100Grams => Nutrition(
        calories: _getNutrientValuePer100Grams(Nutrient.calories),
        fat: _getNutrientValuePer100Grams(Nutrient.fat),
        fatSaturated: _getNutrientValuePer100Grams(Nutrient.fatSaturated),
        fatTrans: _getNutrientValuePer100Grams(Nutrient.fatTrans),
        fatPolyunsaturated: _getNutrientValuePer100Grams(Nutrient.fatPolyunsaturated),
        fatMonounsaturated: _getNutrientValuePer100Grams(Nutrient.fatMonounsaturated),
        cholesterol: _getNutrientValuePer100Grams(Nutrient.cholesterol),
        carbohydrates: _getNutrientValuePer100Grams(Nutrient.carbohydrates),
        fiber: _getNutrientValuePer100Grams(Nutrient.fiber),
        sugar: _getNutrientValuePer100Grams(Nutrient.sugar),
        protein: _getNutrientValuePer100Grams(Nutrient.protein),
        sodium: _getNutrientValuePer100Grams(Nutrient.sodium),
        magnesium: _getNutrientValuePer100Grams(Nutrient.magnesium),
        potassium: _getNutrientValuePer100Grams(Nutrient.potassium),
        calcium: _getNutrientValuePer100Grams(Nutrient.calcium),
        iron: _getNutrientValuePer100Grams(Nutrient.iron),
        vitaminA: _getNutrientValuePer100Grams(Nutrient.vitaminA),
        vitaminC: _getNutrientValuePer100Grams(Nutrient.vitaminC),
        vitaminD: _getNutrientValuePer100Grams(Nutrient.vitaminD),
      );

  double _getNutrientValuePer100Grams(Nutrient nutrient) => !hasMeasurementInfo
      ? 0
      : nutrients
              .firstWhere((element) => element.matchesNutrient(nutrient: nutrient), orElse: () => const NutritionixNutrient(value: 0, nutrientId: 0))
              .value /
          servingWeightGrams! *
          100;

  double _getNutrientValue(Nutrient nutrient) => !hasMeasurementInfo
      ? 0
      : nutrients
          .firstWhere((element) => element.matchesNutrient(nutrient: nutrient), orElse: () => const NutritionixNutrient(value: 0, nutrientId: 0))
          .value;

  bool get hasMeasurementInfo => servingWeightGrams != null && servingQuantity != null && servingUnit != null;
}
