import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_food.freezed.dart';

@freezed
abstract class CreatedFood with _$CreatedFood {
  const factory CreatedFood({
    int? localId,
    int? createdFoodId,
  }) = _CreatedFood;
}
