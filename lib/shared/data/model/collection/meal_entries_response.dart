import 'package:calorietracker/shared/data/model/collection/diary_entry_response.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/meal_entries_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_entries_response.g.dart';

@JsonSerializable()
class MealEntriesResponse {
  @JsonKey(required: true)
  final Meal meal;

  @JsonKey(required: true)
  final List<DiaryEntryResponse> diaryEntries;

  const MealEntriesResponse({
    required this.meal,
    required this.diaryEntries,
  });

  factory MealEntriesResponse.fromJson(Map<String, dynamic> json) => _$MealEntriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealEntriesResponseToJson(this);

  @override
  String toString() => toJson().toString();

  MealEntriesList get mealEntriesList => MealEntriesList(
        meal: meal,
        diaryEntries: diaryEntries.map((entry) => entry.diaryEntry).toList(),
      );
}

List<MealEntriesResponse> deserializeMealEntriesResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => MealEntriesResponse.fromJson(e)).toList();
