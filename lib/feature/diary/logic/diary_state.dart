part of 'diary_bloc.dart';

@freezed
abstract class DiaryState with _$DiaryState {
  const factory DiaryState({
    @Default(false) bool macrosPercentageEnabled,
    required DateTime selectedDay,
    required AsyncState<List<MealEntriesList>> selectedDayMealEntries,
    @Default(false) bool editMode,
    @Default([]) List<DiaryEntry> checkedEntries,
  }) = _DiaryState;

  const factory DiaryState.initial({
    @Default(false) bool macrosPercentageEnabled,
    required DateTime selectedDay,
    required AsyncState<List<MealEntriesList>> selectedDayMealEntries,
    @Default(false) bool editMode,
    @Default([]) List<DiaryEntry> checkedEntries,
  }) = InitialDiaryState;
}
