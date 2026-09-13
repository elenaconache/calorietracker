// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipe_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchRecipeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipeEvent()';
}


}

/// @nodoc
class $SearchRecipeEventCopyWith<$Res>  {
$SearchRecipeEventCopyWith(SearchRecipeEvent _, $Res Function(SearchRecipeEvent) __);
}


/// Adds pattern-matching-related methods to [SearchRecipeEvent].
extension SearchRecipeEventPatterns on SearchRecipeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestRecipesSubscriptionEvent value)?  requestRecipesSubscription,TResult Function( FindRecipeEvent value)?  findRecipe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestRecipesSubscriptionEvent() when requestRecipesSubscription != null:
return requestRecipesSubscription(_that);case FindRecipeEvent() when findRecipe != null:
return findRecipe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestRecipesSubscriptionEvent value)  requestRecipesSubscription,required TResult Function( FindRecipeEvent value)  findRecipe,}){
final _that = this;
switch (_that) {
case RequestRecipesSubscriptionEvent():
return requestRecipesSubscription(_that);case FindRecipeEvent():
return findRecipe(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestRecipesSubscriptionEvent value)?  requestRecipesSubscription,TResult? Function( FindRecipeEvent value)?  findRecipe,}){
final _that = this;
switch (_that) {
case RequestRecipesSubscriptionEvent() when requestRecipesSubscription != null:
return requestRecipesSubscription(_that);case FindRecipeEvent() when findRecipe != null:
return findRecipe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requestRecipesSubscription,TResult Function( String query)?  findRecipe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestRecipesSubscriptionEvent() when requestRecipesSubscription != null:
return requestRecipesSubscription();case FindRecipeEvent() when findRecipe != null:
return findRecipe(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requestRecipesSubscription,required TResult Function( String query)  findRecipe,}) {final _that = this;
switch (_that) {
case RequestRecipesSubscriptionEvent():
return requestRecipesSubscription();case FindRecipeEvent():
return findRecipe(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requestRecipesSubscription,TResult? Function( String query)?  findRecipe,}) {final _that = this;
switch (_that) {
case RequestRecipesSubscriptionEvent() when requestRecipesSubscription != null:
return requestRecipesSubscription();case FindRecipeEvent() when findRecipe != null:
return findRecipe(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class RequestRecipesSubscriptionEvent implements SearchRecipeEvent {
  const RequestRecipesSubscriptionEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestRecipesSubscriptionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipeEvent.requestRecipesSubscription()';
}


}




/// @nodoc


class FindRecipeEvent implements SearchRecipeEvent {
  const FindRecipeEvent({required this.query});
  

 final  String query;

/// Create a copy of SearchRecipeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FindRecipeEventCopyWith<FindRecipeEvent> get copyWith => _$FindRecipeEventCopyWithImpl<FindRecipeEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FindRecipeEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchRecipeEvent.findRecipe(query: $query)';
}


}

/// @nodoc
abstract mixin class $FindRecipeEventCopyWith<$Res> implements $SearchRecipeEventCopyWith<$Res> {
  factory $FindRecipeEventCopyWith(FindRecipeEvent value, $Res Function(FindRecipeEvent) _then) = _$FindRecipeEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$FindRecipeEventCopyWithImpl<$Res>
    implements $FindRecipeEventCopyWith<$Res> {
  _$FindRecipeEventCopyWithImpl(this._self, this._then);

  final FindRecipeEvent _self;
  final $Res Function(FindRecipeEvent) _then;

/// Create a copy of SearchRecipeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(FindRecipeEvent(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
