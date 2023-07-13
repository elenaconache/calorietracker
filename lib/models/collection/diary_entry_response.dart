import 'package:json_annotation/json_annotation.dart';

part 'diary_entry_response.g.dart';

@JsonSerializable()
class DiaryEntryResponse {
  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String name;

  final String? brand;

  @JsonKey(required: true)
  final String entryDate;

  @JsonKey(required: true)
  final String unitId;

  @JsonKey(required: true)
  final double servingQuantity;

  @JsonKey(required: true)
  final int calories;

  @JsonKey(required: true)
  final double fat;

  final double? fatSaturated;
  final double? fatTrans;
  final double? fatPolyunsaturated;
  final double? fatMonounsaturated;
  final double? cholesterol;

  @JsonKey(required: true)
  final double carbohydrates;

  final double? fiber;
  final double? sugar;

  @JsonKey(required: true)
  final double protein;

  final double? sodium;
  final double? potassium;
  final double? calcium;
  final double? iron;
  final double? vitaminA;
  final double? vitaminC;
  final double? vitaminD;

  const DiaryEntryResponse({
    required this.id,
    required this.name,
    this.brand,
    required this.entryDate,
    required this.unitId,
    required this.servingQuantity,
    required this.calories,
    required this.fat,
    this.fatSaturated,
    this.fatTrans,
    this.fatPolyunsaturated,
    this.fatMonounsaturated,
    this.cholesterol,
    required this.carbohydrates,
    this.fiber,
    this.sugar,
    required this.protein,
    this.sodium,
    this.potassium,
    this.calcium,
    this.iron,
    this.vitaminA,
    this.vitaminC,
    this.vitaminD,
  });

  factory DiaryEntryResponse.fromJson(Map<String, dynamic> json) => _$DiaryEntryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryEntryResponseToJson(this);

  @override
  String toString() => toJson().toString();
}
