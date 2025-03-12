import 'package:calorietracker/shared/model/meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_local_diary_entry_request.g.dart';

@JsonSerializable()
class AddLocalDiaryEntryRequest {
  final int localId;
  final String entryDate;
  final String userId;
  final int foodUnitId;
  final double servingQuantity;
  final Meal meal;
  final int foodId;

  const AddLocalDiaryEntryRequest({
    required this.localId,
    required this.entryDate,
    required this.userId,
    required this.foodUnitId,
    required this.servingQuantity,
    required this.meal,
    required this.foodId,
  });

  factory AddLocalDiaryEntryRequest.fromJson(Map<String, dynamic> json) => _$AddLocalDiaryEntryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddLocalDiaryEntryRequestToJson(this);
}

List<Map<String, dynamic>> serializeAddLocalDiaryEntryRequestList(List<AddLocalDiaryEntryRequest> objects) =>
    objects.map((e) => e.toJson()).toList();
