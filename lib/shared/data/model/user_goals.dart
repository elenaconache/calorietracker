import 'package:json_annotation/json_annotation.dart';

part 'user_goals.g.dart';

@JsonSerializable()
class UserGoals {
  final double calories;
  final double carbsPercentage;
  final double proteinPercentage;
  final double fatPercentage;
  final String username;

  const UserGoals({
    this.calories = 2100,
    this.carbsPercentage = 50,
    this.proteinPercentage = 20,
    this.fatPercentage = 30,
    required this.username,
  });

  factory UserGoals.fromJson(Map<String, dynamic> json) => _$UserGoalsFromJson(json);

  Map<String, dynamic> toJson() => _$UserGoalsToJson(this);

  UserGoals copyWith({
    double? calories,
    double? carbsPercentage,
    double? proteinPercentage,
    double? fatPercentage,
    String? username,
  }) =>
      UserGoals(
        calories: calories ?? this.calories,
        username: username ?? this.username,
        carbsPercentage: carbsPercentage ?? this.carbsPercentage,
        fatPercentage: fatPercentage ?? this.fatPercentage,
        proteinPercentage: proteinPercentage ?? this.proteinPercentage,
      );
}
