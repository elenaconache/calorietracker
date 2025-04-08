// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_food_errors_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFoodErrorsResponse _$CreateFoodErrorsResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['errors'],
  );
  return CreateFoodErrorsResponse(
    errors: (json['errors'] as List<dynamic>)
        .map((e) => CreateFoodError.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CreateFoodErrorsResponseToJson(
        CreateFoodErrorsResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
