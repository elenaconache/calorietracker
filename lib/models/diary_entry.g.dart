// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryEntry _$DiaryEntryFromJson(Map<String, dynamic> json) => DiaryEntry(
      collectionId: (json['collectionId'] as num?)?.toInt(),
      localId: (json['localId'] as num?)?.toInt(),
      food: Food.fromJson(json['food'] as Map<String, dynamic>),
      date: json['date'] as String,
      unitId: (json['unitId'] as num).toInt(),
      servingQuantity: (json['servingQuantity'] as num).toDouble(),
      errorPushing: json['errorPushing'] as bool? ?? false,
    );

Map<String, dynamic> _$DiaryEntryToJson(DiaryEntry instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'localId': instance.localId,
      'food': instance.food,
      'date': instance.date,
      'unitId': instance.unitId,
      'servingQuantity': instance.servingQuantity,
      'errorPushing': instance.errorPushing,
    };
