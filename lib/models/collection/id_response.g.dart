// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdResponse _$IdResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id'],
  );
  return IdResponse(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$IdResponseToJson(IdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
