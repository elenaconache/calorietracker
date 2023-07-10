import 'package:calorietracker/models/nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_food_response.g.dart';

@JsonSerializable()
class CollectionFoodResponse {
  final String id;
  final String? barcode;
  final String name;
  final String brand;
  final int calories;
  final double fat;
  final double? fatSaturated;
  final double? fatTrans;
  final double? fatPolyunsaturated;
  final double? fatMonounsaturated;
  final double? cholesterol;
  final double carbohydrates;
  final double? fiber;
  final double? sugar;
  final double protein;
  final double? sodium;
  final double? potassium;
  final double? calcium;
  final double? iron;
  final double? vitaminA;
  final double? vitaminC;
  final double? vitaminD;

  const CollectionFoodResponse({
    required this.id,
    this.barcode,
    required this.name,
    required this.brand,
    required this.calories,
    required this.fat,
    this.fatSaturated,
    this.fatTrans,
    this.fatPolyunsaturated,
    this.fatMonounsaturated,
    this.cholesterol,
    required this.carbohydrates,
    this.fiber,
    this.sugar,
    required this.protein,
    this.sodium,
    this.potassium,
    this.calcium,
    this.iron,
    this.vitaminA,
    this.vitaminC,
    this.vitaminD,
  });

  factory CollectionFoodResponse.fromJson(Map<String, dynamic> json) => _$CollectionFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionFoodResponseToJson(this);

  @override
  String toString() => toJson().toString();

  Nutrition get nutrition => Nutrition(
        calories: calories.toDouble(),
        fat: fat,
        fatSaturated: fatSaturated,
        fatTrans: fatTrans,
        fatPolyunsaturated: fatPolyunsaturated,
        fatMonounsaturated: fatMonounsaturated,
        cholesterol: cholesterol,
        carbohydrates: carbohydrates,
        fiber: fiber,
        sugar: sugar,
        protein: protein,
        sodium: sodium,
        potassium: potassium,
        calcium: calcium,
        iron: iron,
        vitaminA: vitaminA,
        vitaminC: vitaminC,
        vitaminD: vitaminD,
      );
}

List<CollectionFoodResponse> deserializeCollectionFoodResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => CollectionFoodResponse.fromJson(e)).toList();
