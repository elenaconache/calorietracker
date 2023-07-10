// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_diary_entry_with_food_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDiaryEntryWithFoodRequest _$AddDiaryEntryWithFoodRequestFromJson(Map<String, dynamic> json) => AddDiaryEntryWithFoodRequest(
      entryDate: json['entryDate'] as String,
      userId: json['userId'] as String,
      unitId: json['unitId'] as String,
      meal: $enumDecode(_$MealEnumMap, json['meal']),
      name: json['name'] as String,
      brand: json['brand'] as String?,
      nutritionInfo: Nutrition.fromJson(json['nutritionInfo'] as Map<String, dynamic>),
      barcode: json['barcode'] as String?,
      servingQuantity: json['servingQuantity'] as int,
    );

Map<String, dynamic> _$AddDiaryEntryWithFoodRequestToJson(AddDiaryEntryWithFoodRequest instance) => <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'entryDate': instance.entryDate,
      'userId': instance.userId,
      'unitId': instance.unitId,
      'meal': _$MealEnumMap[instance.meal]!,
      'nutritionInfo': instance.nutritionInfo,
      'barcode': instance.barcode,
      'servingQuantity': instance.servingQuantity,
    };

const _$MealEnumMap = {
  Meal.breakfast: 'BREAKFAST',
  Meal.lunch: 'LUNCH',
  Meal.dinner: 'DINNER',
  Meal.snacks: 'SNACKS',
};
