import 'package:calorietracker/app/dependency_injection.dart';
import 'package:calorietracker/features/add_food/food_log.dart';
import 'package:calorietracker/models/food.dart';
import 'package:calorietracker/models/meal.dart';
import 'package:calorietracker/services/database/diary_logging_service.dart';
import 'package:calorietracker/services/diary_service.dart';
import 'package:calorietracker/services/logging_service.dart';
import 'package:calorietracker/services/user_service.dart';
import 'package:flutter/cupertino.dart';

class FoodItemController {
  final ValueNotifier<bool> isLoggingLoading = ValueNotifier(false);

  Future<bool> logFood({
    int? remoteFoodId,
    int? localFoodId,
    required Meal meal,
    required Food food,
    required double servingQuantity,
  }) async {
    isLoggingLoading.value = true;
    final date = DateTime.tryParse(locator<DiaryService>().selectedDay.value);
    final bool added;
    if (date == null) {
      added = false;
      locator<LoggingService>().info('Could not log food. No selected diary date.');
    } else {
      final username = locator<UserService>().selectedUser.value?.username;
      if (username == null) {
        added = false;
        locator<LoggingService>().info('Could not log food. Missing username.');
        // TODO: navigate to login screen and show a snack bar saying the session expired
      } else {
        final results = await Future.wait([
          locator<DiaryLoggingService>()
              .createDiaryEntry(
                remoteFoodId: remoteFoodId,
                username: username,
                foodLog: FoodLog(
                  meal: meal,
                  food: food,
                  servingQuantity: servingQuantity,
                  localFoodId: localFoodId,
                  date: date,
                ),
                localFoodId: localFoodId,
              )
              .then((_) => true)
              .catchError((_, __) => false),
          Future.delayed(const Duration(milliseconds: 500))
        ]);
        added = results.firstOrNull ?? false;
      }
    }
    isLoggingLoading.value = false;
    return added;
  }
}
