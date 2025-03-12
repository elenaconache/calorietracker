import 'package:calorietracker/shared/model/collection/create_food_error_resource.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_food_error.g.dart';

@JsonSerializable()
class CreateFoodError {
  @JsonKey(required: true)
  final CreateFoodErrorResource resource;

  const CreateFoodError({required this.resource});

  factory CreateFoodError.fromJson(Map<String, dynamic> json) => _$CreateFoodErrorFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFoodErrorToJson(this);

  @override
  String toString() => toJson().toString();
}
