// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiaryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DiaryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DiaryEvent()';
  }
}

/// @nodoc
class $DiaryEventCopyWith<$Res> {
  $DiaryEventCopyWith(DiaryEvent _, $Res Function(DiaryEvent) __);
}

/// Adds pattern-matching-related methods to [DiaryEvent].
extension DiaryEventPatterns on DiaryEvent {
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
    TResult Function(ToggleMacroPercentageEvent value)? toggleMacroPercentage,
    TResult Function(RequestAuthSubscriptionEvent value)?
        requestAuthSubscription,
    TResult Function(SelectDayEvent value)? selectDay,
    TResult Function(EnterEditModeEvent value)? enterEditMode,
    TResult Function(ExitEditModeEvent value)? exitEditMode,
    TResult Function(RemoveEntryEvent value)? removeSingleDiaryEntry,
    TResult Function(RemoveCheckedEntriesEvent value)?
        removeCheckedDiaryEntries,
    TResult Function(DayCheckChanged value)? dayCheckChanged,
    TResult Function(MealCheckChanged value)? mealCheckChanged,
    TResult Function(EntryCheckChanged value)? diaryEntryCheckChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ToggleMacroPercentageEvent() when toggleMacroPercentage != null:
        return toggleMacroPercentage(_that);
      case RequestAuthSubscriptionEvent() when requestAuthSubscription != null:
        return requestAuthSubscription(_that);
      case SelectDayEvent() when selectDay != null:
        return selectDay(_that);
      case EnterEditModeEvent() when enterEditMode != null:
        return enterEditMode(_that);
      case ExitEditModeEvent() when exitEditMode != null:
        return exitEditMode(_that);
      case RemoveEntryEvent() when removeSingleDiaryEntry != null:
        return removeSingleDiaryEntry(_that);
      case RemoveCheckedEntriesEvent() when removeCheckedDiaryEntries != null:
        return removeCheckedDiaryEntries(_that);
      case DayCheckChanged() when dayCheckChanged != null:
        return dayCheckChanged(_that);
      case MealCheckChanged() when mealCheckChanged != null:
        return mealCheckChanged(_that);
      case EntryCheckChanged() when diaryEntryCheckChanged != null:
        return diaryEntryCheckChanged(_that);
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
    required TResult Function(ToggleMacroPercentageEvent value)
        toggleMacroPercentage,
    required TResult Function(RequestAuthSubscriptionEvent value)
        requestAuthSubscription,
    required TResult Function(SelectDayEvent value) selectDay,
    required TResult Function(EnterEditModeEvent value) enterEditMode,
    required TResult Function(ExitEditModeEvent value) exitEditMode,
    required TResult Function(RemoveEntryEvent value) removeSingleDiaryEntry,
    required TResult Function(RemoveCheckedEntriesEvent value)
        removeCheckedDiaryEntries,
    required TResult Function(DayCheckChanged value) dayCheckChanged,
    required TResult Function(MealCheckChanged value) mealCheckChanged,
    required TResult Function(EntryCheckChanged value) diaryEntryCheckChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ToggleMacroPercentageEvent():
        return toggleMacroPercentage(_that);
      case RequestAuthSubscriptionEvent():
        return requestAuthSubscription(_that);
      case SelectDayEvent():
        return selectDay(_that);
      case EnterEditModeEvent():
        return enterEditMode(_that);
      case ExitEditModeEvent():
        return exitEditMode(_that);
      case RemoveEntryEvent():
        return removeSingleDiaryEntry(_that);
      case RemoveCheckedEntriesEvent():
        return removeCheckedDiaryEntries(_that);
      case DayCheckChanged():
        return dayCheckChanged(_that);
      case MealCheckChanged():
        return mealCheckChanged(_that);
      case EntryCheckChanged():
        return diaryEntryCheckChanged(_that);
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
    TResult? Function(ToggleMacroPercentageEvent value)? toggleMacroPercentage,
    TResult? Function(RequestAuthSubscriptionEvent value)?
        requestAuthSubscription,
    TResult? Function(SelectDayEvent value)? selectDay,
    TResult? Function(EnterEditModeEvent value)? enterEditMode,
    TResult? Function(ExitEditModeEvent value)? exitEditMode,
    TResult? Function(RemoveEntryEvent value)? removeSingleDiaryEntry,
    TResult? Function(RemoveCheckedEntriesEvent value)?
        removeCheckedDiaryEntries,
    TResult? Function(DayCheckChanged value)? dayCheckChanged,
    TResult? Function(MealCheckChanged value)? mealCheckChanged,
    TResult? Function(EntryCheckChanged value)? diaryEntryCheckChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ToggleMacroPercentageEvent() when toggleMacroPercentage != null:
        return toggleMacroPercentage(_that);
      case RequestAuthSubscriptionEvent() when requestAuthSubscription != null:
        return requestAuthSubscription(_that);
      case SelectDayEvent() when selectDay != null:
        return selectDay(_that);
      case EnterEditModeEvent() when enterEditMode != null:
        return enterEditMode(_that);
      case ExitEditModeEvent() when exitEditMode != null:
        return exitEditMode(_that);
      case RemoveEntryEvent() when removeSingleDiaryEntry != null:
        return removeSingleDiaryEntry(_that);
      case RemoveCheckedEntriesEvent() when removeCheckedDiaryEntries != null:
        return removeCheckedDiaryEntries(_that);
      case DayCheckChanged() when dayCheckChanged != null:
        return dayCheckChanged(_that);
      case MealCheckChanged() when mealCheckChanged != null:
        return mealCheckChanged(_that);
      case EntryCheckChanged() when diaryEntryCheckChanged != null:
        return diaryEntryCheckChanged(_that);
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
    TResult Function()? toggleMacroPercentage,
    TResult Function()? requestAuthSubscription,
    TResult Function(DateTime date)? selectDay,
    TResult Function()? enterEditMode,
    TResult Function()? exitEditMode,
    TResult Function(int localId)? removeSingleDiaryEntry,
    TResult Function()? removeCheckedDiaryEntries,
    TResult Function(bool? checked)? dayCheckChanged,
    TResult Function(bool? checked, Meal meal)? mealCheckChanged,
    TResult Function(bool checked, DiaryEntry entry)? diaryEntryCheckChanged,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ToggleMacroPercentageEvent() when toggleMacroPercentage != null:
        return toggleMacroPercentage();
      case RequestAuthSubscriptionEvent() when requestAuthSubscription != null:
        return requestAuthSubscription();
      case SelectDayEvent() when selectDay != null:
        return selectDay(_that.date);
      case EnterEditModeEvent() when enterEditMode != null:
        return enterEditMode();
      case ExitEditModeEvent() when exitEditMode != null:
        return exitEditMode();
      case RemoveEntryEvent() when removeSingleDiaryEntry != null:
        return removeSingleDiaryEntry(_that.localId);
      case RemoveCheckedEntriesEvent() when removeCheckedDiaryEntries != null:
        return removeCheckedDiaryEntries();
      case DayCheckChanged() when dayCheckChanged != null:
        return dayCheckChanged(_that.checked);
      case MealCheckChanged() when mealCheckChanged != null:
        return mealCheckChanged(_that.checked, _that.meal);
      case EntryCheckChanged() when diaryEntryCheckChanged != null:
        return diaryEntryCheckChanged(_that.checked, _that.entry);
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
    required TResult Function() toggleMacroPercentage,
    required TResult Function() requestAuthSubscription,
    required TResult Function(DateTime date) selectDay,
    required TResult Function() enterEditMode,
    required TResult Function() exitEditMode,
    required TResult Function(int localId) removeSingleDiaryEntry,
    required TResult Function() removeCheckedDiaryEntries,
    required TResult Function(bool? checked) dayCheckChanged,
    required TResult Function(bool? checked, Meal meal) mealCheckChanged,
    required TResult Function(bool checked, DiaryEntry entry)
        diaryEntryCheckChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ToggleMacroPercentageEvent():
        return toggleMacroPercentage();
      case RequestAuthSubscriptionEvent():
        return requestAuthSubscription();
      case SelectDayEvent():
        return selectDay(_that.date);
      case EnterEditModeEvent():
        return enterEditMode();
      case ExitEditModeEvent():
        return exitEditMode();
      case RemoveEntryEvent():
        return removeSingleDiaryEntry(_that.localId);
      case RemoveCheckedEntriesEvent():
        return removeCheckedDiaryEntries();
      case DayCheckChanged():
        return dayCheckChanged(_that.checked);
      case MealCheckChanged():
        return mealCheckChanged(_that.checked, _that.meal);
      case EntryCheckChanged():
        return diaryEntryCheckChanged(_that.checked, _that.entry);
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
    TResult? Function()? toggleMacroPercentage,
    TResult? Function()? requestAuthSubscription,
    TResult? Function(DateTime date)? selectDay,
    TResult? Function()? enterEditMode,
    TResult? Function()? exitEditMode,
    TResult? Function(int localId)? removeSingleDiaryEntry,
    TResult? Function()? removeCheckedDiaryEntries,
    TResult? Function(bool? checked)? dayCheckChanged,
    TResult? Function(bool? checked, Meal meal)? mealCheckChanged,
    TResult? Function(bool checked, DiaryEntry entry)? diaryEntryCheckChanged,
  }) {
    final _that = this;
    switch (_that) {
      case ToggleMacroPercentageEvent() when toggleMacroPercentage != null:
        return toggleMacroPercentage();
      case RequestAuthSubscriptionEvent() when requestAuthSubscription != null:
        return requestAuthSubscription();
      case SelectDayEvent() when selectDay != null:
        return selectDay(_that.date);
      case EnterEditModeEvent() when enterEditMode != null:
        return enterEditMode();
      case ExitEditModeEvent() when exitEditMode != null:
        return exitEditMode();
      case RemoveEntryEvent() when removeSingleDiaryEntry != null:
        return removeSingleDiaryEntry(_that.localId);
      case RemoveCheckedEntriesEvent() when removeCheckedDiaryEntries != null:
        return removeCheckedDiaryEntries();
      case DayCheckChanged() when dayCheckChanged != null:
        return dayCheckChanged(_that.checked);
      case MealCheckChanged() when mealCheckChanged != null:
        return mealCheckChanged(_that.checked, _that.meal);
      case EntryCheckChanged() when diaryEntryCheckChanged != null:
        return diaryEntryCheckChanged(_that.checked, _that.entry);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ToggleMacroPercentageEvent implements DiaryEvent {
  const ToggleMacroPercentageEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleMacroPercentageEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DiaryEvent.toggleMacroPercentage()';
  }
}

/// @nodoc

class RequestAuthSubscriptionEvent implements DiaryEvent {
  const RequestAuthSubscriptionEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequestAuthSubscriptionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DiaryEvent.requestAuthSubscription()';
  }
}

