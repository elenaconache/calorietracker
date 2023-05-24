import 'package:calorietracker/models/nutrient.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/models/nutritionix/nutritionix_nutrient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nutritionix_food_response.g.dart';

const _nutrientAttribute = {
  Nutrient.fat: 204,
  Nutrient.fatSaturated: 606,
  Nutrient.fatTrans: 605,
  Nutrient.fatPolyunsaturated: 646,
  Nutrient.fatMonounsaturated: 645,
  Nutrient.cholesterol: 601,
  Nutrient.carbohydrates: 205,
  Nutrient.fiber: 291,
  Nutrient.sugar: 269,
  Nutrient.protein: 203,
  Nutrient.sodium: 307,
  Nutrient.magnesium: 304,
  Nutrient.potassium: 306,
  Nutrient.calcium: 301,
  Nutrient.iron: 303,
  Nutrient.vitaminA: 318,
  Nutrient.vitaminC: 401,
  Nutrient.vitaminD: 328,
  Nutrient.calories: 208,
};

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
  String toString() {
    return toJson().toString();
  }

  Nutrition get nutrition {
    return Nutrition(
      calories: nutrients
          .firstWhere(
            (element) => element.nutrientId == _nutrientAttribute[Nutrient.calories],
            orElse: () => const NutritionixNutrient(value: 0, nutrientId: 0),
            //TODO: utility methods in nutritionix nutrient model to get calories and check if nutrient holds calories value
          )
          .value,
    );
  }

  bool get hasMeasurementInfo => servingWeightGrams != null && servingQuantity != null && servingUnit != null;
}
