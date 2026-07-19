// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_collection_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseCollectionErrorResponse _$BaseCollectionErrorResponseFromJson(
  Map<String, dynamic> json,
) => _BaseCollectionErrorResponse(
  errors: const CollectionErrorConverter().fromJson(json['errors'] as List),
);

Map<String, dynamic> _$BaseCollectionErrorResponseToJson(
  _BaseCollectionErrorResponse instance,
) => <String, dynamic>{
  'errors': const CollectionErrorConverter().toJson(instance.errors),
};
