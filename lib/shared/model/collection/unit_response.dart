import 'package:json_annotation/json_annotation.dart';

part 'unit_response.g.dart';

@JsonSerializable()
class UnitResponse {
  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String abbrev;

  @JsonKey(required: true)
  final double weightInGrams;

  const UnitResponse({
    required this.id,
    required this.name,
    required this.abbrev,
    required this.weightInGrams,
  });

  factory UnitResponse.fromJson(Map<String, dynamic> json) => _$UnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnitResponseToJson(this);

  @override
  String toString() => toJson().toString();
}
