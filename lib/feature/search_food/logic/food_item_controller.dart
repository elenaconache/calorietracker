import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/model/food.dart';
import 'package:calorietracker/shared/model/meal.dart';
import 'package:calorietracker/shared/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/service/diary_service.dart';
import 'package:calorietracker/shared/service/logging_service.dart';
import 'package:calorietracker/shared/service/user_service.dart';
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
