// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_recipe_ingredient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionRecipeIngredientResponse _$CollectionRecipeIngredientResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['food', 'unit', 'quantity'],
  );
  return CollectionRecipeIngredientResponse(
    food: CollectionFood.fromJson(json['food'] as Map<String, dynamic>),
    unit: UnitResponse.fromJson(json['unit'] as Map<String, dynamic>),
    quantity: (json['quantity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CollectionRecipeIngredientResponseToJson(
        CollectionRecipeIngredientResponse instance) =>
    <String, dynamic>{
      'food': instance.food,
      'unit': instance.unit,
      'quantity': instance.quantity,
    };
