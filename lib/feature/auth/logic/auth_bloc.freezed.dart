// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogIn value)? logIn,
    TResult Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult Function(_UserSelected value)? userSelected,
    TResult Function(_LogOut value)? logout,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LogIn() when logIn != null:
        return logIn(_that);
      case _AuthSubscriptionRequested() when authSubscriptionRequested != null:
        return authSubscriptionRequested(_that);
      case _UserSelected() when userSelected != null:
        return userSelected(_that);
      case _LogOut() when logout != null:
        return logout(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogIn value) logIn,
    required TResult Function(_AuthSubscriptionRequested value)
        authSubscriptionRequested,
    required TResult Function(_UserSelected value) userSelected,
    required TResult Function(_LogOut value) logout,
  }) {
    final _that = this;
    switch (_that) {
      case _LogIn():
        return logIn(_that);
      case _AuthSubscriptionRequested():
        return authSubscriptionRequested(_that);
      case _UserSelected():
        return userSelected(_that);
      case _LogOut():
        return logout(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogIn value)? logIn,
    TResult? Function(_AuthSubscriptionRequested value)?
        authSubscriptionRequested,
    TResult? Function(_UserSelected value)? userSelected,
    TResult? Function(_LogOut value)? logout,
  }) {
    final _that = this;
    switch (_that) {
      case _LogIn() when logIn != null:
        return logIn(_that);
      case _AuthSubscriptionRequested() when authSubscriptionRequested != null:
        return authSubscriptionRequested(_that);
      case _UserSelected() when userSelected != null:
        return userSelected(_that);
      case _LogOut() when logout != null:
        return logout(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username)? logIn,
    TResult Function()? authSubscriptionRequested,
    TResult Function(String username)? userSelected,
    TResult Function(String username)? logout,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LogIn() when logIn != null:
        return logIn(_that.username);
      case _AuthSubscriptionRequested() when authSubscriptionRequested != null:
        return authSubscriptionRequested();
      case _UserSelected() when userSelected != null:
        return userSelected(_that.username);
      case _LogOut() when logout != null:
        return logout(_that.username);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username) logIn,
    required TResult Function() authSubscriptionRequested,
    required TResult Function(String username) userSelected,
    required TResult Function(String username) logout,
  }) {
    final _that = this;
    switch (_that) {
      case _LogIn():
        return logIn(_that.username);
      case _AuthSubscriptionRequested():
        return authSubscriptionRequested();
      case _UserSelected():
        return userSelected(_that.username);
      case _LogOut():
        return logout(_that.username);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username)? logIn,
    TResult? Function()? authSubscriptionRequested,
    TResult? Function(String username)? userSelected,
    TResult? Function(String username)? logout,
  }) {
    final _that = this;
    switch (_that) {
      case _LogIn() when logIn != null:
        return logIn(_that.username);
      case _AuthSubscriptionRequested() when authSubscriptionRequested != null:
        return authSubscriptionRequested();
      case _UserSelected() when userSelected != null:
        return userSelected(_that.username);
      case _LogOut() when logout != null:
        return logout(_that.username);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LogIn implements AuthEvent {
  const _LogIn({required this.username});

  final String username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LogInCopyWith<_LogIn> get copyWith =>
      __$LogInCopyWithImpl<_LogIn>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LogIn &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @override
  String toString() {
    return 'AuthEvent.logIn(username: $username)';
  }
}

/// @nodoc
abstract mixin class _$LogInCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LogInCopyWith(_LogIn value, $Res Function(_LogIn) _then) =
      __$LogInCopyWithImpl;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$LogInCopyWithImpl<$Res> implements _$LogInCopyWith<$Res> {
  __$LogInCopyWithImpl(this._self, this._then);

  final _LogIn _self;
  final $Res Function(_LogIn) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
  }) {
    return _then(_LogIn(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AuthSubscriptionRequested implements AuthEvent {
  const _AuthSubscriptionRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSubscriptionRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.authSubscriptionRequested()';
  }
}

/// @nodoc

class _UserSelected implements AuthEvent {
  const _UserSelected({required this.username});

  final String username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserSelectedCopyWith<_UserSelected> get copyWith =>
      __$UserSelectedCopyWithImpl<_UserSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSelected &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @override
  String toString() {
    return 'AuthEvent.userSelected(username: $username)';
  }
}

/// @nodoc
abstract mixin class _$UserSelectedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$UserSelectedCopyWith(
          _UserSelected value, $Res Function(_UserSelected) _then) =
      __$UserSelectedCopyWithImpl;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$UserSelectedCopyWithImpl<$Res>
    implements _$UserSelectedCopyWith<$Res> {
  __$UserSelectedCopyWithImpl(this._self, this._then);

  final _UserSelected _self;
  final $Res Function(_UserSelected) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
  }) {
    return _then(_UserSelected(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LogOut implements AuthEvent {
  const _LogOut({required this.username});

  final String username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LogOutCopyWith<_LogOut> get copyWith =>
      __$LogOutCopyWithImpl<_LogOut>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LogOut &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @override
  String toString() {
    return 'AuthEvent.logout(username: $username)';
  }
}

/// @nodoc
abstract mixin class _$LogOutCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$LogOutCopyWith(_LogOut value, $Res Function(_LogOut) _then) =
      __$LogOutCopyWithImpl;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$LogOutCopyWithImpl<$Res> implements _$LogOutCopyWith<$Res> {
  __$LogOutCopyWithImpl(this._self, this._then);

  final _LogOut _self;
  final $Res Function(_LogOut) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = null,
  }) {
    return _then(_LogOut(
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AuthState {
  AsyncState<User> get selectedUser;
  AsyncState<List<User>> get users;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<AuthState> get copyWith =>
      _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthState &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser) &&
            (identical(other.users, users) || other.users == users));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedUser, users);

  @override
  String toString() {
    return 'AuthState(selectedUser: $selectedUser, users: $users)';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call({AsyncState<User> selectedUser, AsyncState<List<User>> users});

  $AsyncStateCopyWith<User, $Res> get selectedUser;
  $AsyncStateCopyWith<List<User>, $Res> get users;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUser = null,
    Object? users = null,
  }) {
    return _then(_self.copyWith(
      selectedUser: null == selectedUser
          ? _self.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as AsyncState<User>,
      users: null == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<User>>,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<User, $Res> get selectedUser {
    return $AsyncStateCopyWith<User, $Res>(_self.selectedUser, (value) {
      return _then(_self.copyWith(selectedUser: value));
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<User>, $Res> get users {
    return $AsyncStateCopyWith<List<User>, $Res>(_self.users, (value) {
      return _then(_self.copyWith(users: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            AsyncState<User> selectedUser, AsyncState<List<User>> users)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(_that.selectedUser, _that.users);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            AsyncState<User> selectedUser, AsyncState<List<User>> users)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState():
        return $default(_that.selectedUser, _that.users);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            AsyncState<User> selectedUser, AsyncState<List<User>> users)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthState() when $default != null:
        return $default(_that.selectedUser, _that.users);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthState implements AuthState {
  const _AuthState({required this.selectedUser, required this.users});

  @override
  final AsyncState<User> selectedUser;
  @override
  final AsyncState<List<User>> users;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.selectedUser, selectedUser) ||
                other.selectedUser == selectedUser) &&
            (identical(other.users, users) || other.users == users));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedUser, users);

  @override
  String toString() {
    return 'AuthState(selectedUser: $selectedUser, users: $users)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call({AsyncState<User> selectedUser, AsyncState<List<User>> users});

  @override
  $AsyncStateCopyWith<User, $Res> get selectedUser;
  @override
  $AsyncStateCopyWith<List<User>, $Res> get users;
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedUser = null,
    Object? users = null,
  }) {
    return _then(_AuthState(
      selectedUser: null == selectedUser
          ? _self.selectedUser
          : selectedUser // ignore: cast_nullable_to_non_nullable
              as AsyncState<User>,
      users: null == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<User>>,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<User, $Res> get selectedUser {
    return $AsyncStateCopyWith<User, $Res>(_self.selectedUser, (value) {
      return _then(_self.copyWith(selectedUser: value));
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<User>, $Res> get users {
    return $AsyncStateCopyWith<List<User>, $Res>(_self.users, (value) {
      return _then(_self.copyWith(users: value));
    });
  }
}

// dart format on
