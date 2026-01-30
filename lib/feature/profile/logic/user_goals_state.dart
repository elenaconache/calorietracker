part of 'user_goals_cubit.dart';

@freezed 
class UserGoalsState with _$UserGoalsState {
  const factory UserGoalsState({
    required AsyncState<UserGoals> userGoals,
    required AsyncState<MacroGoals> macroGoals,
  }) = _UserGoalsState;
}
