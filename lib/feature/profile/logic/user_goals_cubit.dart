import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/feature/profile/domain/goals_repository.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/macro.dart';
import 'package:calorietracker/shared/data/model/macro_goals.dart';
import 'package:calorietracker/shared/data/model/user_goals.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_goals_state.dart';
part 'user_goals_cubit.freezed.dart';

@injectable
class UserGoalsCubit extends Cubit<UserGoalsState> {
  final AuthRepository _authRepository;
  final GoalsRepository _goalsRepository;
  final LoggingService _loggingService;

  UserGoalsCubit(
    this._authRepository,
    this._goalsRepository,
    this._loggingService,
  ) : super(
          UserGoalsState(
            userGoals: AsyncState.initial(),
            macroGoals: AsyncState.initial(),
          ),
        ) {
    _fetchStoredUserGoals();
  }

  Future<void> _fetchStoredUserGoals() async {
    final currentUser = _authRepository.selectedUser?.username;
    if (currentUser == null) {
      emit(state.copyWith(userGoals: AsyncState.failure(Failure.auth())));
    } else {
      UserGoals? userGoals;
      try {
        userGoals = await _goalsRepository.fetchSavedUserGoals(username: currentUser);
        emit(state.copyWith(userGoals: AsyncState.success(userGoals)));
      } catch (e, stackTrace) {
        _loggingService.handle(e, stackTrace);
        emit(state.copyWith(userGoals: AsyncState.failure(Failure.generalFailure())));
      }

      if (userGoals != null) {
        final macroGoals = _goalsRepository.calculateMacroGoalsFromMacrosGrams(
          userGoals: userGoals,
        );
        emit(state.copyWith(
          macroGoals: AsyncState.success(macroGoals),
        ));
      }
    }
  }

  void onMacroGramsChanged({required Macro macro, required int value}) {
    final goals = state.userGoals.data;

    if (goals == null) {
      _loggingService.info('No goals found');
      return;
    }
    final calculatedGoals = _goalsRepository.calculateMacroGoalsFromMacrosGrams(
      carb: macro == Macro.carbohydrates ? value.toDouble() : null,
      protein: macro == Macro.protein ? value.toDouble() : null,
      fat: macro == Macro.fat ? value.toDouble() : null,
      userGoals: state.userGoals.data!,
    );
    emit(state.copyWith(
      macroGoals: AsyncState.success(calculatedGoals),
      userGoals: AsyncState.success(goals.copyWith()),
    ));
  }

  void onCaloriesChanged({required double calories}) {
    final userGoals = state.userGoals.data;
    final macroGoals = state.macroGoals.data;
    if (userGoals == null || macroGoals == null) {
      _loggingService.info('No goals found');
      return;
    }

    final calculatedGoals = _goalsRepository.calculateMacroGoalsFromCalories(
      currentUserGoals: userGoals,
      macroGoals: macroGoals,
      totalCalories: calories,
    );
    emit(state.copyWith(
      macroGoals: AsyncState.success(calculatedGoals),
      userGoals: AsyncState.success(userGoals.copyWith(calories: calories)),
    ));
  }

  void onMacroPercentageChanged({required Macro macro, required int value}) {
    final goals = state.userGoals.data;
    final macroGoals = state.macroGoals.data;
    if (goals == null || macroGoals == null) {
      _loggingService.info('No goals found');
      return;
    }
    emit(state.copyWith(
      macroGoals: AsyncState.success(
        _goalsRepository.updateMacroPercentage(macroGoals: macroGoals, calories: goals.calories, macro: macro, percentage: value),
      ),
    ));
  }
}
