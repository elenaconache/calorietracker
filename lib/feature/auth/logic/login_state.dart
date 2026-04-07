part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool loading,
    @Default(false) bool enabled,
  }) = _LoginState;
}
