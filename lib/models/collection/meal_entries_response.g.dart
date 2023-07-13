// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_entries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealEntriesResponse _$MealEntriesResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['meal', 'diaryEntries'],
  );
  return MealEntriesResponse(
    meal: $enumDecode(_$MealEnumMap, json['meal']),
    diaryEntries: (json['diaryEntries'] as List<dynamic>).map((e) => DiaryEntryResponse.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$MealEntriesResponseToJson(MealEntriesResponse instance) => <String, dynamic>{
      'meal': _$MealEnumMap[instance.meal]!,
      'diaryEntries': instance.diaryEntries,
    };

const _$MealEnumMap = {
  Meal.breakfast: 'BREAKFAST',
  Meal.lunch: 'LUNCH',
  Meal.dinner: 'DINNER',
  Meal.snacks: 'SNACKS',
};
