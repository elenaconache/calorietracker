import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/service/date_formatting_service.dart';
import 'package:flutter/material.dart';

class DiaryService {
  final ValueNotifier<Map<String, Nutrition>> dailyNutrition = ValueNotifier({});

  final DateFormattingService _dateFormattingService;

  DiaryService() : _dateFormattingService = locator<DateFormattingService>();

  Nutrition get todayNutritionalInfo {
    final todayFormatted = _dateFormattingService.format(dateTime: DateTime.now().toString());
    debugPrint('today formatted: $todayFormatted');
    return dailyNutrition.value[todayFormatted] ?? const Nutrition(carbohydrates: 0, fat: 0, protein: 0, calories: 0, sugar: 0, fiber: 0);
  }
}
