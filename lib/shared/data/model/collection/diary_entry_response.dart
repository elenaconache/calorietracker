import 'package:calorietracker/shared/data/model/collection/collection_food.dart';
import 'package:calorietracker/shared/data/model/collection/unit_response.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_entry_response.g.dart';

@JsonSerializable()
class DiaryEntryResponse {
  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final CollectionFood food;

  @JsonKey(required: true)
  final String entryDate;

  @JsonKey(required: true)
  final UnitResponse unit;

  @JsonKey(required: true)
  final double servingQuantity;

  const DiaryEntryResponse({
    required this.id,
    required this.food,
    required this.entryDate,
    required this.unit,
    required this.servingQuantity,
  });

  factory DiaryEntryResponse.fromJson(Map<String, dynamic> json) => _$DiaryEntryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryEntryResponseToJson(this);

  @override
  String toString() => toJson().toString();

  DiaryEntry get diaryEntry => DiaryEntry(
        collectionId: id,
        localId: null,
        food: Food.collection(food: food),
        date: entryDate,
        unitId: unit.id,
        servingQuantity: servingQuantity,
      );
}
