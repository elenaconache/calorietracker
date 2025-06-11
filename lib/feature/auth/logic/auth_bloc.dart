import 'dart:async';

import 'package:calorietracker/feature/auth/data/auth_error.dart';
import 'package:calorietracker/feature/auth/domain/auth_repository.dart';
import 'package:calorietracker/shared/data/helper/async_state.dart';
import 'package:calorietracker/shared/data/helper/failure.dart';
import 'package:calorietracker/shared/data/model/user.dart';
import 'package:calorietracker/shared/data/service/diary_service.dart';
import 'package:calorietracker/shared/data/service/logging_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final LoggingService _loggingService;
  final DiaryService _diaryService;

  AuthBloc(this._authRepository, this._loggingService, this._diaryService)
      : super(AuthState(selectedUser: AsyncState.initial(), users: AsyncState.initial())) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        logIn: (username) => _logIn(username, emit),
        authSubscriptionRequested: () => _onAuthSubscriptionRequested(emit),
        userSelected: (username) => _selectUser(username, emit),
        logout: (username) => _logOut(username, emit),
      );
    });
  }

  Future<void> _logIn(String username, Emitter<AuthState> emit) async {
    emit(state.copyWith(selectedUser: AsyncState.loading()));
    try {
      await _authRepository.login(username: username);
    } catch (error) {
      final failure = AuthError.values.firstWhere((element) => error.toString().contains(element.name), orElse: () => AuthError.unknown);
      emit(state.copyWith(selectedUser: AsyncState.failure(AuthFailure(type: failure))));
      if (_authRepository.selectedUser != null) {
        emit(state.copyWith(selectedUser: AsyncState.success(_authRepository.selectedUser!)));
      }
    }
  }

  Future<void> _onAuthSubscriptionRequested(Emitter<AuthState> emit) async {
    await _fetchUsers(emit);
    await emit.forEach(
      _authRepository.selectedUserStream,
      onData: (data) {
        _diaryService.fetchDiary();
        return state.copyWith(selectedUser: data == null ? AsyncState.failure(AuthFailure()) : AsyncState.success(data));
      },
      onError: (error, stackTrace) {
        return state.copyWith(
          selectedUser: AsyncState.failure(
            AuthFailure(type: AuthError.values.firstWhere((element) => error.toString().contains(element.name), orElse: () => AuthError.unknown)),
          ),
        );
      },
    );
  }

  Future<void> _fetchUsers(Emitter<AuthState> emit) async {
    try {
      final users = await _authRepository.fetchUsers();
      emit(state.copyWith(users: AsyncState.success(users)));
    } catch (e, stackTrace) {
      _loggingService.handle(e, stackTrace);
      emit(state.copyWith(users: AsyncState.failure(Failure.generalFailure())));
    }
  }

  Future<void> _selectUser(String username, Emitter<AuthState> emit) async {
    emit(state.copyWith(selectedUser: AsyncState.loading()));
    try {
      await _authRepository.selectUser(username: username);
    } catch (error, stackTrace) {
      _loggingService.handle(error, stackTrace);
      emit(state.copyWith(selectedUser: AsyncState.failure(Failure.generalFailure())));
    }
    await _fetchUsers(emit);
  }

  Future<void> _logOut(String username, Emitter<AuthState> emit) async {
    emit(state.copyWith(selectedUser: AsyncState.loading(), users: AsyncState.loading()));
    try {
      await _authRepository.logOut(username: username);
    } catch (e, stackTrace) {
      _loggingService.handle(e, stackTrace);
      emit(state.copyWith(selectedUser: AsyncState.failure(AuthFailure())));
    }
    await _fetchUsers(emit);
  }
}
