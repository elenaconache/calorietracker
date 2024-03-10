import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/collection/unit_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_recipe_ingredient_response.g.dart';

@JsonSerializable()
class CollectionRecipeIngredientResponse {
  @JsonKey(required: true)
  final CollectionFood food;

  @JsonKey(required: true)
  final UnitResponse unit;

  @JsonKey(required: true)
  final double quantity;

  const CollectionRecipeIngredientResponse({
    required this.food,
    required this.unit,
    required this.quantity,
  });

  factory CollectionRecipeIngredientResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionRecipeIngredientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionRecipeIngredientResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

List<CollectionRecipeIngredientResponse> deserializeCollectionRecipeIngredientResponseList(
        List<Map<String, dynamic>> json) =>
    json.map((e) => CollectionRecipeIngredientResponse.fromJson(e)).toList();
