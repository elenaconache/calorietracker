// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_goals_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserGoalsState {
  AsyncState<UserGoals> get userGoals => throw _privateConstructorUsedError;
  AsyncState<MacroGoals> get macroGoals => throw _privateConstructorUsedError;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGoalsStateCopyWith<UserGoalsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGoalsStateCopyWith<$Res> {
  factory $UserGoalsStateCopyWith(
          UserGoalsState value, $Res Function(UserGoalsState) then) =
      _$UserGoalsStateCopyWithImpl<$Res, UserGoalsState>;
  @useResult
  $Res call(
      {AsyncState<UserGoals> userGoals, AsyncState<MacroGoals> macroGoals});

  $AsyncStateCopyWith<UserGoals, $Res> get userGoals;
  $AsyncStateCopyWith<MacroGoals, $Res> get macroGoals;
}

/// @nodoc
class _$UserGoalsStateCopyWithImpl<$Res, $Val extends UserGoalsState>
    implements $UserGoalsStateCopyWith<$Res> {
  _$UserGoalsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userGoals = null,
    Object? macroGoals = null,
  }) {
    return _then(_value.copyWith(
      userGoals: null == userGoals
          ? _value.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<UserGoals>,
      macroGoals: null == macroGoals
          ? _value.macroGoals
          : macroGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<MacroGoals>,
    ) as $Val);
  }

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<UserGoals, $Res> get userGoals {
    return $AsyncStateCopyWith<UserGoals, $Res>(_value.userGoals, (value) {
      return _then(_value.copyWith(userGoals: value) as $Val);
    });
  }

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<MacroGoals, $Res> get macroGoals {
    return $AsyncStateCopyWith<MacroGoals, $Res>(_value.macroGoals, (value) {
      return _then(_value.copyWith(macroGoals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserGoalsStateImplCopyWith<$Res>
    implements $UserGoalsStateCopyWith<$Res> {
  factory _$$UserGoalsStateImplCopyWith(_$UserGoalsStateImpl value,
          $Res Function(_$UserGoalsStateImpl) then) =
      __$$UserGoalsStateImplCopyWithImpl<$Res>;
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
class __$$UserGoalsStateImplCopyWithImpl<$Res>
    extends _$UserGoalsStateCopyWithImpl<$Res, _$UserGoalsStateImpl>
    implements _$$UserGoalsStateImplCopyWith<$Res> {
  __$$UserGoalsStateImplCopyWithImpl(
      _$UserGoalsStateImpl _value, $Res Function(_$UserGoalsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userGoals = null,
    Object? macroGoals = null,
  }) {
    return _then(_$UserGoalsStateImpl(
      userGoals: null == userGoals
          ? _value.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<UserGoals>,
      macroGoals: null == macroGoals
          ? _value.macroGoals
          : macroGoals // ignore: cast_nullable_to_non_nullable
              as AsyncState<MacroGoals>,
    ));
  }
}

/// @nodoc

class _$UserGoalsStateImpl implements _UserGoalsState {
  const _$UserGoalsStateImpl(
      {required this.userGoals, required this.macroGoals});

  @override
  final AsyncState<UserGoals> userGoals;
  @override
  final AsyncState<MacroGoals> macroGoals;

  @override
  String toString() {
    return 'UserGoalsState(userGoals: $userGoals, macroGoals: $macroGoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGoalsStateImpl &&
            (identical(other.userGoals, userGoals) ||
                other.userGoals == userGoals) &&
            (identical(other.macroGoals, macroGoals) ||
                other.macroGoals == macroGoals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userGoals, macroGoals);

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGoalsStateImplCopyWith<_$UserGoalsStateImpl> get copyWith =>
      __$$UserGoalsStateImplCopyWithImpl<_$UserGoalsStateImpl>(
          this, _$identity);
}

abstract class _UserGoalsState implements UserGoalsState {
  const factory _UserGoalsState(
      {required final AsyncState<UserGoals> userGoals,
      required final AsyncState<MacroGoals> macroGoals}) = _$UserGoalsStateImpl;

  @override
  AsyncState<UserGoals> get userGoals;
  @override
  AsyncState<MacroGoals> get macroGoals;

  /// Create a copy of UserGoalsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGoalsStateImplCopyWith<_$UserGoalsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
