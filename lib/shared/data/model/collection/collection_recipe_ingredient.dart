import 'package:json_annotation/json_annotation.dart';

part 'collection_recipe_ingredient.g.dart';

@JsonSerializable()
class CollectionRecipeIngredient {
  final int foodId;
  final int foodUnitId;
  final double quantity;

  const CollectionRecipeIngredient({required this.foodId, required this.foodUnitId, required this.quantity});

  factory CollectionRecipeIngredient.fromJson(Map<String, dynamic> json) => _$CollectionRecipeIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionRecipeIngredientToJson(this);
}
