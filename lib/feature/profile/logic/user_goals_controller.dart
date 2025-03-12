import 'package:calorietracker/shared/di/dependency_injection.dart';
import 'package:calorietracker/shared/model/helpers/future_response.dart';
import 'package:calorietracker/shared/model/macro.dart';
import 'package:calorietracker/shared/model/macro_goals.dart';
import 'package:calorietracker/shared/model/user_goals.dart';
import 'package:calorietracker/shared/service/secure_storage_service.dart';
import 'package:calorietracker/shared/service/user_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserGoalsController {
  final ValueNotifier<FutureResponse<UserGoals>> userGoals = ValueNotifier(FutureLoading());
  UserGoals? savedUserGoals;

  late final ValueNotifier<MacroGoals> macroGoals;

  Future<void> fetchStoredUserGoals() async {
    final storageService = locator<SecureStorageService>();
    final currentUser = locator<UserService>().selectedUser.value?.username;
    if (currentUser == null) {
      userGoals.value = FutureError();
    } else {
      final storedGoals = await storageService.getList(key: usersGoalsKey, fromJson: UserGoals.fromJson);
      savedUserGoals =
          storedGoals.firstWhereOrNull((goals) => goals.username == currentUser) ?? UserGoals(username: currentUser);
      userGoals.value = FutureSuccess(data: savedUserGoals!);
      macroGoals = ValueNotifier(_calculateGoalsFromMacrosGrams().macroGoals);
    }
  }

  double? get carbsGramsGoal {
    if (userGoals.value is! FutureSuccess<UserGoals>) {
      return null;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    return goals.calories * goals.carbsPercentage / 100 / 4;
  }

  double? get proteinGramsGoal {
    if (userGoals.value is! FutureSuccess<UserGoals>) {
      return null;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    return goals.calories * goals.proteinPercentage / 100 / 4;
  }

  double? get fatGramsGoal {
    if (userGoals.value is! FutureSuccess<UserGoals>) {
      return null;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    return goals.calories * goals.fatPercentage / 100 / 9;
  }

  void onCaloriesGoalChanged({required double calories}) {
    if (userGoals.value is! FutureSuccess<UserGoals>) {
      userGoals.value = FutureError();
    } else {
      final calculatedGoals = calculateGoalsFromCalories(totalCalories: calories);
      userGoals.value = FutureSuccess(data: calculatedGoals.userGoals);
      macroGoals.value = calculatedGoals.macroGoals;
    }
  }

  void onCarbsGramsChanged({required int value}) {
    if (userGoals.value is FutureSuccess<UserGoals>) {
      final calculatedGoals = _calculateGoalsFromMacrosGrams(carb: value.toDouble());
      userGoals.value = FutureSuccess(data: calculatedGoals.userGoals);
      macroGoals.value = calculatedGoals.macroGoals;
    }
  }

  void onProteinGramsChanged({required int value}) {
    if (userGoals.value is FutureSuccess<UserGoals>) {
      final calculatedGoals = _calculateGoalsFromMacrosGrams(protein: value.toDouble());
      userGoals.value = FutureSuccess(data: calculatedGoals.userGoals);
      macroGoals.value = calculatedGoals.macroGoals;
    }
  }

  void onFatGramsChanged({required int value}) {
    if (userGoals.value is FutureSuccess<UserGoals>) {
      final calculatedGoals = _calculateGoalsFromMacrosGrams(fat: value.toDouble());
      userGoals.value = FutureSuccess(data: calculatedGoals.userGoals);
      macroGoals.value = calculatedGoals.macroGoals;
    }
  }

  ({MacroGoals macroGoals, UserGoals userGoals}) calculateGoalsFromCalories({required double totalCalories}) {
    final currentUserGoals = (userGoals.value as FutureSuccess<UserGoals>).data;
    final proteinGrams = totalCalories / 4 / 100 * currentUserGoals.proteinPercentage;
    final fatGrams = totalCalories / 9 / 100 * currentUserGoals.fatPercentage;
    final carbGrams = totalCalories / 4 / 100 * currentUserGoals.carbsPercentage;

    int roundedProteinGrams = proteinGrams.round();
    int roundedFatGrams = fatGrams.round();
    int roundedCarbsGrams = carbGrams.round();

    return (
      macroGoals: MacroGoals(
          calories: totalCalories.round(),
          roundedCarbsGrams: roundedCarbsGrams,
          roundedProteinGrams: roundedProteinGrams,
          roundedFatGrams: roundedFatGrams,
          roundedCarbsPercentage: macroGoals.value.roundedCarbsPercentage,
          roundedProteinPercentage: macroGoals.value.roundedProteinPercentage,
          roundedFatPercentage: macroGoals.value.roundedFatPercentage),
      userGoals: currentUserGoals.copyWith(calories: totalCalories)
    );
  }

  ({MacroGoals macroGoals, UserGoals userGoals}) _calculateGoalsFromMacrosGrams({
    double? protein,
    double? fat,
    double? carb,
  }) {
    final proteinGrams = protein ?? proteinGramsGoal ?? 0;
    final fatGrams = fat ?? fatGramsGoal ?? 0;
    final carbGrams = carb ?? carbsGramsGoal ?? 0;
    double totalCalories = (proteinGrams * 4) + (fatGrams * 9) + (carbGrams * 4);

    double proteinPercentage = (proteinGrams * 4 / totalCalories) * 100;
    double fatPercentage = (fatGrams * 9 / totalCalories) * 100;
    double carbPercentage = (carbGrams * 4 / totalCalories) * 100;

    int roundedProteinPercentage = proteinPercentage.round();
    int roundedFatPercentage = fatPercentage.round();
    int roundedCarbsPercentage = carbPercentage.round();

    int adjustment = 100 - (roundedProteinPercentage + roundedFatPercentage + roundedCarbsPercentage);
    if (adjustment > 0) {
      if (roundedProteinPercentage >= roundedFatPercentage && roundedProteinPercentage >= roundedCarbsPercentage) {
        roundedProteinPercentage += adjustment;
      } else if (roundedFatPercentage >= roundedProteinPercentage && roundedFatPercentage >= roundedCarbsPercentage) {
        roundedFatPercentage += adjustment;
      } else {
        roundedCarbsPercentage += adjustment;
      }
    } else if (adjustment < 0) {
      if (roundedProteinPercentage >= roundedFatPercentage && roundedProteinPercentage >= roundedCarbsPercentage) {
        roundedProteinPercentage += adjustment;
      } else if (roundedFatPercentage >= roundedProteinPercentage && roundedFatPercentage >= roundedCarbsPercentage) {
        roundedFatPercentage += adjustment;
      } else {
        roundedCarbsPercentage += adjustment;
      }
    }

    return (
      macroGoals: MacroGoals(
          calories: totalCalories.round(),
          roundedCarbsGrams: carbGrams.round(),
          roundedProteinGrams: proteinGrams.round(),
          roundedFatGrams: fatGrams.round(),
          roundedCarbsPercentage: roundedCarbsPercentage,
          roundedProteinPercentage: roundedProteinPercentage,
          roundedFatPercentage: roundedFatPercentage),
      userGoals: (userGoals.value as FutureSuccess<UserGoals>).data.copyWith(
            calories: totalCalories,
            carbsPercentage: carbPercentage,
            proteinPercentage: proteinPercentage,
            fatPercentage: fatPercentage,
          ),
    );
  }

  void onMacroPercentageChanged({required Macro macro, required int value}) {
    if (userGoals.value is! FutureSuccess<UserGoals>) {
      return;
    }
    final goals = (userGoals.value as FutureSuccess<UserGoals>).data;
    final calories = goals.calories;
    macroGoals.value = switch (macro) {
      Macro.carbohydrates => macroGoals.value.copyWith(
          roundedCarbsPercentage: value,
          roundedCarbsGrams: calories * value / 100 ~/ 4,
        ),
      Macro.protein => macroGoals.value.copyWith(
          roundedProteinPercentage: value,
          roundedProteinGrams: calories * value / 100 ~/ 4,
        ),
      Macro.fat => macroGoals.value.copyWith(
          roundedFatPercentage: value,
          roundedFatGrams: calories * value / 100 ~/ 9,
        ),
    };
  }
}
