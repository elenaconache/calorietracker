// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_local_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocalDataResponse _$AddLocalDataResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['resourceId', 'localResourceId'],
  );
  return AddLocalDataResponse(
    resourceId: (json['resourceId'] as num).toInt(),
    localResourceId: (json['localResourceId'] as num).toInt(),
  );
}

Map<String, dynamic> _$AddLocalDataResponseToJson(
        AddLocalDataResponse instance) =>
    <String, dynamic>{
      'resourceId': instance.resourceId,
      'localResourceId': instance.localResourceId,
    };
