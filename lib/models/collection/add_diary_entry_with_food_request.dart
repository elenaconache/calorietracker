import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_diary_entry_with_food_request.g.dart';

@JsonSerializable()
class AddDiaryEntryWithFoodRequest {
  final String name;
  final String? brand;
  final String entryDate;
  final String userId;
  final String unitId;
  final Meal meal;
  final Nutrition nutritionInfo;
  final String? barcode;
  final int servingQuantity;

  const AddDiaryEntryWithFoodRequest({
    required this.entryDate,
    required this.userId,
    required this.unitId,
    required this.meal,
    required this.name,
    this.brand,
    required this.nutritionInfo,
    this.barcode,
    required this.servingQuantity,
  });

  factory AddDiaryEntryWithFoodRequest.fromJson(Map<String, dynamic> json) => _$AddDiaryEntryWithFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddDiaryEntryWithFoodRequestToJson(this);
}

Map<String, dynamic> serializeAddDiaryEntryWithFoodRequest(AddDiaryEntryWithFoodRequest object) => object.toJson();
