import 'package:json_annotation/json_annotation.dart';

part 'id_response.g.dart';

@JsonSerializable()
class IdResponse {
  @JsonKey(required: true)
  final String id;

  const IdResponse({required this.id});

  factory IdResponse.fromJson(Map<String, dynamic> json) => _$IdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IdResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

IdResponse deserializeIdResponse(Map<String, dynamic> json) => IdResponse.fromJson(json);
