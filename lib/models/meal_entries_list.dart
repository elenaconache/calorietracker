import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_entries_list.g.dart';

@JsonSerializable()
class MealEntriesList {
  final Meal meal;
  final List<DiaryEntry> diaryEntries;

  const MealEntriesList({required this.meal, required this.diaryEntries});

  factory MealEntriesList.fromJson(Map<String, dynamic> json) => _$MealEntriesListFromJson(json);

  Map<String, dynamic> toJson() => _$MealEntriesListToJson(this);

  @override
  String toString() => toJson().toString();
}
