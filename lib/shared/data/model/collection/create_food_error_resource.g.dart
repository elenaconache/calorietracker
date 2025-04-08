// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_food_error_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFoodErrorResource _$CreateFoodErrorResourceFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return CreateFoodErrorResource(
    id: (json['id'] as num).toInt(),
  );
}

Map<String, dynamic> _$CreateFoodErrorResourceToJson(
        CreateFoodErrorResource instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
