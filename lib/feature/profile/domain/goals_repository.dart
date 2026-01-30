import 'package:calorietracker/shared/data/model/macro.dart';
import 'package:calorietracker/shared/data/model/macro_goals.dart';
import 'package:calorietracker/shared/data/model/user_goals.dart';
import 'package:calorietracker/shared/data/service/secure_storage_service.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoalsRepository {
  final SecureStorageService _secureStorageService;

  GoalsRepository(this._secureStorageService);

  Future<UserGoals> fetchSavedUserGoals({required String username}) async {
    final allUsersGoals = await _secureStorageService.getList(
      key: usersGoalsKey,
      fromJson: UserGoals.fromJson,
    );

    return allUsersGoals.firstWhereOrNull(
          (goals) => goals.username == username,
        ) ??
        UserGoals(username: username);
  }

  MacroGoals calculateMacroGoalsFromMacrosGrams({
    required UserGoals userGoals,
    double? protein,
    double? fat,
    double? carb,
  }) {
    final goals = _calculateUserGoalsFromMacrosGrams(userGoals: userGoals, protein: protein, fat: fat, carb: carb);

    int roundedProteinPercentage = goals.proteinPercentage.round();
    int roundedFatPercentage = goals.fatPercentage.round();
    int roundedCarbsPercentage = goals.carbsPercentage.round();

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

    return MacroGoals(
        calories: goals.calories.round(),
        roundedCarbsGrams: goals.carbsGramsGoal.round(),
        roundedProteinGrams: goals.proteinGramsGoal.round(),
        roundedFatGrams: goals.fatGramsGoal.round(),
        roundedCarbsPercentage: roundedCarbsPercentage,
        roundedProteinPercentage: roundedProteinPercentage,
        roundedFatPercentage: roundedFatPercentage);
  }

  UserGoals _calculateUserGoalsFromMacrosGrams({
    required UserGoals userGoals,
    double? protein,
    double? fat,
    double? carb,
  }) {
    final proteinGrams = protein ?? userGoals.proteinGramsGoal;
    final fatGrams = fat ?? userGoals.fatGramsGoal;
    final carbGrams = carb ?? userGoals.carbsGramsGoal;
    final totalCalories = (proteinGrams * 4) + (fatGrams * 9) + (carbGrams * 4);

    final proteinPercentage = (proteinGrams * 4 / totalCalories) * 100;
    final fatPercentage = (fatGrams * 9 / totalCalories) * 100;
    final carbPercentage = (carbGrams * 4 / totalCalories) * 100;

    return userGoals.copyWith(
      calories: totalCalories,
      carbsPercentage: carbPercentage,
      proteinPercentage: proteinPercentage,
      fatPercentage: fatPercentage,
    );
  }

  MacroGoals calculateMacroGoalsFromCalories({
    required UserGoals currentUserGoals,
    required MacroGoals macroGoals,
    required double totalCalories,
  }) {
    final proteinGrams = totalCalories / 4 / 100 * currentUserGoals.proteinPercentage;
    final fatGrams = totalCalories / 9 / 100 * currentUserGoals.fatPercentage;
    final carbGrams = totalCalories / 4 / 100 * currentUserGoals.carbsPercentage;

    int roundedProteinGrams = proteinGrams.round();
    int roundedFatGrams = fatGrams.round();
    int roundedCarbsGrams = carbGrams.round();

    return MacroGoals(
        calories: totalCalories.round(),
        roundedCarbsGrams: roundedCarbsGrams,
        roundedProteinGrams: roundedProteinGrams,
        roundedFatGrams: roundedFatGrams,
        roundedCarbsPercentage: macroGoals.roundedCarbsPercentage,
        roundedProteinPercentage: macroGoals.roundedProteinPercentage,
        roundedFatPercentage: macroGoals.roundedFatPercentage);
  }

  MacroGoals updateMacroPercentage({
    required MacroGoals macroGoals,
    required double calories,
    required Macro macro,
    required int percentage,
  }) {
    return switch (macro) {
      Macro.carbohydrates => macroGoals.copyWith(
          roundedCarbsPercentage: percentage,
          roundedCarbsGrams: calories * percentage / 100 ~/ 4,
        ),
      Macro.protein => macroGoals.copyWith(
          roundedProteinPercentage: percentage,
          roundedProteinGrams: calories * percentage / 100 ~/ 4,
        ),
      Macro.fat => macroGoals.copyWith(
          roundedFatPercentage: percentage,
          roundedFatGrams: calories * percentage / 100 ~/ 9,
        ),
    };
  }
}
