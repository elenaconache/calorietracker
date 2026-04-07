// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AsyncState<T> {
  AsyncStatus get status;
  T? get data;
  Failure? get failure;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<T, AsyncState<T>> get copyWith =>
      _$AsyncStateCopyWithImpl<T, AsyncState<T>>(
          this as AsyncState<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncState<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(data), failure);

  @override
  String toString() {
    return 'AsyncState<$T>(status: $status, data: $data, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $AsyncStateCopyWith<T, $Res> {
  factory $AsyncStateCopyWith(
          AsyncState<T> value, $Res Function(AsyncState<T>) _then) =
      _$AsyncStateCopyWithImpl;
  @useResult
  $Res call({AsyncStatus status, T? data, Failure? failure});

  $AsyncStatusCopyWith<$Res> get status;
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$AsyncStateCopyWithImpl<T, $Res>
    implements $AsyncStateCopyWith<T, $Res> {
  _$AsyncStateCopyWithImpl(this._self, this._then);

  final AsyncState<T> _self;
  final $Res Function(AsyncState<T>) _then;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncStatus,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStatusCopyWith<$Res> get status {
    return $AsyncStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_self.failure!, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AsyncState].
extension AsyncStatePatterns<T> on AsyncState<T> {
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
    TResult Function(_AsyncState<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AsyncState() when $default != null:
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
    TResult Function(_AsyncState<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AsyncState():
        return $default(_that);
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
    TResult? Function(_AsyncState<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AsyncState() when $default != null:
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
    TResult Function(AsyncStatus status, T? data, Failure? failure)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AsyncState() when $default != null:
        return $default(_that.status, _that.data, _that.failure);
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
    TResult Function(AsyncStatus status, T? data, Failure? failure) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AsyncState():
        return $default(_that.status, _that.data, _that.failure);
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
    TResult? Function(AsyncStatus status, T? data, Failure? failure)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AsyncState() when $default != null:
        return $default(_that.status, _that.data, _that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AsyncState<T> extends AsyncState<T> {
  _AsyncState({required this.status, this.data, this.failure}) : super._();

  @override
  final AsyncStatus status;
  @override
  final T? data;
  @override
  final Failure? failure;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsyncStateCopyWith<T, _AsyncState<T>> get copyWith =>
      __$AsyncStateCopyWithImpl<T, _AsyncState<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncState<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(data), failure);

  @override
  String toString() {
    return 'AsyncState<$T>(status: $status, data: $data, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$AsyncStateCopyWith<T, $Res>
    implements $AsyncStateCopyWith<T, $Res> {
  factory _$AsyncStateCopyWith(
          _AsyncState<T> value, $Res Function(_AsyncState<T>) _then) =
      __$AsyncStateCopyWithImpl;
  @override
  @useResult
  $Res call({AsyncStatus status, T? data, Failure? failure});

  @override
  $AsyncStatusCopyWith<$Res> get status;
  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$AsyncStateCopyWithImpl<T, $Res>
    implements _$AsyncStateCopyWith<T, $Res> {
  __$AsyncStateCopyWithImpl(this._self, this._then);

  final _AsyncState<T> _self;
  final $Res Function(_AsyncState<T>) _then;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_AsyncState<T>(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncStatus,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStatusCopyWith<$Res> get status {
    return $AsyncStatusCopyWith<$Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_self.failure!, (value) {
      return _then(_self.copyWith(failure: value));
    });
  }
}

/// @nodoc
mixin _$AsyncStatus {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AsyncStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncStatus()';
  }
}

/// @nodoc
class $AsyncStatusCopyWith<$Res> {
  $AsyncStatusCopyWith(AsyncStatus _, $Res Function(AsyncStatus) __);
}

/// Adds pattern-matching-related methods to [AsyncStatus].
extension AsyncStatusPatterns on AsyncStatus {
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
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InitialStatus() when initial != null:
        return initial(_that);
      case LoadingStatus() when loading != null:
        return loading(_that);
      case SuccessStatus() when success != null:
        return success(_that);
      case FailureStatus() when failure != null:
        return failure(_that);
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
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case InitialStatus():
        return initial(_that);
      case LoadingStatus():
        return loading(_that);
      case SuccessStatus():
        return success(_that);
      case FailureStatus():
        return failure(_that);
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
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case InitialStatus() when initial != null:
        return initial(_that);
      case LoadingStatus() when loading != null:
        return loading(_that);
      case SuccessStatus() when success != null:
        return success(_that);
      case FailureStatus() when failure != null:
        return failure(_that);
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case InitialStatus() when initial != null:
        return initial();
      case LoadingStatus() when loading != null:
        return loading();
      case SuccessStatus() when success != null:
        return success();
      case FailureStatus() when failure != null:
        return failure();
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    final _that = this;
    switch (_that) {
      case InitialStatus():
        return initial();
      case LoadingStatus():
        return loading();
      case SuccessStatus():
        return success();
      case FailureStatus():
        return failure();
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    final _that = this;
    switch (_that) {
      case InitialStatus() when initial != null:
        return initial();
      case LoadingStatus() when loading != null:
        return loading();
      case SuccessStatus() when success != null:
        return success();
      case FailureStatus() when failure != null:
        return failure();
      case _:
        return null;
    }
  }
}

/// @nodoc

class InitialStatus extends AsyncStatus {
  const InitialStatus() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncStatus.initial()';
  }
}

/// @nodoc

class LoadingStatus extends AsyncStatus {
  const LoadingStatus() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncStatus.loading()';
  }
}

/// @nodoc

class SuccessStatus extends AsyncStatus {
  const SuccessStatus() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SuccessStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncStatus.success()';
  }
}

/// @nodoc

class FailureStatus extends AsyncStatus {
  const FailureStatus() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FailureStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AsyncStatus.failure()';
  }
}

// dart format on
