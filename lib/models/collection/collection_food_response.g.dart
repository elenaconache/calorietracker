// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionFoodResponse _$CollectionFoodResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'nutritionInfo'],
  );
  return CollectionFoodResponse(
    id: json['id'] as String,
    barcode: json['barcode'] as String?,
    name: json['name'] as String,
    brand: json['brand'] as String?,
    nutritionInfo:
        Nutrition.fromJson(json['nutritionInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionFoodResponseToJson(
        CollectionFoodResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'nutritionInfo': instance.nutritionInfo,
    };
