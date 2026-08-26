// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incidencia_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncidenciaQuery {

/// List of states to filter
 List<IncidenciaState> get state; DateTimeRange<DateTime>? get startRange; List<IncidenciaCategory> get categories; List<int> get solicitores;
/// Create a copy of IncidenciaQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidenciaQueryCopyWith<IncidenciaQuery> get copyWith => _$IncidenciaQueryCopyWithImpl<IncidenciaQuery>(this as IncidenciaQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidenciaQuery&&const DeepCollectionEquality().equals(other.state, state)&&(identical(other.startRange, startRange) || other.startRange == startRange)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.solicitores, solicitores));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(state),startRange,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(solicitores));

@override
String toString() {
  return 'IncidenciaQuery(state: $state, startRange: $startRange, categories: $categories, solicitores: $solicitores)';
}


}

/// @nodoc
abstract mixin class $IncidenciaQueryCopyWith<$Res>  {
  factory $IncidenciaQueryCopyWith(IncidenciaQuery value, $Res Function(IncidenciaQuery) _then) = _$IncidenciaQueryCopyWithImpl;
@useResult
$Res call({
 List<IncidenciaState> state, DateTimeRange<DateTime>? startRange, List<IncidenciaCategory> categories, List<int> solicitores
});




}
/// @nodoc
class _$IncidenciaQueryCopyWithImpl<$Res>
    implements $IncidenciaQueryCopyWith<$Res> {
  _$IncidenciaQueryCopyWithImpl(this._self, this._then);

  final IncidenciaQuery _self;
  final $Res Function(IncidenciaQuery) _then;

/// Create a copy of IncidenciaQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? startRange = freezed,Object? categories = null,Object? solicitores = null,}) {
  return _then(IncidenciaQuery(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as List<IncidenciaState>,startRange: freezed == startRange ? _self.startRange : startRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange<DateTime>?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<IncidenciaCategory>,solicitores: null == solicitores ? _self.solicitores : solicitores // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidenciaQuery].
extension IncidenciaQueryPatterns on IncidenciaQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidenciaQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidenciaQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidenciaQuery value)  $default,){
final _that = this;
switch (_that) {
case _IncidenciaQuery():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidenciaQuery value)?  $default,){
final _that = this;
switch (_that) {
case _IncidenciaQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IncidenciaState> state,  DateTimeRange<DateTime>? startRange,  List<IncidenciaCategory> categories,  List<int> solicitores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidenciaQuery() when $default != null:
return $default(_that.state,_that.startRange,_that.categories,_that.solicitores);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IncidenciaState> state,  DateTimeRange<DateTime>? startRange,  List<IncidenciaCategory> categories,  List<int> solicitores)  $default,) {final _that = this;
switch (_that) {
case _IncidenciaQuery():
return $default(_that.state,_that.startRange,_that.categories,_that.solicitores);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IncidenciaState> state,  DateTimeRange<DateTime>? startRange,  List<IncidenciaCategory> categories,  List<int> solicitores)?  $default,) {final _that = this;
switch (_that) {
case _IncidenciaQuery() when $default != null:
return $default(_that.state,_that.startRange,_that.categories,_that.solicitores);case _:
  return null;

}
}

}

/// @nodoc


class _IncidenciaQuery implements IncidenciaQuery {
  const _IncidenciaQuery({ List<IncidenciaState> state = const [], this.startRange,  List<IncidenciaCategory> categories = const [],  List<int> solicitores = const []}): _state = state,_categories = categories,_solicitores = solicitores;
  

/// List of states to filter
 final  List<IncidenciaState> _state;
/// List of states to filter
@override@JsonKey() List<IncidenciaState> get state {
  if (_state is EqualUnmodifiableListView) return _state;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_state);
}

@override final  DateTimeRange<DateTime>? startRange;
 final  List<IncidenciaCategory> _categories;
@override@JsonKey() List<IncidenciaCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<int> _solicitores;
@override@JsonKey() List<int> get solicitores {
  if (_solicitores is EqualUnmodifiableListView) return _solicitores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_solicitores);
}


/// Create a copy of IncidenciaQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidenciaQueryCopyWith<_IncidenciaQuery> get copyWith => __$IncidenciaQueryCopyWithImpl<_IncidenciaQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidenciaQuery&&const DeepCollectionEquality().equals(other._state, _state)&&(identical(other.startRange, startRange) || other.startRange == startRange)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._solicitores, _solicitores));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_state),startRange,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_solicitores));

@override
String toString() {
  return 'IncidenciaQuery(state: $state, startRange: $startRange, categories: $categories, solicitores: $solicitores)';
}


}

/// @nodoc
abstract mixin class _$IncidenciaQueryCopyWith<$Res> implements $IncidenciaQueryCopyWith<$Res> {
  factory _$IncidenciaQueryCopyWith(_IncidenciaQuery value, $Res Function(_IncidenciaQuery) _then) = __$IncidenciaQueryCopyWithImpl;
@override @useResult
$Res call({
 List<IncidenciaState> state, DateTimeRange<DateTime>? startRange, List<IncidenciaCategory> categories, List<int> solicitores
});




}
/// @nodoc
class __$IncidenciaQueryCopyWithImpl<$Res>
    implements _$IncidenciaQueryCopyWith<$Res> {
  __$IncidenciaQueryCopyWithImpl(this._self, this._then);

  final _IncidenciaQuery _self;
  final $Res Function(_IncidenciaQuery) _then;

/// Create a copy of IncidenciaQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? startRange = freezed,Object? categories = null,Object? solicitores = null,}) {
  return _then(_IncidenciaQuery(
state: null == state ? _self._state : state // ignore: cast_nullable_to_non_nullable
as List<IncidenciaState>,startRange: freezed == startRange ? _self.startRange : startRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange<DateTime>?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<IncidenciaCategory>,solicitores: null == solicitores ? _self._solicitores : solicitores // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
