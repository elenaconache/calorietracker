// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdaFood _$UsdaFoodFromJson(Map<String, dynamic> json) => UsdaFood(
      name: json['description'] as String,
      id: (json['fdcId'] as num).toInt(),
      foodNutrients: (json['foodNutrients'] as List<dynamic>?)
          ?.map((e) => UsdaNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
      brandOwner: json['brandOwner'] as String?,
      barcode: json['gtinUpc'] as String?,
    );

Map<String, dynamic> _$UsdaFoodToJson(UsdaFood instance) => <String, dynamic>{
      'fdcId': instance.id,
      'description': instance.name,
      'foodNutrients': instance.foodNutrients,
      'brandOwner': instance.brandOwner,
      'gtinUpc': instance.barcode,
    };
