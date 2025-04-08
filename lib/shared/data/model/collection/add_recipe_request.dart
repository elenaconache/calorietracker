import 'package:calorietracker/shared/data/model/collection/collection_recipe_ingredient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_recipe_request.g.dart';

@JsonSerializable()
class AddRecipeRequest {
  final String name;
  final String? description;
  final int cookedWeight;
  final List<CollectionRecipeIngredient> ingredients;

  const AddRecipeRequest({
    required this.name,
    required this.description,
    required this.cookedWeight,
    required this.ingredients,
  });

  factory AddRecipeRequest.fromJson(Map<String, dynamic> json) => _$AddRecipeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddRecipeRequestToJson(this);
}

Map<String, dynamic> serializeAddRecipeRequest(AddRecipeRequest object) => object.toJson();
