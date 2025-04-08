// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritionix_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionixSearchRequest _$NutritionixSearchRequestFromJson(
        Map<String, dynamic> json) =>
    NutritionixSearchRequest(
      query: json['query'] as String,
      detailed: json['detailed'] as String,
    );

Map<String, dynamic> _$NutritionixSearchRequestToJson(
        NutritionixSearchRequest instance) =>
    <String, dynamic>{
      'query': instance.query,
      'detailed': instance.detailed,
    };
