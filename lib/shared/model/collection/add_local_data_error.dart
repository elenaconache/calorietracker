import 'package:json_annotation/json_annotation.dart';

part 'add_local_data_error.g.dart';

@JsonSerializable()
class AddLocalDataError {
  @JsonKey(required: true)
  final String message;

  @JsonKey(required: true)
  final int index;

  @JsonKey(required: true)
  final int localId;

  const AddLocalDataError({
    required this.message,
    required this.index,
    required this.localId,
  });

  factory AddLocalDataError.fromJson(Map<String, dynamic> json) => _$AddLocalDataErrorFromJson(json);

  Map<String, dynamic> toJson() => _$AddLocalDataErrorToJson(this);

  @override
  String toString() => toJson().toString();
}