/// @nodoc

class SelectDayEvent implements DiaryEvent {
  const SelectDayEvent({required this.date});

  final DateTime date;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectDayEventCopyWith<SelectDayEvent> get copyWith =>
      _$SelectDayEventCopyWithImpl<SelectDayEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectDayEvent &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'DiaryEvent.selectDay(date: $date)';
  }
}

/// @nodoc
abstract mixin class $SelectDayEventCopyWith<$Res>
    implements $DiaryEventCopyWith<$Res> {
  factory $SelectDayEventCopyWith(
          SelectDayEvent value, $Res Function(SelectDayEvent) _then) =
      _$SelectDayEventCopyWithImpl;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class _$SelectDayEventCopyWithImpl<$Res>
    implements $SelectDayEventCopyWith<$Res> {
  _$SelectDayEventCopyWithImpl(this._self, this._then);

  final SelectDayEvent _self;
  final $Res Function(SelectDayEvent) _then;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = null,
  }) {
    return _then(SelectDayEvent(
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class EnterEditModeEvent implements DiaryEvent {
  const EnterEditModeEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EnterEditModeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DiaryEvent.enterEditMode()';
  }
}

/// @nodoc

class ExitEditModeEvent implements DiaryEvent {
  const ExitEditModeEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExitEditModeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DiaryEvent.exitEditMode()';
  }
}

/// @nodoc

class RemoveEntryEvent implements DiaryEvent {
  const RemoveEntryEvent({required this.localId});

  final int localId;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoveEntryEventCopyWith<RemoveEntryEvent> get copyWith =>
      _$RemoveEntryEventCopyWithImpl<RemoveEntryEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveEntryEvent &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, localId);

  @override
  String toString() {
    return 'DiaryEvent.removeSingleDiaryEntry(localId: $localId)';
  }
}

