// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryState {
  bool get macrosPercentageEnabled;

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiaryStateCopyWith<DiaryState> get copyWith =>
      _$DiaryStateCopyWithImpl<DiaryState>(this as DiaryState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiaryState &&
            (identical(
                    other.macrosPercentageEnabled, macrosPercentageEnabled) ||
                other.macrosPercentageEnabled == macrosPercentageEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, macrosPercentageEnabled);

  @override
  String toString() {
    return 'DiaryState(macrosPercentageEnabled: $macrosPercentageEnabled)';
  }
}

/// @nodoc
abstract mixin class $DiaryStateCopyWith<$Res> {
  factory $DiaryStateCopyWith(
          DiaryState value, $Res Function(DiaryState) _then) =
      _$DiaryStateCopyWithImpl;
  @useResult
  $Res call({bool macrosPercentageEnabled});
}

/// @nodoc
class _$DiaryStateCopyWithImpl<$Res> implements $DiaryStateCopyWith<$Res> {
  _$DiaryStateCopyWithImpl(this._self, this._then);

  final DiaryState _self;
  final $Res Function(DiaryState) _then;

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macrosPercentageEnabled = null,
  }) {
    return _then(_self.copyWith(
      macrosPercentageEnabled: null == macrosPercentageEnabled
          ? _self.macrosPercentageEnabled
          : macrosPercentageEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [DiaryState].
extension DiaryStatePatterns on DiaryState {
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
    TResult Function(_DiaryState value)? $default, {
    TResult Function(InitialDiaryState value)? initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState() when $default != null:
        return $default(_that);
      case InitialDiaryState() when initial != null:
        return initial(_that);
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
    TResult Function(_DiaryState value) $default, {
    required TResult Function(InitialDiaryState value) initial,
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState():
        return $default(_that);
      case InitialDiaryState():
        return initial(_that);
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
    TResult? Function(_DiaryState value)? $default, {
    TResult? Function(InitialDiaryState value)? initial,
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState() when $default != null:
        return $default(_that);
      case InitialDiaryState() when initial != null:
        return initial(_that);
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
    TResult Function(bool macrosPercentageEnabled)? $default, {
    TResult Function(bool macrosPercentageEnabled)? initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState() when $default != null:
        return $default(_that.macrosPercentageEnabled);
      case InitialDiaryState() when initial != null:
        return initial(_that.macrosPercentageEnabled);
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
    TResult Function(bool macrosPercentageEnabled) $default, {
    required TResult Function(bool macrosPercentageEnabled) initial,
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState():
        return $default(_that.macrosPercentageEnabled);
      case InitialDiaryState():
        return initial(_that.macrosPercentageEnabled);
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
    TResult? Function(bool macrosPercentageEnabled)? $default, {
    TResult? Function(bool macrosPercentageEnabled)? initial,
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState() when $default != null:
        return $default(_that.macrosPercentageEnabled);
      case InitialDiaryState() when initial != null:
        return initial(_that.macrosPercentageEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DiaryState implements DiaryState {
  const _DiaryState({required this.macrosPercentageEnabled});

  @override
  final bool macrosPercentageEnabled;

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiaryStateCopyWith<_DiaryState> get copyWith =>
      __$DiaryStateCopyWithImpl<_DiaryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DiaryState &&
            (identical(
                    other.macrosPercentageEnabled, macrosPercentageEnabled) ||
                other.macrosPercentageEnabled == macrosPercentageEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, macrosPercentageEnabled);

  @override
  String toString() {
    return 'DiaryState(macrosPercentageEnabled: $macrosPercentageEnabled)';
  }
}

/// @nodoc
abstract mixin class _$DiaryStateCopyWith<$Res>
    implements $DiaryStateCopyWith<$Res> {
  factory _$DiaryStateCopyWith(
          _DiaryState value, $Res Function(_DiaryState) _then) =
      __$DiaryStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool macrosPercentageEnabled});
}

/// @nodoc
class __$DiaryStateCopyWithImpl<$Res> implements _$DiaryStateCopyWith<$Res> {
  __$DiaryStateCopyWithImpl(this._self, this._then);

  final _DiaryState _self;
  final $Res Function(_DiaryState) _then;

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? macrosPercentageEnabled = null,
  }) {
    return _then(_DiaryState(
      macrosPercentageEnabled: null == macrosPercentageEnabled
          ? _self.macrosPercentageEnabled
          : macrosPercentageEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class InitialDiaryState implements DiaryState {
  const InitialDiaryState({this.macrosPercentageEnabled = false});

  @override
  @JsonKey()
  final bool macrosPercentageEnabled;

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialDiaryStateCopyWith<InitialDiaryState> get copyWith =>
      _$InitialDiaryStateCopyWithImpl<InitialDiaryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitialDiaryState &&
            (identical(
                    other.macrosPercentageEnabled, macrosPercentageEnabled) ||
                other.macrosPercentageEnabled == macrosPercentageEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, macrosPercentageEnabled);

  @override
  String toString() {
    return 'DiaryState.initial(macrosPercentageEnabled: $macrosPercentageEnabled)';
  }
}

/// @nodoc
abstract mixin class $InitialDiaryStateCopyWith<$Res>
    implements $DiaryStateCopyWith<$Res> {
  factory $InitialDiaryStateCopyWith(
          InitialDiaryState value, $Res Function(InitialDiaryState) _then) =
      _$InitialDiaryStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool macrosPercentageEnabled});
}

/// @nodoc
class _$InitialDiaryStateCopyWithImpl<$Res>
    implements $InitialDiaryStateCopyWith<$Res> {
  _$InitialDiaryStateCopyWithImpl(this._self, this._then);

  final InitialDiaryState _self;
  final $Res Function(InitialDiaryState) _then;

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? macrosPercentageEnabled = null,
  }) {
    return _then(InitialDiaryState(
      macrosPercentageEnabled: null == macrosPercentageEnabled
          ? _self.macrosPercentageEnabled
          : macrosPercentageEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
