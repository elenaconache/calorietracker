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
      return _getTotalNutrition(allDiaryEntries);
    }
  }

  Nutrition _getTotalNutrition(List<DiaryEntryResponse> allDiaryEntries) {
    return allDiaryEntries.fold(const Nutrition(), (previousValue, element) {
      final nutritionPerServing = Nutrition.perServing(
        nutritionPer100Grams: element.food.nutritionInfo,
        servingSizeGrams: element.servingQuantity.toDouble(),
      );
      return Nutrition(
        calories: previousValue.calories + nutritionPerServing.calories,
        fat: previousValue.fat + nutritionPerServing.fat,
        fatSaturated: previousValue.fatSaturated + nutritionPerServing.fatSaturated,
        fatTrans: previousValue.fatTrans + nutritionPerServing.fatTrans,
        fatPolyunsaturated: previousValue.fatPolyunsaturated + nutritionPerServing.fatPolyunsaturated,
        fatMonounsaturated: previousValue.fatMonounsaturated + nutritionPerServing.fatMonounsaturated,
        cholesterol: previousValue.cholesterol + nutritionPerServing.cholesterol,
        carbohydrates: previousValue.carbohydrates + nutritionPerServing.carbohydrates,
        fiber: previousValue.fiber + nutritionPerServing.fiber,
        sugar: previousValue.sugar + nutritionPerServing.sugar,
        protein: previousValue.protein + nutritionPerServing.protein,
        sodium: previousValue.sodium + nutritionPerServing.sodium,
        potassium: previousValue.potassium + nutritionPerServing.potassium,
        calcium: previousValue.calcium + nutritionPerServing.calcium,
        iron: previousValue.iron + nutritionPerServing.iron,
        vitaminA: previousValue.vitaminA + nutritionPerServing.vitaminA,
        vitaminC: previousValue.vitaminC + nutritionPerServing.vitaminC,
        vitaminD: previousValue.vitaminD + nutritionPerServing.vitaminD,
      );
    });
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
      return _getTotalNutrition(diaryEntries);
    }
  }

  List<DiaryEntryResponse> getSelectedDayMealEntries({required Meal meal}) =>
      selectedDayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries.toList() ?? [];
}
