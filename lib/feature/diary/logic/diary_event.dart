import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_event.freezed.dart';

@freezed
abstract class DiaryEvent with _$DiaryEvent {
  const factory DiaryEvent.toggleMacroPercentage() = ToggleMacroPercentageEvent;
}
