// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionRecipeResponse _$CollectionRecipeResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'description', 'cookedWeight'],
  );
  return CollectionRecipeResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String?,
    cookedWeight: json['cookedWeight'] as int,
  );
}

Map<String, dynamic> _$CollectionRecipeResponseToJson(
        CollectionRecipeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'cookedWeight': instance.cookedWeight,
    };
