import 'package:calorietracker/shared/data/model/collection/add_local_data_error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_local_data_error_response.g.dart';

@JsonSerializable()
class AddLocalDataErrorResponse {
  final List<AddLocalDataError>? errors;

  const AddLocalDataErrorResponse({this.errors});

  factory AddLocalDataErrorResponse.fromJson(Map<String, dynamic> json) => _$AddLocalDataErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddLocalDataErrorResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

AddLocalDataErrorResponse deserializeAddLocalDataErrorResponse(Map<String, dynamic> json) => AddLocalDataErrorResponse.fromJson(json);
