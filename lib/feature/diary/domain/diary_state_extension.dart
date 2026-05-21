import 'package:calorietracker/feature/diary/logic/diary_bloc.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/nutrition.dart';

extension DiaryStateExtension on DiaryState {
  List<DiaryEntry> getMealEntries({required Meal meal}) {
    return selectedDayMealEntries.data?.where((element) => element.meal == meal).expand((element) => element.diaryEntries).toList() ?? [];
  }

  bool hasMealEntries({required Meal meal}) {
    return selectedDayMealEntries.data?.where((element) => element.meal == meal).expand((element) => element.diaryEntries).isNotEmpty ?? false;
  }

  Nutrition getMealNutrition({required Meal meal}) {
    return getMealEntries(meal: meal).fold(const Nutrition(), (previousValue, element) {
      final nutritionPerServing = Nutrition.perServing(
        nutritionPer100Grams: element.food.nutrition,
        servingSizeGrams: element.servingQuantity.toDouble(),
      );
      return Nutrition(
        calories: previousValue.calories + nutritionPerServing.calories,
        fat: previousValue.fat + nutritionPerServing.fat,
        fatSaturated: previousValue.fatSaturated + nutritionPerServing.fatSaturated,
        fatTrans: previousValue.fatTrans + nutritionPerServing.fatTrans,
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

  Nutrition get selectedDayNutrition {
    final entries = selectedDayMealEntries.data;
    if (entries == null) return Nutrition();
    return entries
        .expand((element) => element.diaryEntries)
        .map((entry) => Nutrition.perServing(
              nutritionPer100Grams: entry.food.nutrition,
              servingSizeGrams: entry.servingQuantity.toDouble(),
            ))
        .fold<Nutrition>(const Nutrition(), (previousValue, element) {
      return Nutrition(
        calories: previousValue.calories + element.calories,
        fat: previousValue.fat + element.fat,
        fatSaturated: previousValue.fatSaturated + element.fatSaturated,
        fatTrans: previousValue.fatTrans + element.fatTrans,
        cholesterol: previousValue.cholesterol + element.cholesterol,
        carbohydrates: previousValue.carbohydrates + element.carbohydrates,
        fiber: previousValue.fiber + element.fiber,
        sugar: previousValue.sugar + element.sugar,
        protein: previousValue.protein + element.protein,
        sodium: previousValue.sodium + element.sodium,
        potassium: previousValue.potassium + element.potassium,
        calcium: previousValue.calcium + element.calcium,
        iron: previousValue.iron + element.iron,
        vitaminA: previousValue.vitaminA + element.vitaminA,
        vitaminC: previousValue.vitaminC + element.vitaminC,
        vitaminD: previousValue.vitaminD + element.vitaminD,
      );
    });
  }

  List<DiaryEntry> get dayEntries => selectedDayMealEntries.data?.expand((element) => element.diaryEntries).toList() ?? [];

  bool? get isDayChecked {
    if (checkedEntries.isEmpty) {
      return false;
    } else if (checkedEntries.length == dayEntries.length) {
      return true;
    } else {
      return null;
    }
  }

  bool? isMealChecked({required Meal meal}) {
    final mealEntries = getMealEntries(meal: meal);
    final mealCheckedEntriesCount = mealEntries.where((entry) => checkedEntries.any((checkedEntry) => checkedEntry.localId == entry.localId)).length;
    if (mealCheckedEntriesCount == 0) {
      return false;
    } else if (mealCheckedEntriesCount == mealEntries.length) {
      return true;
    } else {
      return null;
    }
  }

  bool isEntryChecked({required DiaryEntry entry}) => checkedEntries.any((element) => element.localId == entry.localId);
}
