// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      name: json['name'] as String,
      nutrition: Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
      brandName: json['brandName'] as String?,
      id: json['id'] as String?,
      barcode: json['barcode'] as String?,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'name': instance.name,
      'nutrition': instance.nutrition,
      'brandName': instance.brandName,
      'id': instance.id,
      'barcode': instance.barcode,
    };