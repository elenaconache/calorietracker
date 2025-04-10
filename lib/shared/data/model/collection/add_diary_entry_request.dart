import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_diary_entry_request.g.dart';

@JsonSerializable()
class AddDiaryEntryRequest {
  final String entryDate;
  final String userId;
  final int foodUnitId;
  final int foodId;
  final double servingQuantity;
  final Meal meal;

  const AddDiaryEntryRequest({
    required this.entryDate,
    required this.userId,
    required this.foodUnitId,
    required this.foodId,
    required this.servingQuantity,
    required this.meal,
  });

  factory AddDiaryEntryRequest.fromJson(Map<String, dynamic> json) => _$AddDiaryEntryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddDiaryEntryRequestToJson(this);
}

Map<String, dynamic> serializeAddDiaryEntryRequest(AddDiaryEntryRequest object) => object.toJson();
