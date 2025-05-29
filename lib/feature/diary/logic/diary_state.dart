part of 'diary_bloc.dart';

@freezed
class DiaryState with _$DiaryState {
  const factory DiaryState({
    required bool macrosPercentageEnabled,
  }) = _DiaryState;

  const factory DiaryState.initial({@Default(false) bool macrosPercentageEnabled}) = InitialDiaryState;
}
