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
  DateTime get selectedDay;
  AsyncState<List<MealEntriesList>> get selectedDayMealEntries;
  bool get editMode;
  List<DiaryEntry> get checkedEntries;

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
                other.macrosPercentageEnabled == macrosPercentageEnabled) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.selectedDayMealEntries, selectedDayMealEntries) ||
                other.selectedDayMealEntries == selectedDayMealEntries) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            const DeepCollectionEquality()
                .equals(other.checkedEntries, checkedEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      macrosPercentageEnabled,
      selectedDay,
      selectedDayMealEntries,
      editMode,
      const DeepCollectionEquality().hash(checkedEntries));

  @override
  String toString() {
    return 'DiaryState(macrosPercentageEnabled: $macrosPercentageEnabled, selectedDay: $selectedDay, selectedDayMealEntries: $selectedDayMealEntries, editMode: $editMode, checkedEntries: $checkedEntries)';
  }
}

/// @nodoc
abstract mixin class $DiaryStateCopyWith<$Res> {
  factory $DiaryStateCopyWith(
          DiaryState value, $Res Function(DiaryState) _then) =
      _$DiaryStateCopyWithImpl;
  @useResult
  $Res call(
      {bool macrosPercentageEnabled,
      DateTime selectedDay,
      AsyncState<List<MealEntriesList>> selectedDayMealEntries,
      bool editMode,
      List<DiaryEntry> checkedEntries});

  $AsyncStateCopyWith<List<MealEntriesList>, $Res> get selectedDayMealEntries;
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
    Object? selectedDay = null,
    Object? selectedDayMealEntries = null,
    Object? editMode = null,
    Object? checkedEntries = null,
  }) {
    return _then(_self.copyWith(
      macrosPercentageEnabled: null == macrosPercentageEnabled
          ? _self.macrosPercentageEnabled
          : macrosPercentageEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: null == selectedDay
          ? _self.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDayMealEntries: null == selectedDayMealEntries
          ? _self.selectedDayMealEntries
          : selectedDayMealEntries // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<MealEntriesList>>,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      checkedEntries: null == checkedEntries
          ? _self.checkedEntries
          : checkedEntries // ignore: cast_nullable_to_non_nullable
              as List<DiaryEntry>,
    ));
  }

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<MealEntriesList>, $Res> get selectedDayMealEntries {
    return $AsyncStateCopyWith<List<MealEntriesList>, $Res>(
        _self.selectedDayMealEntries, (value) {
      return _then(_self.copyWith(selectedDayMealEntries: value));
    });
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
    TResult Function(
            bool macrosPercentageEnabled,
            DateTime selectedDay,
            AsyncState<List<MealEntriesList>> selectedDayMealEntries,
            bool editMode,
            List<DiaryEntry> checkedEntries)?
        $default, {
    TResult Function(
            bool macrosPercentageEnabled,
            DateTime selectedDay,
            AsyncState<List<MealEntriesList>> selectedDayMealEntries,
            bool editMode,
            List<DiaryEntry> checkedEntries)?
        initial,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState() when $default != null:
        return $default(_that.macrosPercentageEnabled, _that.selectedDay,
            _that.selectedDayMealEntries, _that.editMode, _that.checkedEntries);
      case InitialDiaryState() when initial != null:
        return initial(_that.macrosPercentageEnabled, _that.selectedDay,
            _that.selectedDayMealEntries, _that.editMode, _that.checkedEntries);
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
            bool macrosPercentageEnabled,
            DateTime selectedDay,
            AsyncState<List<MealEntriesList>> selectedDayMealEntries,
            bool editMode,
            List<DiaryEntry> checkedEntries)
        $default, {
    required TResult Function(
            bool macrosPercentageEnabled,
            DateTime selectedDay,
            AsyncState<List<MealEntriesList>> selectedDayMealEntries,
            bool editMode,
            List<DiaryEntry> checkedEntries)
        initial,
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState():
        return $default(_that.macrosPercentageEnabled, _that.selectedDay,
            _that.selectedDayMealEntries, _that.editMode, _that.checkedEntries);
      case InitialDiaryState():
        return initial(_that.macrosPercentageEnabled, _that.selectedDay,
            _that.selectedDayMealEntries, _that.editMode, _that.checkedEntries);
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
            bool macrosPercentageEnabled,
            DateTime selectedDay,
            AsyncState<List<MealEntriesList>> selectedDayMealEntries,
            bool editMode,
            List<DiaryEntry> checkedEntries)?
        $default, {
    TResult? Function(
            bool macrosPercentageEnabled,
            DateTime selectedDay,
            AsyncState<List<MealEntriesList>> selectedDayMealEntries,
            bool editMode,
            List<DiaryEntry> checkedEntries)?
        initial,
  }) {
    final _that = this;
    switch (_that) {
      case _DiaryState() when $default != null:
        return $default(_that.macrosPercentageEnabled, _that.selectedDay,
            _that.selectedDayMealEntries, _that.editMode, _that.checkedEntries);
      case InitialDiaryState() when initial != null:
        return initial(_that.macrosPercentageEnabled, _that.selectedDay,
            _that.selectedDayMealEntries, _that.editMode, _that.checkedEntries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DiaryState implements DiaryState {
  const _DiaryState(
      {this.macrosPercentageEnabled = false,
      required this.selectedDay,
      required this.selectedDayMealEntries,
      this.editMode = false,
      final List<DiaryEntry> checkedEntries = const []})
      : _checkedEntries = checkedEntries;

  @override
  @JsonKey()
  final bool macrosPercentageEnabled;
  @override
  final DateTime selectedDay;
  @override
  final AsyncState<List<MealEntriesList>> selectedDayMealEntries;
  @override
  @JsonKey()
  final bool editMode;
  final List<DiaryEntry> _checkedEntries;
  @override
  @JsonKey()
  List<DiaryEntry> get checkedEntries {
    if (_checkedEntries is EqualUnmodifiableListView) return _checkedEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkedEntries);
  }

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
                other.macrosPercentageEnabled == macrosPercentageEnabled) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.selectedDayMealEntries, selectedDayMealEntries) ||
                other.selectedDayMealEntries == selectedDayMealEntries) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            const DeepCollectionEquality()
                .equals(other._checkedEntries, _checkedEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      macrosPercentageEnabled,
      selectedDay,
      selectedDayMealEntries,
      editMode,
      const DeepCollectionEquality().hash(_checkedEntries));

  @override
  String toString() {
    return 'DiaryState(macrosPercentageEnabled: $macrosPercentageEnabled, selectedDay: $selectedDay, selectedDayMealEntries: $selectedDayMealEntries, editMode: $editMode, checkedEntries: $checkedEntries)';
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
  $Res call(
      {bool macrosPercentageEnabled,
      DateTime selectedDay,
      AsyncState<List<MealEntriesList>> selectedDayMealEntries,
      bool editMode,
      List<DiaryEntry> checkedEntries});

  @override
  $AsyncStateCopyWith<List<MealEntriesList>, $Res> get selectedDayMealEntries;
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
    Object? selectedDay = null,
    Object? selectedDayMealEntries = null,
    Object? editMode = null,
    Object? checkedEntries = null,
  }) {
    return _then(_DiaryState(
      macrosPercentageEnabled: null == macrosPercentageEnabled
          ? _self.macrosPercentageEnabled
          : macrosPercentageEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: null == selectedDay
          ? _self.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDayMealEntries: null == selectedDayMealEntries
          ? _self.selectedDayMealEntries
          : selectedDayMealEntries // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<MealEntriesList>>,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      checkedEntries: null == checkedEntries
          ? _self._checkedEntries
          : checkedEntries // ignore: cast_nullable_to_non_nullable
              as List<DiaryEntry>,
    ));
  }

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<MealEntriesList>, $Res> get selectedDayMealEntries {
    return $AsyncStateCopyWith<List<MealEntriesList>, $Res>(
        _self.selectedDayMealEntries, (value) {
      return _then(_self.copyWith(selectedDayMealEntries: value));
    });
  }
}

