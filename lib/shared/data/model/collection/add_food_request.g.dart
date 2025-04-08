// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_food_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFoodRequest _$AddFoodRequestFromJson(Map<String, dynamic> json) =>
    AddFoodRequest(
      barcode: json['barcode'] as String?,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      nutritionInfo:
          Nutrition.fromJson(json['nutritionInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddFoodRequestToJson(AddFoodRequest instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'nutritionInfo': instance.nutritionInfo,
    };
