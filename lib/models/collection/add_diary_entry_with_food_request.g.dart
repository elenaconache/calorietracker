// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_diary_entry_with_food_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDiaryEntryWithFoodRequest _$AddDiaryEntryWithFoodRequestFromJson(
        Map<String, dynamic> json) =>
    AddDiaryEntryWithFoodRequest(
      entryDate: json['entryDate'] as String,
      userId: json['userId'] as String,
      unitId: json['unitId'] as String,
      meal: $enumDecode(_$MealEnumMap, json['meal']),
      servingQuantity: json['servingQuantity'] as int,
      food: CollectionFood.fromJson(json['food'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddDiaryEntryWithFoodRequestToJson(
        AddDiaryEntryWithFoodRequest instance) =>
    <String, dynamic>{
      'entryDate': instance.entryDate,
      'userId': instance.userId,
      'unitId': instance.unitId,
      'meal': _$MealEnumMap[instance.meal]!,
      'servingQuantity': instance.servingQuantity,
      'food': instance.food,
    };

const _$MealEnumMap = {
  Meal.breakfast: 'BREAKFAST',
  Meal.lunch: 'LUNCH',
  Meal.dinner: 'DINNER',
  Meal.snacks: 'SNACKS',
};
