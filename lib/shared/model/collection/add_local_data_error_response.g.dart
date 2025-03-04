// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_local_data_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocalDataErrorResponse _$AddLocalDataErrorResponseFromJson(
        Map<String, dynamic> json) =>
    AddLocalDataErrorResponse(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => AddLocalDataError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddLocalDataErrorResponseToJson(
        AddLocalDataErrorResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
