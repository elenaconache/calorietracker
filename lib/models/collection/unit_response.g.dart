// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitResponse _$UnitResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'abbrev', 'weightInGrams'],
  );
  return UnitResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    abbrev: json['abbrev'] as String,
    weightInGrams: (json['weightInGrams'] as num).toDouble(),
  );
}

Map<String, dynamic> _$UnitResponseToJson(UnitResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbrev': instance.abbrev,
      'weightInGrams': instance.weightInGrams,
    };
