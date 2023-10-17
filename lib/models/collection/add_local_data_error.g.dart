// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_local_data_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocalDataError _$AddLocalDataErrorFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['message', 'index', 'localId'],
  );
  return AddLocalDataError(
    message: json['message'] as String,
    index: json['index'] as int,
    localId: json['localId'] as int,
  );
}

Map<String, dynamic> _$AddLocalDataErrorToJson(AddLocalDataError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'index': instance.index,
      'localId': instance.localId,
    };
