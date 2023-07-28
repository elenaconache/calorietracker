import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/diary_entry_response.dart';
import 'package:calorietracker/models/collection/meal_entries_response.dart';
import 'package:calorietracker/models/helpers/api_response.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DiaryService {
  final ValueNotifier<ApiResponse<List<MealEntriesResponse>>> selectedDayMealEntries = ValueNotifier(ApiResponse.loading());

  final DateFormattingService _dateFormattingService;

  DiaryService() : _dateFormattingService = locator<DateFormattingService>();

  Nutrition get selectedDayNutrition {
    final allDiaryEntries = selectedDayMealEntries.value.data?.expand((mealEntries) => mealEntries.diaryEntries).toList() ?? [];
    if (allDiaryEntries.isEmpty) {
      return const Nutrition();
    } else {
      return allDiaryEntries.fold(
          const Nutrition(),
          (previousValue, element) => Nutrition(
                calories: (previousValue.calories ?? 0) + element.calories,
                fat: (previousValue.fat ?? 0) + element.fat,
                fatSaturated: (previousValue.fatSaturated ?? 0) + (element.fatSaturated ?? 0),
                fatTrans: (previousValue.fatTrans ?? 0) + (element.fatTrans ?? 0),
                fatPolyunsaturated: (previousValue.fatPolyunsaturated ?? 0) + (element.fatPolyunsaturated ?? 0),
                fatMonounsaturated: (previousValue.fatMonounsaturated ?? 0) + (element.fatMonounsaturated ?? 0),
                cholesterol: (previousValue.cholesterol ?? 0) + (element.cholesterol ?? 0),
                carbohydrates: (previousValue.carbohydrates ?? 0) + element.carbohydrates,
                fiber: (previousValue.fiber ?? 0) + (element.fiber ?? 0),
                sugar: (previousValue.sugar ?? 0) + (element.sugar ?? 0),
                protein: (previousValue.protein ?? 0) + element.protein,
                sodium: (previousValue.sodium ?? 0) + (element.sodium ?? 0),
                potassium: (previousValue.potassium ?? 0) + (element.potassium ?? 0),
                calcium: (previousValue.calcium ?? 0) + (element.calcium ?? 0),
                iron: (previousValue.iron ?? 0) + (element.iron ?? 0),
                vitaminA: (previousValue.vitaminA ?? 0) + (element.vitaminA ?? 0),
                vitaminC: (previousValue.vitaminC ?? 0) + (element.vitaminC ?? 0),
                vitaminD: (previousValue.vitaminD ?? 0) + (element.vitaminD ?? 0),
              ));
    }
  }

  Future<void> fetchDiary({DateTime? date}) async {
    selectedDayMealEntries.value = ApiResponse.loading();
    final fetchedDate = _dateFormattingService.format(dateTime: (date ?? DateTime.now()).toString(), format: collectionApiDateFormat);
    final apiService = await locator.getAsync<CollectionApiService>();
    final userId = locator<UserService>().selectedUser.value?.id;
    if (userId?.isEmpty ?? true) {
      // TODO: navigate to login and show error snack bar
    } else {
      apiService.getDiaryEntries(userId: userId!, date: fetchedDate).then((response) {
        selectedDayMealEntries.value = ApiResponse.success(response);
      }).catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        selectedDayMealEntries.value = ApiResponse.error();
      });
    }
  }

  Nutrition getSelectedDayMealNutrients({required Meal meal}) {
    final diaryEntries = selectedDayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries;
    if (diaryEntries == null) {
      return const Nutrition();
    } else {
      return diaryEntries.fold(
          const Nutrition(),
          (previousValue, element) => Nutrition(
                calories: (previousValue.calories ?? 0) + element.calories,
                fat: (previousValue.fat ?? 0) + element.fat,
                fatSaturated: (previousValue.fatSaturated ?? 0) + (element.fatSaturated ?? 0),
                fatTrans: (previousValue.fatTrans ?? 0) + (element.fatTrans ?? 0),
                fatPolyunsaturated: (previousValue.fatPolyunsaturated ?? 0) + (element.fatPolyunsaturated ?? 0),
                fatMonounsaturated: (previousValue.fatMonounsaturated ?? 0) + (element.fatMonounsaturated ?? 0),
                cholesterol: (previousValue.cholesterol ?? 0) + (element.cholesterol ?? 0),
                carbohydrates: (previousValue.carbohydrates ?? 0) + element.carbohydrates,
                fiber: (previousValue.fiber ?? 0) + (element.fiber ?? 0),
                sugar: (previousValue.sugar ?? 0) + (element.sugar ?? 0),
                protein: (previousValue.protein ?? 0) + element.protein,
                sodium: (previousValue.sodium ?? 0) + (element.sodium ?? 0),
                potassium: (previousValue.potassium ?? 0) + (element.potassium ?? 0),
                calcium: (previousValue.calcium ?? 0) + (element.calcium ?? 0),
                iron: (previousValue.iron ?? 0) + (element.iron ?? 0),
                vitaminA: (previousValue.vitaminA ?? 0) + (element.vitaminA ?? 0),
                vitaminC: (previousValue.vitaminC ?? 0) + (element.vitaminC ?? 0),
                vitaminD: (previousValue.vitaminD ?? 0) + (element.vitaminD ?? 0),
              ));
    }
  }

  List<DiaryEntryResponse> getSelectedDayMealEntries({required Meal meal}) =>
      selectedDayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries.toList() ?? [];
}