/// @nodoc

class InitialDiaryState implements DiaryState {
  const InitialDiaryState(
      {this.macrosPercentageEnabled = false,
      required this.selectedDay,
      required this.selectedDayMealEntries,
      this.editMode = false,
      final List<DiaryEntry> checkedEntries = const []})
      : _checkedEntries = checkedEntries;

  @override
  @JsonKey()
  final bool macrosPercentageEnabled;
  @override
  final DateTime selectedDay;
  @override
  final AsyncState<List<MealEntriesList>> selectedDayMealEntries;
  @override
  @JsonKey()
  final bool editMode;
  final List<DiaryEntry> _checkedEntries;
  @override
  @JsonKey()
  List<DiaryEntry> get checkedEntries {
    if (_checkedEntries is EqualUnmodifiableListView) return _checkedEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkedEntries);
  }

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
                other.macrosPercentageEnabled == macrosPercentageEnabled) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.selectedDayMealEntries, selectedDayMealEntries) ||
                other.selectedDayMealEntries == selectedDayMealEntries) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            const DeepCollectionEquality()
                .equals(other._checkedEntries, _checkedEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      macrosPercentageEnabled,
      selectedDay,
      selectedDayMealEntries,
      editMode,
      const DeepCollectionEquality().hash(_checkedEntries));

  @override
  String toString() {
    return 'DiaryState.initial(macrosPercentageEnabled: $macrosPercentageEnabled, selectedDay: $selectedDay, selectedDayMealEntries: $selectedDayMealEntries, editMode: $editMode, checkedEntries: $checkedEntries)';
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
  $Res call(
      {bool macrosPercentageEnabled,
      DateTime selectedDay,
      AsyncState<List<MealEntriesList>> selectedDayMealEntries,
      bool editMode,
      List<DiaryEntry> checkedEntries});

  @override
  $AsyncStateCopyWith<List<MealEntriesList>, $Res> get selectedDayMealEntries;
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
    Object? selectedDay = null,
    Object? selectedDayMealEntries = null,
    Object? editMode = null,
    Object? checkedEntries = null,
  }) {
    return _then(InitialDiaryState(
      macrosPercentageEnabled: null == macrosPercentageEnabled
          ? _self.macrosPercentageEnabled
          : macrosPercentageEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDay: null == selectedDay
          ? _self.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDayMealEntries: null == selectedDayMealEntries
          ? _self.selectedDayMealEntries
          : selectedDayMealEntries // ignore: cast_nullable_to_non_nullable
              as AsyncState<List<MealEntriesList>>,
      editMode: null == editMode
          ? _self.editMode
          : editMode // ignore: cast_nullable_to_non_nullable
              as bool,
      checkedEntries: null == checkedEntries
          ? _self._checkedEntries
          : checkedEntries // ignore: cast_nullable_to_non_nullable
              as List<DiaryEntry>,
    ));
  }

  /// Create a copy of DiaryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncStateCopyWith<List<MealEntriesList>, $Res> get selectedDayMealEntries {
    return $AsyncStateCopyWith<List<MealEntriesList>, $Res>(
        _self.selectedDayMealEntries, (value) {
      return _then(_self.copyWith(selectedDayMealEntries: value));
    });
  }
}

// dart format on
