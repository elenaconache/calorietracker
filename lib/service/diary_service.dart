import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/meal_entries_response.dart';
import 'package:calorietracker/models/helpers/api_response.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/service/collection_api_service.dart';
import 'package:calorietracker/service/date_formatting_service.dart';
import 'package:calorietracker/service/logging_service.dart';
import 'package:flutter/material.dart';

class DiaryService {
  final ValueNotifier<ApiResponse<List<MealEntriesResponse>>> todayMealEntries = ValueNotifier(ApiResponse.loading());

  // TODO: methods to calculate calories, macros and the other nutrients for the day

  final DateFormattingService _dateFormattingService;

  DiaryService() : _dateFormattingService = locator<DateFormattingService>();

  Nutrition get todayNutritionalInfo {
    return const Nutrition(); // TODO: use the value notifier above
  }

  Future<void> fetchDiary({DateTime? date}) async {
    final fetchedDate = _dateFormattingService.format(dateTime: (date ?? DateTime.now()).toString(), format: collectionApiDateFormat);
    final apiService = await locator.getAsync<CollectionApiService>();
    apiService.getDiaryEntries(userId: testUserId, date: fetchedDate).then((response) {
      todayMealEntries.value = ApiResponse.success(response);
    }).catchError((error, stackTrace) {
      locator<LoggingService>().handle(error, stackTrace);
      todayMealEntries.value = ApiResponse.error();
    });
  }
}
