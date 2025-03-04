// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionFood _$CollectionFoodFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'nutritionInfo'],
  );
  return CollectionFood(
    id: (json['id'] as num?)?.toInt(),
    name: json['name'] as String,
    nutritionInfo:
        Nutrition.fromJson(json['nutritionInfo'] as Map<String, dynamic>),
    brand: json['brand'] as String?,
    barcode: json['barcode'] as String?,
  );
}

Map<String, dynamic> _$CollectionFoodToJson(CollectionFood instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nutritionInfo': instance.nutritionInfo,
      'brand': instance.brand,
      'barcode': instance.barcode,
    };
