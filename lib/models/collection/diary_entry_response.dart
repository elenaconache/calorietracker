import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_entry_response.g.dart';

@JsonSerializable()
class DiaryEntryResponse {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final CollectionFood food;

  @JsonKey(required: true)
  final String entryDate;

  @JsonKey(required: true)
  final String unitId;

  @JsonKey(required: true)
  final double servingQuantity;

  const DiaryEntryResponse({
    required this.id,
    required this.food,
    required this.entryDate,
    required this.unitId,
    required this.servingQuantity,
  });

  factory DiaryEntryResponse.fromJson(Map<String, dynamic> json) => _$DiaryEntryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryEntryResponseToJson(this);

  @override
  String toString() => toJson().toString();
}
