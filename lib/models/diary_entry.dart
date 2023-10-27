import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_entry.g.dart';

@JsonSerializable()
class DiaryEntry {
  final String? collectionId;
  final int? localId;
  final Food food;
  final String date;
  final String unitId;
  final double servingQuantity;
  final bool errorPushing;

  const DiaryEntry({
    required this.collectionId,
    required this.localId,
    required this.food,
    required this.date,
    required this.unitId,
    required this.servingQuantity,
    this.errorPushing = false,
  });

  DiaryEntry.local({required LocalDiaryEntry localEntry})
      : collectionId = localEntry.entryId,
        localId = localEntry.id,
        food = Food.localDiary(localFood: localEntry.localFood),
        date = localEntry.entryDate,
        unitId = localEntry.unitId,
        servingQuantity = localEntry.servingQuantity,
        errorPushing = localEntry.errorPushing;

  factory DiaryEntry.fromJson(Map<String, dynamic> json) => _$DiaryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryEntryToJson(this);

  @override
  String toString() => toJson().toString();
}
