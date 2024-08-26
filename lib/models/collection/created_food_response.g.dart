// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedFoodResponse _$CreatedFoodResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return CreatedFoodResponse(
    id: (json['id'] as num).toInt(),
  );
}

Map<String, dynamic> _$CreatedFoodResponseToJson(
        CreatedFoodResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
