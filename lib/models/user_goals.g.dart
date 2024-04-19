// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_goals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGoals _$UserGoalsFromJson(Map<String, dynamic> json) => UserGoals(
      calories: json['calories'] as int? ?? 2100,
      carbsPercentage: json['carbsPercentage'] as int? ?? 50,
      proteinPercentage: json['proteinPercentage'] as int? ?? 20,
      fatPercentage: json['fatPercentage'] as int? ?? 30,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserGoalsToJson(UserGoals instance) => <String, dynamic>{
      'calories': instance.calories,
      'carbsPercentage': instance.carbsPercentage,
      'proteinPercentage': instance.proteinPercentage,
      'fatPercentage': instance.fatPercentage,
      'username': instance.username,
    };
