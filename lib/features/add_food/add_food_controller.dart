import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/models/collection/add_diary_entry_with_food_request.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/models/nutrition.dart';
import 'package:calorietracker/service/collection_api_service.dart';
import 'package:flutter/cupertino.dart';

class AddFoodController {
  final ValueNotifier<Meal?> selectedMeal = ValueNotifier(null);
  late final ValueNotifier<Nutrition?> currentServingSizeNutrients;
  late final Nutrition _nutrition;

  void selectMeal({required Meal? meal}) => selectedMeal.value = meal;

  void initializeNutrients({required Nutrition nutrition}) {
    _nutrition = nutrition;
    currentServingSizeNutrients = ValueNotifier(nutrition);
  }

  int get calories => currentServingSizeNutrients.value?.calories?.toInt() ?? 0;

  double get carbsInGrams => currentServingSizeNutrients.value?.carbohydrates ?? 0;

  double get fatInGrams => currentServingSizeNutrients.value?.fat ?? 0;

  double get proteinInGrams => currentServingSizeNutrients.value?.protein ?? 0;

  double get _totalMacros => (_nutrition.carbohydrates ?? 0) * 4 + (_nutrition.protein ?? 0) * 4 + (_nutrition.fat ?? 0) * 9;

  int get carbsPercentage => ((_nutrition.carbohydrates ?? 0) * 4 / _totalMacros * 100).toInt();

  int get fatPercentage => ((_nutrition.fat ?? 0) * 9 / _totalMacros * 100).toInt();

  int get proteinPercentage => ((_nutrition.protein ?? 0) * 4 / _totalMacros * 100).toInt();

  void recalculateNutrition({required String servingSizeGrams}) {
    final serving = int.tryParse(servingSizeGrams) ?? 100;
    currentServingSizeNutrients.value = Nutrition.perServing(nutritionPer100Grams: _nutrition, servingSizeGrams: serving);
  }

  //TODO: send data to log as parameters
  // TODO: constants for now for unit id and user id
  // TODO: if the user is logging a food from the collection tab, call the API to log diary entry without adding a food and pass the food id
  Future<void> logFood() async {
    final collectionApiService = await locator.getAsync<CollectionApiService>();
    await collectionApiService
        .createDiaryEntryWithFood(
            body: AddDiaryEntryWithFoodRequest(
                entryDate: DateTime.now().toString(), userId: '', unitId: '', meal: Meal.breakfast, name: '', nutritionInfo: const Nutrition()))
        .then((value) => debugPrint('success'))
        .catchError((error, stackTrace) {
      debugPrint('error: $error, $stackTrace');
    });
  }
}
