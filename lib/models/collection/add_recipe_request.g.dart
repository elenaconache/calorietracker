// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipe_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRecipeRequest _$AddRecipeRequestFromJson(Map<String, dynamic> json) =>
    AddRecipeRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
      cookedWeight: json['cookedWeight'] as int,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) =>
              CollectionRecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddRecipeRequestToJson(AddRecipeRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'cookedWeight': instance.cookedWeight,
      'ingredients': instance.ingredients,
    };
