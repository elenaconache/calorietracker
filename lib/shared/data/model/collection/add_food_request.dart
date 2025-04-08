import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_food_request.g.dart';

@JsonSerializable()
class AddFoodRequest {
  final String? barcode;
  final String name;
  final String? brand;
  final Nutrition nutritionInfo;

  const AddFoodRequest({
    required this.barcode,
    required this.name,
    required this.brand,
    required this.nutritionInfo,
  });

  factory AddFoodRequest.fromJson(Map<String, dynamic> json) => _$AddFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFoodRequestToJson(this);
}

Map<String, dynamic> serializeAddFoodRequest(AddFoodRequest object) => object.toJson();
