import 'package:calorietracker/app/constants.dart';
import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/diary_entry.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/helpers/future_response.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/meal_entries_list.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/services/collection_api_service.dart';
import 'package:calorietracker/services/date_formatting_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class DiaryService {
  final ValueNotifier<FutureResponse<List<MealEntriesList>>> dayMealEntries = ValueNotifier(FutureResponse.loading());
  late final ValueNotifier<String> selectedDay;
  late final DateFormattingService _dateFormattingService;

  DiaryService() {
    _dateFormattingService = locator<DateFormattingService>();
    selectedDay = ValueNotifier(_dateFormattingService.format(
      dateTime: DateTime.now().toString(),
      format: collectionApiDateFormat,
    ));
  }

  Nutrition get selectedDayNutrition {
    final allDiaryEntries = dayMealEntries.value.data?.expand((mealEntries) => mealEntries.diaryEntries).toList() ?? [];
    if (allDiaryEntries.isEmpty) {
      return const Nutrition();
    } else {
      return _getTotalNutrition(allDiaryEntries);
    }
  }

  Nutrition _getTotalNutrition(List<DiaryEntry> allDiaryEntries) {
    return allDiaryEntries.fold(const Nutrition(), (previousValue, element) {
      final nutritionPerServing = Nutrition.perServing(
        nutritionPer100Grams: element.food.nutrition,
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
    final fetchedDate = _dateFormattingService.format(dateTime: (date ?? DateTime.now()).toString(), format: collectionApiDateFormat);
    selectedDay.value = fetchedDate;
    var diary = dayMealEntries.value;
    final selectedDayDiary = diary;
    dayMealEntries.value = FutureResponse.loading();
    final apiService = await locator.getAsync<CollectionApiService>();
    final userId = locator<UserService>().selectedUser.value?.id;
    if (userId?.isEmpty ?? true) {
      // TODO: navigate to login and show error snack bar
    } else {
      await apiService.getDiaryEntries(userId: userId!, date: fetchedDate).then((response) {
        //TODO: apply local changes over fetched content if not synced
        diary = FutureResponse.success(response.map((mealEntriesResponse) => mealEntriesResponse.mealEntriesList).toList());
      }).catchError((error, stackTrace) {
        locator<LoggingService>().handle(error, stackTrace);
        diary = selectedDayDiary;
      });
      dayMealEntries.value = diary;
    }
  }

  Nutrition getSelectedDayMealNutrients({required Meal meal}) {
    final diaryEntries = dayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries;
    if (diaryEntries == null) {
      return const Nutrition();
    } else {
      return _getTotalNutrition(diaryEntries);
    }
  }

  List<DiaryEntry> getSelectedDayMealEntries({required Meal meal}) =>
      dayMealEntries.value.data?.firstWhereOrNull((mealEntries) => mealEntries.meal == meal)?.diaryEntries.toList() ?? [];

  void logDiaryEntrySync({required DateTime date, required Meal meal, required Food food, required int? localId, required double servingQuantity}) {
    final formattedDate = _dateFormattingService.format(dateTime: date.toString(), format: collectionApiDateFormat);
    if (selectedDay.value == formattedDate) {
      var mealEntries = dayMealEntries.value.data?.firstWhereOrNull((entry) => entry.meal == meal) ?? MealEntriesList(meal: meal, diaryEntries: []);
      mealEntries.diaryEntries.add(DiaryEntry(
          collectionId: food.id, localId: localId, food: food, date: formattedDate, unitId: gramsUnitId, servingQuantity: servingQuantity));
      final otherMealsEntries = dayMealEntries.value.data?.where((mealEntries) => mealEntries.meal != meal) ?? [];
      var diary = dayMealEntries.value;
      diary = FutureResponse.success([...otherMealsEntries, mealEntries]);
      dayMealEntries.value = diary;
      locator<LoggingService>().info(dayMealEntries.value.toString());
    }
  }
}
