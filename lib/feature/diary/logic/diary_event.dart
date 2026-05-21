import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_event.freezed.dart';

@freezed
abstract class DiaryEvent with _$DiaryEvent {
  const factory DiaryEvent.toggleMacroPercentage() = ToggleMacroPercentageEvent;
  const factory DiaryEvent.requestAuthSubscription() = RequestAuthSubscriptionEvent;
  const factory DiaryEvent.selectDay({required DateTime date}) = SelectDayEvent;
  const factory DiaryEvent.enterEditMode() = EnterEditModeEvent;
  const factory DiaryEvent.exitEditMode() = ExitEditModeEvent;
  const factory DiaryEvent.removeSingleDiaryEntry({required int localId}) = RemoveEntryEvent;
  const factory DiaryEvent.removeCheckedDiaryEntries() = RemoveCheckedEntriesEvent;
  const factory DiaryEvent.dayCheckChanged({required bool? checked}) = DayCheckChanged;
  const factory DiaryEvent.mealCheckChanged({required bool? checked, required Meal meal}) = MealCheckChanged;
  const factory DiaryEvent.diaryEntryCheckChanged({required bool checked, required DiaryEntry entry}) = EntryCheckChanged;
}