/// @nodoc
abstract mixin class $RemoveEntryEventCopyWith<$Res>
    implements $DiaryEventCopyWith<$Res> {
  factory $RemoveEntryEventCopyWith(
          RemoveEntryEvent value, $Res Function(RemoveEntryEvent) _then) =
      _$RemoveEntryEventCopyWithImpl;
  @useResult
  $Res call({int localId});
}

/// @nodoc
class _$RemoveEntryEventCopyWithImpl<$Res>
    implements $RemoveEntryEventCopyWith<$Res> {
  _$RemoveEntryEventCopyWithImpl(this._self, this._then);

  final RemoveEntryEvent _self;
  final $Res Function(RemoveEntryEvent) _then;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = null,
  }) {
    return _then(RemoveEntryEvent(
      localId: null == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class RemoveCheckedEntriesEvent implements DiaryEvent {
  const RemoveCheckedEntriesEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveCheckedEntriesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DiaryEvent.removeCheckedDiaryEntries()';
  }
}

/// @nodoc

class DayCheckChanged implements DiaryEvent {
  const DayCheckChanged({required this.checked});

  final bool? checked;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DayCheckChangedCopyWith<DayCheckChanged> get copyWith =>
      _$DayCheckChangedCopyWithImpl<DayCheckChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DayCheckChanged &&
            (identical(other.checked, checked) || other.checked == checked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checked);

  @override
  String toString() {
    return 'DiaryEvent.dayCheckChanged(checked: $checked)';
  }
}

/// @nodoc
abstract mixin class $DayCheckChangedCopyWith<$Res>
    implements $DiaryEventCopyWith<$Res> {
  factory $DayCheckChangedCopyWith(
          DayCheckChanged value, $Res Function(DayCheckChanged) _then) =
      _$DayCheckChangedCopyWithImpl;
  @useResult
  $Res call({bool? checked});
}

/// @nodoc
class _$DayCheckChangedCopyWithImpl<$Res>
    implements $DayCheckChangedCopyWith<$Res> {
  _$DayCheckChangedCopyWithImpl(this._self, this._then);

  final DayCheckChanged _self;
  final $Res Function(DayCheckChanged) _then;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? checked = freezed,
  }) {
    return _then(DayCheckChanged(
      checked: freezed == checked
          ? _self.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class MealCheckChanged implements DiaryEvent {
  const MealCheckChanged({required this.checked, required this.meal});

  final bool? checked;
  final Meal meal;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealCheckChangedCopyWith<MealCheckChanged> get copyWith =>
      _$MealCheckChangedCopyWithImpl<MealCheckChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealCheckChanged &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.meal, meal) || other.meal == meal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checked, meal);

  @override
  String toString() {
    return 'DiaryEvent.mealCheckChanged(checked: $checked, meal: $meal)';
  }
}

/// @nodoc
abstract mixin class $MealCheckChangedCopyWith<$Res>
    implements $DiaryEventCopyWith<$Res> {
  factory $MealCheckChangedCopyWith(
          MealCheckChanged value, $Res Function(MealCheckChanged) _then) =
      _$MealCheckChangedCopyWithImpl;
  @useResult
  $Res call({bool? checked, Meal meal});
}

/// @nodoc
class _$MealCheckChangedCopyWithImpl<$Res>
    implements $MealCheckChangedCopyWith<$Res> {
  _$MealCheckChangedCopyWithImpl(this._self, this._then);

  final MealCheckChanged _self;
  final $Res Function(MealCheckChanged) _then;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? checked = freezed,
    Object? meal = null,
  }) {
    return _then(MealCheckChanged(
      checked: freezed == checked
          ? _self.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool?,
      meal: null == meal
          ? _self.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as Meal,
    ));
  }
}

