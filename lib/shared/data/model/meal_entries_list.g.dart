// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_entries_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealEntriesList _$MealEntriesListFromJson(Map<String, dynamic> json) =>
    MealEntriesList(
      meal: $enumDecode(_$MealEnumMap, json['meal']),
      diaryEntries: (json['diaryEntries'] as List<dynamic>)
          .map((e) => DiaryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealEntriesListToJson(MealEntriesList instance) =>
    <String, dynamic>{
      'meal': _$MealEnumMap[instance.meal]!,
      'diaryEntries': instance.diaryEntries,
    };

const _$MealEnumMap = {
  Meal.breakfast: 'BREAKFAST',
  Meal.lunch: 'LUNCH',
  Meal.dinner: 'DINNER',
  Meal.snacks: 'SNACKS',
};
