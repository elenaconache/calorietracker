// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionFoodResponse _$CollectionFoodResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'name',
      'calories',
      'fat',
      'carbohydrates',
      'protein'
    ],
  );
  return CollectionFoodResponse(
    id: json['id'] as String,
    barcode: json['barcode'] as String?,
    name: json['name'] as String,
    brand: json['brand'] as String?,
    calories: json['calories'] as int,
    fat: (json['fat'] as num).toDouble(),
    fatSaturated: (json['fatSaturated'] as num?)?.toDouble(),
    fatTrans: (json['fatTrans'] as num?)?.toDouble(),
    fatPolyunsaturated: (json['fatPolyunsaturated'] as num?)?.toDouble(),
    fatMonounsaturated: (json['fatMonounsaturated'] as num?)?.toDouble(),
    cholesterol: (json['cholesterol'] as num?)?.toDouble(),
    carbohydrates: (json['carbohydrates'] as num).toDouble(),
    fiber: (json['fiber'] as num?)?.toDouble(),
    sugar: (json['sugar'] as num?)?.toDouble(),
    protein: (json['protein'] as num).toDouble(),
    sodium: (json['sodium'] as num?)?.toDouble(),
    potassium: (json['potassium'] as num?)?.toDouble(),
    calcium: (json['calcium'] as num?)?.toDouble(),
    iron: (json['iron'] as num?)?.toDouble(),
    vitaminA: (json['vitaminA'] as num?)?.toDouble(),
    vitaminC: (json['vitaminC'] as num?)?.toDouble(),
    vitaminD: (json['vitaminD'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$CollectionFoodResponseToJson(
        CollectionFoodResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'calories': instance.calories,
      'fat': instance.fat,
      'fatSaturated': instance.fatSaturated,
      'fatTrans': instance.fatTrans,
      'fatPolyunsaturated': instance.fatPolyunsaturated,
      'fatMonounsaturated': instance.fatMonounsaturated,
      'cholesterol': instance.cholesterol,
      'carbohydrates': instance.carbohydrates,
      'fiber': instance.fiber,
      'sugar': instance.sugar,
      'protein': instance.protein,
      'sodium': instance.sodium,
      'potassium': instance.potassium,
      'calcium': instance.calcium,
      'iron': instance.iron,
      'vitaminA': instance.vitaminA,
      'vitaminC': instance.vitaminC,
      'vitaminD': instance.vitaminD,
    };
