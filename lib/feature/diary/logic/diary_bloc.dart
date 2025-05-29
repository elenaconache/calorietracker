import 'dart:async';

import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'diary_state.dart';
part 'diary_bloc.freezed.dart';

@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(InitialDiaryState()) {
    on<ToggleMacroPercentageEvent>(_onToggleMacroPercentage);
  }

  FutureOr<void> _onToggleMacroPercentage(ToggleMacroPercentageEvent event, Emitter<DiaryState> emit) {
    emit(state.copyWith(macrosPercentageEnabled: !state.macrosPercentageEnabled));
  }
}
