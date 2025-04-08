import 'package:calorietracker/shared/data/model/nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_local_food_request.g.dart';

@JsonSerializable()
class AddLocalFoodRequest {
  final int localId;
  final String? barcode;
  final String name;
  final String? brand;
  final Nutrition nutritionInfo;

  const AddLocalFoodRequest({
    required this.localId,
    this.barcode,
    required this.name,
    this.brand,
    required this.nutritionInfo,
  });

  factory AddLocalFoodRequest.fromJson(Map<String, dynamic> json) => _$AddLocalFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddLocalFoodRequestToJson(this);
}

List<Map<String, dynamic>> serializeAddLocalFoodRequestList(List<AddLocalFoodRequest> objects) => objects.map((e) => e.toJson()).toList();
