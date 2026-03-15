import 'package:calorietracker/shared/data/model/usda/usda_food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usda_search_response.g.dart';

@JsonSerializable()
class UsdaSearchResponse {
  final int totalHits;
  final int currentPage;
  final int totalPages;
  final List<UsdaFood> foods;

  const UsdaSearchResponse({
    required this.totalHits,
    required this.currentPage,
    required this.totalPages,
    required this.foods,
  });

  factory UsdaSearchResponse.fromJson(Map<String, dynamic> json) => _$UsdaSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsdaSearchResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

UsdaSearchResponse deserializeUsdaSearchResponse(Map<String, dynamic> json) => UsdaSearchResponse.fromJson(json);
