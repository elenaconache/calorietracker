import 'package:calorietracker/models/nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_food_response.g.dart';

@JsonSerializable()
class CollectionFoodResponse {
  @JsonKey(required: true)
  final int id;

  final String? barcode;

  @JsonKey(required: true)
  final String name;

  final String? brand;

  @JsonKey(required: true)
  final Nutrition nutritionInfo;

  const CollectionFoodResponse({
    required this.id,
    this.barcode,
    required this.name,
    required this.brand,
    required this.nutritionInfo,
  });

  factory CollectionFoodResponse.fromJson(Map<String, dynamic> json) => _$CollectionFoodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionFoodResponseToJson(this);

  @override
  String toString() => toJson().toString();

  Nutrition get nutrition => nutritionInfo;
}

List<CollectionFoodResponse> deserializeCollectionFoodResponseList(List<Map<String, dynamic>> json) =>
    json.map((e) => CollectionFoodResponse.fromJson(e)).toList();