/// @nodoc

class EntryCheckChanged implements DiaryEvent {
  const EntryCheckChanged({required this.checked, required this.entry});

  final bool checked;
  final DiaryEntry entry;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntryCheckChangedCopyWith<EntryCheckChanged> get copyWith =>
      _$EntryCheckChangedCopyWithImpl<EntryCheckChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntryCheckChanged &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checked, entry);

  @override
  String toString() {
    return 'DiaryEvent.diaryEntryCheckChanged(checked: $checked, entry: $entry)';
  }
}

/// @nodoc
abstract mixin class $EntryCheckChangedCopyWith<$Res>
    implements $DiaryEventCopyWith<$Res> {
  factory $EntryCheckChangedCopyWith(
          EntryCheckChanged value, $Res Function(EntryCheckChanged) _then) =
      _$EntryCheckChangedCopyWithImpl;
  @useResult
  $Res call({bool checked, DiaryEntry entry});
}

/// @nodoc
class _$EntryCheckChangedCopyWithImpl<$Res>
    implements $EntryCheckChangedCopyWith<$Res> {
  _$EntryCheckChangedCopyWithImpl(this._self, this._then);

  final EntryCheckChanged _self;
  final $Res Function(EntryCheckChanged) _then;

  /// Create a copy of DiaryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? checked = null,
    Object? entry = null,
  }) {
    return _then(EntryCheckChanged(
      checked: null == checked
          ? _self.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      entry: null == entry
          ? _self.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as DiaryEntry,
    ));
  }
}

// dart format on
