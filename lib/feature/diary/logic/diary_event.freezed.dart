// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleMacroPercentage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleMacroPercentage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleMacroPercentage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleMacroPercentageEvent value)
        toggleMacroPercentage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleMacroPercentageEvent value)? toggleMacroPercentage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleMacroPercentageEvent value)? toggleMacroPercentage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryEventCopyWith<$Res> {
  factory $DiaryEventCopyWith(
          DiaryEvent value, $Res Function(DiaryEvent) then) =
      _$DiaryEventCopyWithImpl<$Res, DiaryEvent>;
}

/// @nodoc
class _$DiaryEventCopyWithImpl<$Res, $Val extends DiaryEvent>
    implements $DiaryEventCopyWith<$Res> {
  _$DiaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ToggleMacroPercentageEventImplCopyWith<$Res> {
  factory _$$ToggleMacroPercentageEventImplCopyWith(
          _$ToggleMacroPercentageEventImpl value,
          $Res Function(_$ToggleMacroPercentageEventImpl) then) =
      __$$ToggleMacroPercentageEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleMacroPercentageEventImplCopyWithImpl<$Res>
    extends _$DiaryEventCopyWithImpl<$Res, _$ToggleMacroPercentageEventImpl>
    implements _$$ToggleMacroPercentageEventImplCopyWith<$Res> {
  __$$ToggleMacroPercentageEventImplCopyWithImpl(
      _$ToggleMacroPercentageEventImpl _value,
      $Res Function(_$ToggleMacroPercentageEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleMacroPercentageEventImpl implements ToggleMacroPercentageEvent {
  const _$ToggleMacroPercentageEventImpl();

  @override
  String toString() {
    return 'DiaryEvent.toggleMacroPercentage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleMacroPercentageEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toggleMacroPercentage,
  }) {
    return toggleMacroPercentage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toggleMacroPercentage,
  }) {
    return toggleMacroPercentage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toggleMacroPercentage,
    required TResult orElse(),
  }) {
    if (toggleMacroPercentage != null) {
      return toggleMacroPercentage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToggleMacroPercentageEvent value)
        toggleMacroPercentage,
  }) {
    return toggleMacroPercentage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToggleMacroPercentageEvent value)? toggleMacroPercentage,
  }) {
    return toggleMacroPercentage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToggleMacroPercentageEvent value)? toggleMacroPercentage,
    required TResult orElse(),
  }) {
    if (toggleMacroPercentage != null) {
      return toggleMacroPercentage(this);
    }
    return orElse();
  }
}

abstract class ToggleMacroPercentageEvent implements DiaryEvent {
  const factory ToggleMacroPercentageEvent() = _$ToggleMacroPercentageEventImpl;
}
