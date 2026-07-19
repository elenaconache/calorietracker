// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_collection_error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseCollectionErrorResponse {

@CollectionErrorConverter() List<BaseCollectionError> get errors;
/// Create a copy of BaseCollectionErrorResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseCollectionErrorResponseCopyWith<BaseCollectionErrorResponse> get copyWith => _$BaseCollectionErrorResponseCopyWithImpl<BaseCollectionErrorResponse>(this as BaseCollectionErrorResponse, _$identity);

  /// Serializes this BaseCollectionErrorResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseCollectionErrorResponse&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'BaseCollectionErrorResponse(errors: $errors)';
}


}

/// @nodoc
abstract mixin class $BaseCollectionErrorResponseCopyWith<$Res>  {
  factory $BaseCollectionErrorResponseCopyWith(BaseCollectionErrorResponse value, $Res Function(BaseCollectionErrorResponse) _then) = _$BaseCollectionErrorResponseCopyWithImpl;
@useResult
$Res call({
@CollectionErrorConverter() List<BaseCollectionError> errors
});




}
/// @nodoc
class _$BaseCollectionErrorResponseCopyWithImpl<$Res>
    implements $BaseCollectionErrorResponseCopyWith<$Res> {
  _$BaseCollectionErrorResponseCopyWithImpl(this._self, this._then);

  final BaseCollectionErrorResponse _self;
  final $Res Function(BaseCollectionErrorResponse) _then;

/// Create a copy of BaseCollectionErrorResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errors = null,}) {
  return _then(_self.copyWith(
errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<BaseCollectionError>,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseCollectionErrorResponse].
extension BaseCollectionErrorResponsePatterns on BaseCollectionErrorResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseCollectionErrorResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseCollectionErrorResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseCollectionErrorResponse value)  $default,){
final _that = this;
switch (_that) {
case _BaseCollectionErrorResponse():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseCollectionErrorResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BaseCollectionErrorResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@CollectionErrorConverter()  List<BaseCollectionError> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseCollectionErrorResponse() when $default != null:
return $default(_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@CollectionErrorConverter()  List<BaseCollectionError> errors)  $default,) {final _that = this;
switch (_that) {
case _BaseCollectionErrorResponse():
return $default(_that.errors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@CollectionErrorConverter()  List<BaseCollectionError> errors)?  $default,) {final _that = this;
switch (_that) {
case _BaseCollectionErrorResponse() when $default != null:
return $default(_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BaseCollectionErrorResponse extends BaseCollectionErrorResponse {
  const _BaseCollectionErrorResponse({@CollectionErrorConverter() required final  List<BaseCollectionError> errors}): _errors = errors,super._();
  factory _BaseCollectionErrorResponse.fromJson(Map<String, dynamic> json) => _$BaseCollectionErrorResponseFromJson(json);

 final  List<BaseCollectionError> _errors;
@override@CollectionErrorConverter() List<BaseCollectionError> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of BaseCollectionErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseCollectionErrorResponseCopyWith<_BaseCollectionErrorResponse> get copyWith => __$BaseCollectionErrorResponseCopyWithImpl<_BaseCollectionErrorResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BaseCollectionErrorResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseCollectionErrorResponse&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'BaseCollectionErrorResponse(errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$BaseCollectionErrorResponseCopyWith<$Res> implements $BaseCollectionErrorResponseCopyWith<$Res> {
  factory _$BaseCollectionErrorResponseCopyWith(_BaseCollectionErrorResponse value, $Res Function(_BaseCollectionErrorResponse) _then) = __$BaseCollectionErrorResponseCopyWithImpl;
@override @useResult
$Res call({
@CollectionErrorConverter() List<BaseCollectionError> errors
});




}
/// @nodoc
class __$BaseCollectionErrorResponseCopyWithImpl<$Res>
    implements _$BaseCollectionErrorResponseCopyWith<$Res> {
  __$BaseCollectionErrorResponseCopyWithImpl(this._self, this._then);

  final _BaseCollectionErrorResponse _self;
  final $Res Function(_BaseCollectionErrorResponse) _then;

/// Create a copy of BaseCollectionErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errors = null,}) {
  return _then(_BaseCollectionErrorResponse(
errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<BaseCollectionError>,
  ));
}


}

// dart format on
