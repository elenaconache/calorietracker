part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AsyncState<User> selectedUser,
    required AsyncState<List<User>> users,
  }) = _AuthState;
}
