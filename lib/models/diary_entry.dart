import 'package:calorietracker/models/food.dart';
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

  const DiaryEntry({
    required this.collectionId,
    required this.localId,
    required this.food,
    required this.date,
    required this.unitId,
    required this.servingQuantity,
  });

  factory DiaryEntry.fromJson(Map<String, dynamic> json) => _$DiaryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryEntryToJson(this);

  @override
  String toString() => toJson().toString();
}
