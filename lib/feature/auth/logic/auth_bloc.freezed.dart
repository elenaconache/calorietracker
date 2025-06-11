// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() authSubscriptionRequested,
    required TResult Function(String username) userSelected,
    required TResult Function(String username) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? authSubscriptionRequested,
    TResult? Function(String username)? userSelected,
    TResult? Function(String username)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? authSubscriptionRequested,
    TResult Function(String username)? userSelected,
    TResult Function(String username)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_AuthSubscriptionRequested value)
        authSubscriptionRequested,
    required TResult Function(_UserSelected value) userSelected,
    required TResult Function(_LogOut value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult? Function(_UserSelected value)? userSelected,
    TResult? Function(_LogOut value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult Function(_UserSelected value)? userSelected,
    TResult Function(_LogOut value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LogInImplCopyWith<$Res> {
  factory _$$LogInImplCopyWith(
          _$LogInImpl value, $Res Function(_$LogInImpl) then) =
      __$$LogInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$LogInImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogInImpl>
    implements _$$LogInImplCopyWith<$Res> {
  __$$LogInImplCopyWithImpl(
      _$LogInImpl _value, $Res Function(_$LogInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$LogInImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogInImpl implements _LogIn {
  const _$LogInImpl({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'AuthEvent.logIn(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInImplCopyWith<_$LogInImpl> get copyWith =>
      __$$LogInImplCopyWithImpl<_$LogInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() authSubscriptionRequested,
    required TResult Function(String username) userSelected,
    required TResult Function(String username) logout,
  }) {
    return logIn(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? authSubscriptionRequested,
    TResult? Function(String username)? userSelected,
    TResult? Function(String username)? logout,
  }) {
    return logIn?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? authSubscriptionRequested,
    TResult Function(String username)? userSelected,
    TResult Function(String username)? logout,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_AuthSubscriptionRequested value)
        authSubscriptionRequested,
    required TResult Function(_UserSelected value) userSelected,
    required TResult Function(_LogOut value) logout,
  }) {
    return logIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult? Function(_UserSelected value)? userSelected,
    TResult? Function(_LogOut value)? logout,
  }) {
    return logIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult Function(_UserSelected value)? userSelected,
    TResult Function(_LogOut value)? logout,
    required TResult orElse(),
  }) {
    if (logIn != null) {
      return logIn(this);
    }
    return orElse();
  }
}

abstract class _LogIn implements AuthEvent {
  const factory _LogIn({required final String username}) = _$LogInImpl;

  String get username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogInImplCopyWith<_$LogInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSubscriptionRequestedImplCopyWith<$Res> {
  factory _$$AuthSubscriptionRequestedImplCopyWith(
          _$AuthSubscriptionRequestedImpl value,
          $Res Function(_$AuthSubscriptionRequestedImpl) then) =
      __$$AuthSubscriptionRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSubscriptionRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSubscriptionRequestedImpl>
    implements _$$AuthSubscriptionRequestedImplCopyWith<$Res> {
  __$$AuthSubscriptionRequestedImplCopyWithImpl(
      _$AuthSubscriptionRequestedImpl _value,
      $Res Function(_$AuthSubscriptionRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthSubscriptionRequestedImpl implements _AuthSubscriptionRequested {
  const _$AuthSubscriptionRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.authSubscriptionRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSubscriptionRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() authSubscriptionRequested,
    required TResult Function(String username) userSelected,
    required TResult Function(String username) logout,
  }) {
    return authSubscriptionRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? authSubscriptionRequested,
    TResult? Function(String username)? userSelected,
    TResult? Function(String username)? logout,
  }) {
    return authSubscriptionRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? authSubscriptionRequested,
    TResult Function(String username)? userSelected,
    TResult Function(String username)? logout,
    required TResult orElse(),
  }) {
    if (authSubscriptionRequested != null) {
      return authSubscriptionRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_AuthSubscriptionRequested value)
        authSubscriptionRequested,
    required TResult Function(_UserSelected value) userSelected,
    required TResult Function(_LogOut value) logout,
  }) {
    return authSubscriptionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult? Function(_UserSelected value)? userSelected,
    TResult? Function(_LogOut value)? logout,
  }) {
    return authSubscriptionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult Function(_UserSelected value)? userSelected,
    TResult Function(_LogOut value)? logout,
    required TResult orElse(),
  }) {
    if (authSubscriptionRequested != null) {
      return authSubscriptionRequested(this);
    }
    return orElse();
  }
}

abstract class _AuthSubscriptionRequested implements AuthEvent {
  const factory _AuthSubscriptionRequested() = _$AuthSubscriptionRequestedImpl;
}

/// @nodoc
abstract class _$$UserSelectedImplCopyWith<$Res> {
  factory _$$UserSelectedImplCopyWith(
          _$UserSelectedImpl value, $Res Function(_$UserSelectedImpl) then) =
      __$$UserSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$UserSelectedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UserSelectedImpl>
    implements _$$UserSelectedImplCopyWith<$Res> {
  __$$UserSelectedImplCopyWithImpl(
      _$UserSelectedImpl _value, $Res Function(_$UserSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$UserSelectedImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserSelectedImpl implements _UserSelected {
  const _$UserSelectedImpl({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'AuthEvent.userSelected(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSelectedImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSelectedImplCopyWith<_$UserSelectedImpl> get copyWith =>
      __$$UserSelectedImplCopyWithImpl<_$UserSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() authSubscriptionRequested,
    required TResult Function(String username) userSelected,
    required TResult Function(String username) logout,
  }) {
    return userSelected(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? authSubscriptionRequested,
    TResult? Function(String username)? userSelected,
    TResult? Function(String username)? logout,
  }) {
    return userSelected?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? authSubscriptionRequested,
    TResult Function(String username)? userSelected,
    TResult Function(String username)? logout,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_AuthSubscriptionRequested value)
        authSubscriptionRequested,
    required TResult Function(_UserSelected value) userSelected,
    required TResult Function(_LogOut value) logout,
  }) {
    return userSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult? Function(_UserSelected value)? userSelected,
    TResult? Function(_LogOut value)? logout,
  }) {
    return userSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult Function(_UserSelected value)? userSelected,
    TResult Function(_LogOut value)? logout,
    required TResult orElse(),
  }) {
    if (userSelected != null) {
      return userSelected(this);
    }
    return orElse();
  }
}

abstract class _UserSelected implements AuthEvent {
  const factory _UserSelected({required final String username}) =
      _$UserSelectedImpl;

  String get username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSelectedImplCopyWith<_$UserSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogOutImplCopyWith<$Res> {
  factory _$$LogOutImplCopyWith(
          _$LogOutImpl value, $Res Function(_$LogOutImpl) then) =
      __$$LogOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$LogOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogOutImpl>
    implements _$$LogOutImplCopyWith<$Res> {
  __$$LogOutImplCopyWithImpl(
      _$LogOutImpl _value, $Res Function(_$LogOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$LogOutImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogOutImpl implements _LogOut {
  const _$LogOutImpl({required this.username});

  @override
  final String username;

  @override
  String toString() {
    return 'AuthEvent.logout(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogOutImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogOutImplCopyWith<_$LogOutImpl> get copyWith =>
      __$$LogOutImplCopyWithImpl<_$LogOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() authSubscriptionRequested,
    required TResult Function(String username) userSelected,
    required TResult Function(String username) logout,
  }) {
    return logout(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? authSubscriptionRequested,
    TResult? Function(String username)? userSelected,
    TResult? Function(String username)? logout,
  }) {
    return logout?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? authSubscriptionRequested,
    TResult Function(String username)? userSelected,
    TResult Function(String username)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_AuthSubscriptionRequested value)
        authSubscriptionRequested,
    required TResult Function(_UserSelected value) userSelected,
    required TResult Function(_LogOut value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult? Function(_UserSelected value)? userSelected,
    TResult? Function(_LogOut value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult Function(_UserSelected value)? userSelected,
    TResult Function(_LogOut value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements AuthEvent {
  const factory _LogOut({required final String username}) = _$LogOutImpl;

  String get username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogOutImplCopyWith<_$LogOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  AsyncState<User> get selectedUser => throw _privateConstructorUsedError;
  AsyncState<List<User>> get users => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AsyncState<User> selectedUser, AsyncState<List<User>> users});

  $AsyncStateCopyWith<User, $Res> get selectedUser;
  $AsyncStateCopyWith<List<User>, $Res> get users;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUser = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      selectedUser: null == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as AsyncState<User>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<User>>,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<User, $Res> get selectedUser {
    return $AsyncStateCopyWith<User, $Res>(_value.selectedUser, (value) {
      return _then(_value.copyWith(selectedUser: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<User>, $Res> get users {
    return $AsyncStateCopyWith<List<User>, $Res>(_value.users, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncState<User> selectedUser, AsyncState<List<User>> users});

  @override
  $AsyncStateCopyWith<User, $Res> get selectedUser;
  @override
  $AsyncStateCopyWith<List<User>, $Res> get users;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUser = null,
    Object? users = null,
  }) {
    return _then(_$AuthStateImpl(
      selectedUser: null == selectedUser
          ? _value.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as AsyncState<User>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<User>>,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({required this.selectedUser, required this.users});

  @override
  final AsyncState<User> selectedUser;
  @override
  final AsyncState<List<User>> users;

  @override
  String toString() {
    return 'AuthState(selectedUser: $selectedUser, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser) &&
            (identical(other.users, users) || other.users == users));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedUser, users);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final AsyncState<User> selectedUser,
      required final AsyncState<List<User>> users}) = _$AuthStateImpl;

  @override
  AsyncState<User> get selectedUser;
  @override
  AsyncState<List<User>> get users;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
