// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritionix_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionixSearchResponse _$NutritionixSearchResponseFromJson(Map<String, dynamic> json) => NutritionixSearchResponse(
      brandedFoods: (json['branded'] as List<dynamic>).map((e) => NutritionixFoodResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$NutritionixSearchResponseToJson(NutritionixSearchResponse instance) => <String, dynamic>{
      'branded': instance.brandedFoods,
    };
