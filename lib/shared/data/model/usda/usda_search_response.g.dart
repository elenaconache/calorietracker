// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdaSearchResponse _$UsdaSearchResponseFromJson(Map<String, dynamic> json) =>
    UsdaSearchResponse(
      totalHits: (json['totalHits'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      foods: (json['foods'] as List<dynamic>)
          .map((e) => UsdaFood.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsdaSearchResponseToJson(UsdaSearchResponse instance) =>
    <String, dynamic>{
      'totalHits': instance.totalHits,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'foods': instance.foods,
    };
