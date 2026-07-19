import 'package:calorietracker/shared/data/model/collection/add_local_data_error.dart';
import 'package:calorietracker/shared/data/model/collection/create_food_error.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_collection_error.freezed.dart';

@freezed
sealed class BaseCollectionError with _$BaseCollectionError {
  const factory BaseCollectionError.createFood(CreateFoodError error) = CreateFoodApiError;
  const factory BaseCollectionError.addLocalData(AddLocalDataError error) = AddLocalDataApiError;
  const factory BaseCollectionError.unknown(Map<String, dynamic> json) = UnknownApiError;

  factory BaseCollectionError.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('resource')) {
      return BaseCollectionError.createFood(CreateFoodError.fromJson(json));
    }

    if (json.containsKey('localId')) {
      return BaseCollectionError.addLocalData(AddLocalDataError.fromJson(json));
    }

    return BaseCollectionError.unknown(json);
  }
}
