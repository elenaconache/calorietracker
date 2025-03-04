// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_recipe_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionRecipeIngredient _$CollectionRecipeIngredientFromJson(
        Map<String, dynamic> json) =>
    CollectionRecipeIngredient(
      foodId: (json['foodId'] as num).toInt(),
      foodUnitId: (json['foodUnitId'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$CollectionRecipeIngredientToJson(
        CollectionRecipeIngredient instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'foodUnitId': instance.foodUnitId,
      'quantity': instance.quantity,
    };
