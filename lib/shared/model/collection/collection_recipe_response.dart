import 'package:json_annotation/json_annotation.dart';

part 'collection_recipe_response.g.dart';

@JsonSerializable()
class CollectionRecipeResponse {
  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String? description;

  @JsonKey(required: true)
  final int cookedWeight;

  const CollectionRecipeResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.cookedWeight,
  });

  factory CollectionRecipeResponse.fromJson(Map<String, dynamic> json) => _$CollectionRecipeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionRecipeResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

List<CollectionRecipeResponse> deserializeCollectionRecipeResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => CollectionRecipeResponse.fromJson(e)).toList();
