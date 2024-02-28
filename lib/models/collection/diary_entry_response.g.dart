// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryEntryResponse _$DiaryEntryResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'food', 'entryDate', 'unit', 'servingQuantity'],
  );
  return DiaryEntryResponse(
    id: json['id'] as String,
    food: CollectionFood.fromJson(json['food'] as Map<String, dynamic>),
    entryDate: json['entryDate'] as String,
    unit: UnitResponse.fromJson(json['unit'] as Map<String, dynamic>),
    servingQuantity: (json['servingQuantity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$DiaryEntryResponseToJson(DiaryEntryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food': instance.food,
      'entryDate': instance.entryDate,
      'unit': instance.unit,
      'servingQuantity': instance.servingQuantity,
    };
