// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_diary_entry_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDiaryEntryRequest _$AddDiaryEntryRequestFromJson(Map<String, dynamic> json) => AddDiaryEntryRequest(
      entryDate: json['entryDate'] as String,
      userId: json['userId'] as String,
      unitId: json['unitId'] as String,
      foodId: json['foodId'] as String,
      servingQuantity: json['servingQuantity'] as int,
      meal: $enumDecode(_$MealEnumMap, json['meal']),
    );

Map<String, dynamic> _$AddDiaryEntryRequestToJson(AddDiaryEntryRequest instance) => <String, dynamic>{
      'entryDate': instance.entryDate,
      'userId': instance.userId,
      'unitId': instance.unitId,
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
