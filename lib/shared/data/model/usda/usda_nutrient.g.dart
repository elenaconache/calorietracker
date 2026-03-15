// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usda_nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsdaNutrient _$UsdaNutrientFromJson(Map<String, dynamic> json) => UsdaNutrient(
      value: (json['value'] as num?)?.toDouble(),
      nutrientId: (json['nutrientId'] as num).toInt(),
      nutrientName: json['nutrientName'] as String,
      unitName: json['unitName'] as String,
    );

Map<String, dynamic> _$UsdaNutrientToJson(UsdaNutrient instance) =>
    <String, dynamic>{
      'nutrientId': instance.nutrientId,
      'nutrientName': instance.nutrientName,
      'unitName': instance.unitName,
      'value': instance.value,
    };
