// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_diary_entry_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDiaryEntryRequest _$AddDiaryEntryRequestFromJson(
        Map<String, dynamic> json) =>
    AddDiaryEntryRequest(
      entryDate: json['entryDate'] as String,
      userId: json['userId'] as String,
      foodUnitId: json['foodUnitId'] as int,
      foodId: json['foodId'] as int,
      servingQuantity: (json['servingQuantity'] as num).toDouble(),
      meal: $enumDecode(_$MealEnumMap, json['meal']),
    );

Map<String, dynamic> _$AddDiaryEntryRequestToJson(
        AddDiaryEntryRequest instance) =>
    <String, dynamic>{
      'entryDate': instance.entryDate,
      'userId': instance.userId,
      'foodUnitId': instance.foodUnitId,
      'foodId': instance.foodId,
      'servingQuantity': instance.servingQuantity,
      'meal': _$MealEnumMap[instance.meal]!,
    };

const _$MealEnumMap = {
  Meal.breakfast: 'BREAKFAST',
  Meal.lunch: 'LUNCH',
  Meal.dinner: 'DINNER',
  Meal.snacks: 'SNACKS',
};
