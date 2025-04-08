import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/feature/add_food/data/food_log.dart';
import 'package:calorietracker/shared/data/model/food.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:calorietracker/shared/data/service/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
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
    final date = DateTime.tryParse(getIt<DiaryService>().selectedDay.value);
    final bool added;
    if (date == null) {
      added = false;
      getIt<LoggingService>().info('Could not log food. No selected diary date.');
    } else {
      final username = getIt<UserService>().selectedUser.value?.username;
      if (username == null) {
        added = false;
        getIt<LoggingService>().info('Could not log food. Missing username.');
        // TODO: navigate to login screen and show a snack bar saying the session expired
      } else {
        final results = await Future.wait([
          getIt<DiaryLoggingService>()
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
