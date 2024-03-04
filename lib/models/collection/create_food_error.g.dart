// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_food_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFoodError _$CreateFoodErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['resource'],
  );
  return CreateFoodError(
    resource: CreateFoodErrorResource.fromJson(
        json['resource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateFoodErrorToJson(CreateFoodError instance) =>
    <String, dynamic>{
      'resource': instance.resource,
    };
