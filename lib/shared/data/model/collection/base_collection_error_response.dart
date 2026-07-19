import 'package:calorietracker/shared/data/model/collection/base_collection_error.dart';
import 'package:calorietracker/shared/data/model/collection/collection_error_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_collection_error_response.freezed.dart';
part 'base_collection_error_response.g.dart';

@freezed
sealed class BaseCollectionErrorResponse with _$BaseCollectionErrorResponse {
  const BaseCollectionErrorResponse._();

  const factory BaseCollectionErrorResponse({
    @CollectionErrorConverter() required List<BaseCollectionError> errors,
  }) = _BaseCollectionErrorResponse;

  factory BaseCollectionErrorResponse.fromJson(Map<String, dynamic> json) => _$BaseCollectionErrorResponseFromJson(json);
}
