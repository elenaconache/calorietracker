import 'package:calorietracker/shared/model/nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_food.g.dart';

@JsonSerializable()
class CollectionFood {
  final int? id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final Nutrition nutritionInfo;

  final String? brand;
  final String? barcode;

  const CollectionFood({
    this.id,
    required this.name,
    required this.nutritionInfo,
    this.brand,
    this.barcode,
  });

  factory CollectionFood.fromJson(Map<String, dynamic> json) => _$CollectionFoodFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionFoodToJson(this);

  @override
  String toString() => toJson().toString();
}

List<CollectionFood> deserializeCollectionFoodList(List<Map<String, dynamic>> json) =>
    json.map((e) => CollectionFood.fromJson(e)).toList();
