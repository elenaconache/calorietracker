import 'package:calorietracker/models/collection/collection_food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_diary_entry_with_food_request.g.dart';

@JsonSerializable()
class AddDiaryEntryWithFoodRequest {
  final String entryDate;
  final String userId;
  final String unitId;
  final Meal meal;
  final double servingQuantity;
  final CollectionFood food;

  const AddDiaryEntryWithFoodRequest({
    required this.entryDate,
    required this.userId,
    required this.unitId,
    required this.meal,
    required this.servingQuantity,
    required this.food,
  });

  factory AddDiaryEntryWithFoodRequest.fromJson(Map<String, dynamic> json) => _$AddDiaryEntryWithFoodRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddDiaryEntryWithFoodRequestToJson(this);
}

Map<String, dynamic> serializeAddDiaryEntryWithFoodRequest(AddDiaryEntryWithFoodRequest object) => object.toJson();
