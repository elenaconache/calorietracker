// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritionix_food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionixFoodResponse _$NutritionixFoodResponseFromJson(
        Map<String, dynamic> json) =>
    NutritionixFoodResponse(
      brandName: json['brand_name'] as String?,
      nutrients: (json['full_nutrients'] as List<dynamic>)
          .map((e) => NutritionixNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
      servingWeightGrams: (json['serving_weight_grams'] as num?)?.toDouble(),
      servingUnit: json['serving_unit'] as String?,
      servingQuantity: (json['serving_qty'] as num?)?.toDouble(),
      name: json['food_name'] as String,
    );

Map<String, dynamic> _$NutritionixFoodResponseToJson(
        NutritionixFoodResponse instance) =>
    <String, dynamic>{
      'food_name': instance.name,
      'brand_name': instance.brandName,
      'full_nutrients': instance.nutrients,
      'serving_weight_grams': instance.servingWeightGrams,
      'serving_unit': instance.servingUnit,
      'serving_qty': instance.servingQuantity,
    };
