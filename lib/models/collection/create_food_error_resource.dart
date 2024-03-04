import 'package:json_annotation/json_annotation.dart';

part 'create_food_error_resource.g.dart';

@JsonSerializable()
class CreateFoodErrorResource {
  @JsonKey(required: true)
  final int id;

  const CreateFoodErrorResource({required this.id});

  factory CreateFoodErrorResource.fromJson(Map<String, dynamic> json) => _$CreateFoodErrorResourceFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFoodErrorResourceToJson(this);

  @override
  String toString() => toJson().toString();
}
