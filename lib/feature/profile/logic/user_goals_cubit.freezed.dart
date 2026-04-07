// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_goals_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserGoalsState {
  AsyncState<UserGoals> get userGoals;
  AsyncState<MacroGoals> get macroGoals;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserGoalsStateCopyWith<UserGoalsState> get copyWith =>
      _$UserGoalsStateCopyWithImpl<UserGoalsState>(
          this as UserGoalsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserGoalsState &&
            (identical(other.userGoals, userGoals) ||
                other.userGoals == userGoals) &&
            (identical(other.macroGoals, macroGoals) ||
                other.macroGoals == macroGoals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userGoals, macroGoals);

  @override
  String toString() {
    return 'UserGoalsState(userGoals: $userGoals, macroGoals: $macroGoals)';
  }
}

/// @nodoc
abstract mixin class $UserGoalsStateCopyWith<$Res> {
  factory $UserGoalsStateCopyWith(
          UserGoalsState value, $Res Function(UserGoalsState) _then) =
      _$UserGoalsStateCopyWithImpl;
  @useResult
  $Res call(
      {AsyncState<UserGoals> userGoals, AsyncState<MacroGoals> macroGoals});

  $AsyncStateCopyWith<UserGoals, $Res> get userGoals;
  $AsyncStateCopyWith<MacroGoals, $Res> get macroGoals;
}

/// @nodoc
class _$UserGoalsStateCopyWithImpl<$Res>
    implements $UserGoalsStateCopyWith<$Res> {
  _$UserGoalsStateCopyWithImpl(this._self, this._then);

  final UserGoalsState _self;
  final $Res Function(UserGoalsState) _then;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userGoals = null,
    Object? macroGoals = null,
  }) {
    return _then(_self.copyWith(
      userGoals: null == userGoals
          ? _self.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<UserGoals>,
      macroGoals: null == macroGoals
          ? _self.macroGoals
          : macroGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<MacroGoals>,
    ));
  }

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<UserGoals, $Res> get userGoals {
    return $AsyncStateCopyWith<UserGoals, $Res>(_self.userGoals, (value) {
      return _then(_self.copyWith(userGoals: value));
    });
  }

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<MacroGoals, $Res> get macroGoals {
    return $AsyncStateCopyWith<MacroGoals, $Res>(_self.macroGoals, (value) {
      return _then(_self.copyWith(macroGoals: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserGoalsState].
extension UserGoalsStatePatterns on UserGoalsState {
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
    TResult Function(_UserGoalsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserGoalsState() when $default != null:
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
    TResult Function(_UserGoalsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserGoalsState():
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
    TResult? Function(_UserGoalsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserGoalsState() when $default != null:
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
            AsyncState<UserGoals> userGoals, AsyncState<MacroGoals> macroGoals)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserGoalsState() when $default != null:
        return $default(_that.userGoals, _that.macroGoals);
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
            AsyncState<UserGoals> userGoals, AsyncState<MacroGoals> macroGoals)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserGoalsState():
        return $default(_that.userGoals, _that.macroGoals);
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
            AsyncState<UserGoals> userGoals, AsyncState<MacroGoals> macroGoals)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserGoalsState() when $default != null:
        return $default(_that.userGoals, _that.macroGoals);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserGoalsState implements UserGoalsState {
  const _UserGoalsState({required this.userGoals, required this.macroGoals});

  @override
  final AsyncState<UserGoals> userGoals;
  @override
  final AsyncState<MacroGoals> macroGoals;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserGoalsStateCopyWith<_UserGoalsState> get copyWith =>
      __$UserGoalsStateCopyWithImpl<_UserGoalsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserGoalsState &&
            (identical(other.userGoals, userGoals) ||
                other.userGoals == userGoals) &&
            (identical(other.macroGoals, macroGoals) ||
                other.macroGoals == macroGoals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userGoals, macroGoals);

  @override
  String toString() {
    return 'UserGoalsState(userGoals: $userGoals, macroGoals: $macroGoals)';
  }
}

/// @nodoc
abstract mixin class _$UserGoalsStateCopyWith<$Res>
    implements $UserGoalsStateCopyWith<$Res> {
  factory _$UserGoalsStateCopyWith(
          _UserGoalsState value, $Res Function(_UserGoalsState) _then) =
      __$UserGoalsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AsyncState<UserGoals> userGoals, AsyncState<MacroGoals> macroGoals});

  @override
  $AsyncStateCopyWith<UserGoals, $Res> get userGoals;
  @override
  $AsyncStateCopyWith<MacroGoals, $Res> get macroGoals;
}

/// @nodoc
class __$UserGoalsStateCopyWithImpl<$Res>
    implements _$UserGoalsStateCopyWith<$Res> {
  __$UserGoalsStateCopyWithImpl(this._self, this._then);

  final _UserGoalsState _self;
  final $Res Function(_UserGoalsState) _then;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userGoals = null,
    Object? macroGoals = null,
  }) {
    return _then(_UserGoalsState(
      userGoals: null == userGoals
          ? _self.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<UserGoals>,
      macroGoals: null == macroGoals
          ? _self.macroGoals
          : macroGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<MacroGoals>,
    ));
  }

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<UserGoals, $Res> get userGoals {
    return $AsyncStateCopyWith<UserGoals, $Res>(_self.userGoals, (value) {
      return _then(_self.copyWith(userGoals: value));
    });
  }

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<MacroGoals, $Res> get macroGoals {
    return $AsyncStateCopyWith<MacroGoals, $Res>(_self.macroGoals, (value) {
      return _then(_self.copyWith(macroGoals: value));
    });
  }
}

// dart format on
