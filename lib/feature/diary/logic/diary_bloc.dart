import 'dart:async';
import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/feature/diary/domain/diary_state_extension.dart';
import 'package:calorietracker/feature/diary/logic/diary_event.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/diary_entry.dart';
import 'package:calorietracker/shared/data/model/meal.dart';
import 'package:calorietracker/shared/data/model/meal_entries_list.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/shared/data/service/database/diary_entry_service.dart';
import 'package:calorietracker/shared/data/service/database/diary_logging_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'diary_state.dart';
part 'diary_bloc.freezed.dart';

@injectable
class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final AuthRepository _authRepository;
  final DiaryEntryService _diaryEntryService;
  final DiaryLoggingService _diaryLoggingService;
  final LoggingService _loggingService;

  StreamSubscription<List<MealEntriesList>>? _diarySubscription;

  DiaryBloc(
    this._authRepository,
    this._diaryEntryService,
    this._diaryLoggingService,
    this._loggingService,
  ) : super(InitialDiaryState(selectedDay: DateTime.now(), selectedDayMealEntries: AsyncState.initial())) {
    on<DiaryEvent>(
      (event, emit) async {
        await event.when(
          toggleMacroPercentage: () => _onToggleMacroPercentage(emit),
          requestAuthSubscription: () => _onAuthSubscriptionRequested(emit),
          selectDay: (date) => _onDaySelected(date, emit),
          enterEditMode: () => _onEnterEditMode(emit),
          exitEditMode: () => _onExitEditMode(emit),
          removeSingleDiaryEntry: (localId) => _onRemoveEntry(localId),
          removeCheckedDiaryEntries: () => _onRemoveCheckedEntries(emit),
          dayCheckChanged: (bool? checked) => _onDayCheckChanged(checked, emit),
          mealCheckChanged: (bool? checked, Meal meal) => _onMealCheckChanged(checked, meal, emit),
          diaryEntryCheckChanged: (bool checked, DiaryEntry entry) => _onEntryCheckChanged(checked, entry, emit),
        );
      },
    );
  }

  FutureOr<void> _onToggleMacroPercentage(Emitter<DiaryState> emit) {
    emit(state.copyWith(macrosPercentageEnabled: !state.macrosPercentageEnabled));
  }

  Future<void> _onAuthSubscriptionRequested(Emitter<DiaryState> emit) async {
    await emit.forEach(
      _authRepository.selectedUserStream,
      onData: (user) {
        if (user == null) {
          _loggingService.info('Null user');
          return state.copyWith(selectedDayMealEntries: AsyncState.failure(GeneralFailure(message: 'Null user')));
        }
        unawaited(_subscribeToCurrentUserDiary(emit, user));
        return state;
      },
      onError: (error, stackTrace) {
        _loggingService.handle(error, stackTrace);
        return state.copyWith(selectedDayMealEntries: AsyncState.failure(GeneralFailure(message: 'Error in user stream')));
      },
    );
  }

  Future<void> _onDaySelected(DateTime date, Emitter<DiaryState> emit) async {
    emit(state.copyWith(selectedDay: date));
    await _subscribeToCurrentUserDiary(emit, _authRepository.selectedUser!);
  }

  Future<void> _subscribeToCurrentUserDiary(Emitter<DiaryState> emit, User user) async {
    emit(state.copyWith(selectedDayMealEntries: AsyncState.loading()));

    _diarySubscription?.cancel();

    _diarySubscription = _diaryEntryService
        .watchDisplayDiaryEntries(
      date: state.selectedDay.toString(),
      username: user.username,
    )
        .listen(
      (data) {
        emit(state.copyWith(selectedDayMealEntries: AsyncState.success(data)));
      },
      onError: (error, stackTrace) {
        _loggingService.handle(error, stackTrace);

        emit(state.copyWith(
          selectedDayMealEntries: AsyncState.failure(
            GeneralFailure(message: 'Error in display-ready local diary entries stream'),
          ),
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _diarySubscription?.cancel();
    return super.close();
  }

  Future<void> _onEnterEditMode(Emitter<DiaryState> emit) async {
    emit(state.copyWith(editMode: true));
  }

  Future<void> _onExitEditMode(Emitter<DiaryState> emit) async {
    emit(state.copyWith(editMode: false, checkedEntries: []));
  }

  Future<void> _onRemoveEntry(int localId) async {
    await _diaryLoggingService.markDeletedDiaryEntryLocally(localId: localId);
  }

  Future<void> _onRemoveCheckedEntries(Emitter<DiaryState> emit) async {
    final checkedEntries = state.checkedEntries;

    await _diaryLoggingService.deleteDiaryEntries(entries: checkedEntries);
    emit(state.copyWith(checkedEntries: [], editMode: false));
  }

  Future<void> _onDayCheckChanged(bool? checked, Emitter<DiaryState> emit) async {
    final List<DiaryEntry> checkedEntries;
    if (checked ?? false) {
      checkedEntries = state.dayEntries;
    } else {
      checkedEntries = [];
    }
    emit(state.copyWith(checkedEntries: checkedEntries));
  }

  Future<void> _onMealCheckChanged(bool? checked, Meal meal, Emitter<DiaryState> emit) async {
    var currentlyChecked = List<DiaryEntry>.from(state.checkedEntries);
    if (checked ?? false) {
      final newlyChecked = state.getMealEntries(meal: meal).where(
            (entry) => currentlyChecked.none((checkedEntry) => entry.localId == checkedEntry.localId),
          );
      currentlyChecked.addAll(newlyChecked);
    } else {
      final alreadyChecked = state.getMealEntries(meal: meal).where(
            (entry) => currentlyChecked.any((checkedEntry) => entry.localId == checkedEntry.localId),
          );
      currentlyChecked.removeWhere((element) => alreadyChecked.any((checkedEntry) => checkedEntry.localId == element.localId));
    }
    emit(state.copyWith(checkedEntries: currentlyChecked));
  }

  Future<void> _onEntryCheckChanged(bool checked, DiaryEntry entry, Emitter<DiaryState> emit) async {
    var currentlyChecked = List<DiaryEntry>.from(state.checkedEntries);
    if (checked) {
      currentlyChecked.add(entry);
    } else {
      currentlyChecked.removeWhere((element) => element.localId == entry.localId);
    }
    emit(state.copyWith(checkedEntries: currentlyChecked));
  }
}
