// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryEntry _$DiaryEntryFromJson(Map<String, dynamic> json) => DiaryEntry(
      collectionId: json['collectionId'] as String?,
      localId: json['localId'] as int?,
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
      date: json['date'] as String,
      unitId: json['unitId'] as String,
      servingQuantity: (json['servingQuantity'] as num).toDouble(),
    );

Map<String, dynamic> _$DiaryEntryToJson(DiaryEntry instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'localId': instance.localId,
      'food': instance.food,
      'date': instance.date,
      'unitId': instance.unitId,
      'servingQuantity': instance.servingQuantity,
    };
