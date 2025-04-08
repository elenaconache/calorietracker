// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AsyncState<T> {
  AsyncStatus get status => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AsyncStateCopyWith<T, AsyncState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncStateCopyWith<T, $Res> {
  factory $AsyncStateCopyWith(
          AsyncState<T> value, $Res Function(AsyncState<T>) then) =
      _$AsyncStateCopyWithImpl<T, $Res, AsyncState<T>>;
  @useResult
  $Res call({AsyncStatus status, T? data, Failure? failure});

  $AsyncStatusCopyWith<$Res> get status;
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$AsyncStateCopyWithImpl<T, $Res, $Val extends AsyncState<T>>
    implements $AsyncStateCopyWith<T, $Res> {
  _$AsyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStatusCopyWith<$Res> get status {
    return $AsyncStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AsyncStateImplCopyWith<T, $Res>
    implements $AsyncStateCopyWith<T, $Res> {
  factory _$$AsyncStateImplCopyWith(
          _$AsyncStateImpl<T> value, $Res Function(_$AsyncStateImpl<T>) then) =
      __$$AsyncStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({AsyncStatus status, T? data, Failure? failure});

  @override
  $AsyncStatusCopyWith<$Res> get status;
  @override
  $FailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$AsyncStateImplCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$AsyncStateImpl<T>>
    implements _$$AsyncStateImplCopyWith<T, $Res> {
  __$$AsyncStateImplCopyWithImpl(
      _$AsyncStateImpl<T> _value, $Res Function(_$AsyncStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$AsyncStateImpl<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AsyncStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$AsyncStateImpl<T> extends _AsyncState<T> {
  _$AsyncStateImpl({required this.status, this.data, this.failure}) : super._();

  @override
  final AsyncStatus status;
  @override
  final T? data;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AsyncState<$T>(status: $status, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AsyncStateImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(data), failure);

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AsyncStateImplCopyWith<T, _$AsyncStateImpl<T>> get copyWith =>
      __$$AsyncStateImplCopyWithImpl<T, _$AsyncStateImpl<T>>(this, _$identity);
}

abstract class _AsyncState<T> extends AsyncState<T> {
  factory _AsyncState(
      {required final AsyncStatus status,
      final T? data,
      final Failure? failure}) = _$AsyncStateImpl<T>;
  _AsyncState._() : super._();

  @override
  AsyncStatus get status;
  @override
  T? get data;
  @override
  Failure? get failure;

  /// Create a copy of AsyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AsyncStateImplCopyWith<T, _$AsyncStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AsyncStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncStatusCopyWith<$Res> {
  factory $AsyncStatusCopyWith(
          AsyncStatus value, $Res Function(AsyncStatus) then) =
      _$AsyncStatusCopyWithImpl<$Res, AsyncStatus>;
}

/// @nodoc
class _$AsyncStatusCopyWithImpl<$Res, $Val extends AsyncStatus>
    implements $AsyncStatusCopyWith<$Res> {
  _$AsyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AsyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialStatusImplCopyWith<$Res> {
  factory _$$InitialStatusImplCopyWith(
          _$InitialStatusImpl value, $Res Function(_$InitialStatusImpl) then) =
      __$$InitialStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStatusImplCopyWithImpl<$Res>
    extends _$AsyncStatusCopyWithImpl<$Res, _$InitialStatusImpl>
    implements _$$InitialStatusImplCopyWith<$Res> {
  __$$InitialStatusImplCopyWithImpl(
      _$InitialStatusImpl _value, $Res Function(_$InitialStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AsyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialStatusImpl extends InitialStatus {
  const _$InitialStatusImpl() : super._();

  @override
  String toString() {
    return 'AsyncStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialStatus extends AsyncStatus {
  const factory InitialStatus() = _$InitialStatusImpl;
  const InitialStatus._() : super._();
}

/// @nodoc
abstract class _$$LoadingStatusImplCopyWith<$Res> {
  factory _$$LoadingStatusImplCopyWith(
          _$LoadingStatusImpl value, $Res Function(_$LoadingStatusImpl) then) =
      __$$LoadingStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStatusImplCopyWithImpl<$Res>
    extends _$AsyncStatusCopyWithImpl<$Res, _$LoadingStatusImpl>
    implements _$$LoadingStatusImplCopyWith<$Res> {
  __$$LoadingStatusImplCopyWithImpl(
      _$LoadingStatusImpl _value, $Res Function(_$LoadingStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AsyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStatusImpl extends LoadingStatus {
  const _$LoadingStatusImpl() : super._();

  @override
  String toString() {
    return 'AsyncStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingStatus extends AsyncStatus {
  const factory LoadingStatus() = _$LoadingStatusImpl;
  const LoadingStatus._() : super._();
}

/// @nodoc
abstract class _$$SuccessStatusImplCopyWith<$Res> {
  factory _$$SuccessStatusImplCopyWith(
          _$SuccessStatusImpl value, $Res Function(_$SuccessStatusImpl) then) =
      __$$SuccessStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessStatusImplCopyWithImpl<$Res>
    extends _$AsyncStatusCopyWithImpl<$Res, _$SuccessStatusImpl>
    implements _$$SuccessStatusImplCopyWith<$Res> {
  __$$SuccessStatusImplCopyWithImpl(
      _$SuccessStatusImpl _value, $Res Function(_$SuccessStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AsyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessStatusImpl extends SuccessStatus {
  const _$SuccessStatusImpl() : super._();

  @override
  String toString() {
    return 'AsyncStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessStatus extends AsyncStatus {
  const factory SuccessStatus() = _$SuccessStatusImpl;
  const SuccessStatus._() : super._();
}

/// @nodoc
abstract class _$$FailureStatusImplCopyWith<$Res> {
  factory _$$FailureStatusImplCopyWith(
          _$FailureStatusImpl value, $Res Function(_$FailureStatusImpl) then) =
      __$$FailureStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureStatusImplCopyWithImpl<$Res>
    extends _$AsyncStatusCopyWithImpl<$Res, _$FailureStatusImpl>
    implements _$$FailureStatusImplCopyWith<$Res> {
  __$$FailureStatusImplCopyWithImpl(
      _$FailureStatusImpl _value, $Res Function(_$FailureStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AsyncStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FailureStatusImpl extends FailureStatus {
  const _$FailureStatusImpl() : super._();

  @override
  String toString() {
    return 'AsyncStatus.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialStatus value) initial,
    required TResult Function(LoadingStatus value) loading,
    required TResult Function(SuccessStatus value) success,
    required TResult Function(FailureStatus value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialStatus value)? initial,
    TResult? Function(LoadingStatus value)? loading,
    TResult? Function(SuccessStatus value)? success,
    TResult? Function(FailureStatus value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialStatus value)? initial,
    TResult Function(LoadingStatus value)? loading,
    TResult Function(SuccessStatus value)? success,
    TResult Function(FailureStatus value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FailureStatus extends AsyncStatus {
  const factory FailureStatus() = _$FailureStatusImpl;
  const FailureStatus._() : super._();
}
