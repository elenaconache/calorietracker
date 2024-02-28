import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/local/local_diary_entry.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_entry.g.dart';

@JsonSerializable()
class DiaryEntry {
  final String? collectionId;
  final int? localId;
  final Food food;
  final String date;
  final int unitId;
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
        localId = localEntry.localId,
        food = Food.local(localFood: localEntry.localFood.value!),
        date = locator<DateFormattingService>().format(
          dateTime: localEntry.entryDate.toString(),
          format: collectionApiDateFormat,
        ),
        unitId = localEntry.unitId,
        servingQuantity = localEntry.servingQuantity,
        errorPushing = localEntry.errorPushingEntry;

  factory DiaryEntry.fromJson(Map<String, dynamic> json) => _$DiaryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryEntryToJson(this);

  @override
  String toString() => toJson().toString();

  bool matches(DiaryEntry diaryEntry) =>
      diaryEntry.collectionId != null && diaryEntry.collectionId == collectionId ||
      diaryEntry.localId != null && diaryEntry.localId == localId;
}
