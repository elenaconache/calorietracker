import 'package:json_annotation/json_annotation.dart';

class IntListConverter implements JsonConverter<List<int>, List<dynamic>> {
  const IntListConverter();

  @override
  List<int> fromJson(List<dynamic> json) => json.cast<int>();

  @override
  List<dynamic> toJson(List<int> object) => object;
}