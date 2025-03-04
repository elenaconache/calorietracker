// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_goals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGoals _$UserGoalsFromJson(Map<String, dynamic> json) => UserGoals(
      calories: (json['calories'] as num?)?.toDouble() ?? 2100,
      carbsPercentage: (json['carbsPercentage'] as num?)?.toDouble() ?? 50,
      proteinPercentage: (json['proteinPercentage'] as num?)?.toDouble() ?? 20,
      fatPercentage: (json['fatPercentage'] as num?)?.toDouble() ?? 30,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserGoalsToJson(UserGoals instance) => <String, dynamic>{
      'calories': instance.calories,
      'carbsPercentage': instance.carbsPercentage,
      'proteinPercentage': instance.proteinPercentage,
      'fatPercentage': instance.fatPercentage,
      'username': instance.username,
    };
