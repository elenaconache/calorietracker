// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_local_food_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLocalFoodRequest _$AddLocalFoodRequestFromJson(Map<String, dynamic> json) =>
    AddLocalFoodRequest(
      localId: json['localId'] as int,
      barcode: json['barcode'] as String?,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      nutritionInfo:
          Nutrition.fromJson(json['nutritionInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddLocalFoodRequestToJson(
        AddLocalFoodRequest instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'nutritionInfo': instance.nutritionInfo,
    };
