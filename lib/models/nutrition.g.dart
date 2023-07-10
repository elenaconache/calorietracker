// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      fatSaturated: (json['fatSaturated'] as num?)?.toDouble() ?? 0,
      fatTrans: (json['fatTrans'] as num?)?.toDouble() ?? 0,
      fatPolyunsaturated: (json['fatPolyunsaturated'] as num?)?.toDouble() ?? 0,
      fatMonounsaturated: (json['fatMonounsaturated'] as num?)?.toDouble() ?? 0,
      cholesterol: (json['cholesterol'] as num?)?.toDouble() ?? 0,
      sodium: (json['sodium'] as num?)?.toDouble() ?? 0,
      potassium: (json['potassium'] as num?)?.toDouble() ?? 0,
      calcium: (json['calcium'] as num?)?.toDouble() ?? 0,
      iron: (json['iron'] as num?)?.toDouble() ?? 0,
      vitaminA: (json['vitaminA'] as num?)?.toDouble() ?? 0,
      vitaminC: (json['vitaminC'] as num?)?.toDouble() ?? 0,
      vitaminD: (json['vitaminD'] as num?)?.toDouble() ?? 0,
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      calories: (json['calories'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble() ?? 0,
      fiber: (json['fiber'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
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
