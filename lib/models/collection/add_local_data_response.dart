import 'package:json_annotation/json_annotation.dart';

part 'add_local_data_response.g.dart';

@JsonSerializable()
class AddLocalDataResponse {
  @JsonKey(required: true)
  final String resourceId;

  @JsonKey(required: true)
  final int localResourceId;

  const AddLocalDataResponse({
    required this.resourceId,
    required this.localResourceId,
  });

  factory AddLocalDataResponse.fromJson(Map<String, dynamic> json) => _$AddLocalDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddLocalDataResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

List<AddLocalDataResponse> deserializeAddLocalDataResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => AddLocalDataResponse.fromJson(e)).toList();
