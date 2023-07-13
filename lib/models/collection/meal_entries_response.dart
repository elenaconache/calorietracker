import 'package:calorietracker/models/collection/diary_entry_response.dart';
import 'package:calorietracker/models/meal.dart';
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
}

List<MealEntriesResponse> deserializeMealEntriesResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => MealEntriesResponse.fromJson(e)).toList();
