import 'package:calorietracker/shared/data/model/collection/base_collection_error.dart';
import 'package:json_annotation/json_annotation.dart';

class CollectionErrorConverter
    implements JsonConverter<List<BaseCollectionError>, List<dynamic>> {
  const CollectionErrorConverter();

  @override
  List<BaseCollectionError> fromJson(List<dynamic> json) => json
      .map((e) => BaseCollectionError.fromJson(e as Map<String, dynamic>))
      .toList();

  // Unused as [BaseCollectionError]s are only parsed from API responses
  @override
  List<dynamic> toJson(List<BaseCollectionError> object) =>
      throw UnimplementedError();
}
