// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritionix_nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionixNutrient _$NutritionixNutrientFromJson(Map<String, dynamic> json) => NutritionixNutrient(
      value: (json['value'] as num).toDouble(),
      nutrientId: json['attr_id'] as int,
    );

Map<String, dynamic> _$NutritionixNutrientToJson(NutritionixNutrient instance) => <String, dynamic>{
      'value': instance.value,
      'attr_id': instance.nutrientId,
    };
