// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_local_diary_entry_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocalDiaryEntryRequest _$AddLocalDiaryEntryRequestFromJson(
        Map<String, dynamic> json) =>
    AddLocalDiaryEntryRequest(
      localId: (json['localId'] as num).toInt(),
      entryDate: json['entryDate'] as String,
      userId: json['userId'] as String,
      foodUnitId: (json['foodUnitId'] as num).toInt(),
      servingQuantity: (json['servingQuantity'] as num).toDouble(),
      meal: $enumDecode(_$MealEnumMap, json['meal']),
      foodId: (json['foodId'] as num).toInt(),
    );

Map<String, dynamic> _$AddLocalDiaryEntryRequestToJson(
        AddLocalDiaryEntryRequest instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'entryDate': instance.entryDate,
      'userId': instance.userId,
      'foodUnitId': instance.foodUnitId,
      'servingQuantity': instance.servingQuantity,
      'meal': _$MealEnumMap[instance.meal]!,
      'foodId': instance.foodId,
    };

const _$MealEnumMap = {
  Meal.breakfast: 'BREAKFAST',
  Meal.lunch: 'LUNCH',
  Meal.dinner: 'DINNER',
  Meal.snacks: 'SNACKS',
};
