part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logIn({required String username}) = _LogIn;
  const factory AuthEvent.authSubscriptionRequested() = _AuthSubscriptionRequested;
  const factory AuthEvent.userSelected({required String username}) = _UserSelected;
  const factory AuthEvent.logout({required String username}) = _LogOut;
}
