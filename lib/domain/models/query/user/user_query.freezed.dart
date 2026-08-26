// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserQuery {

 bool? get active; UserQueryOrder? get order;
/// Create a copy of UserQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserQueryCopyWith<UserQuery> get copyWith => _$UserQueryCopyWithImpl<UserQuery>(this as UserQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserQuery&&(identical(other.active, active) || other.active == active)&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,active,order);

@override
String toString() {
  return 'UserQuery(active: $active, order: $order)';
}


}

/// @nodoc
abstract mixin class $UserQueryCopyWith<$Res>  {
  factory $UserQueryCopyWith(UserQuery value, $Res Function(UserQuery) _then) = _$UserQueryCopyWithImpl;
@useResult
$Res call({
 bool? active, UserQueryOrder? order
});




}
/// @nodoc
class _$UserQueryCopyWithImpl<$Res>
    implements $UserQueryCopyWith<$Res> {
  _$UserQueryCopyWithImpl(this._self, this._then);

  final UserQuery _self;
  final $Res Function(UserQuery) _then;

/// Create a copy of UserQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = freezed,Object? order = freezed,}) {
  return _then(UserQuery(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as UserQueryOrder?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserQuery].
extension UserQueryPatterns on UserQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserQuery value)  $default,){
final _that = this;
switch (_that) {
case _UserQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserQuery value)?  $default,){
final _that = this;
switch (_that) {
case _UserQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? active,  UserQueryOrder? order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserQuery() when $default != null:
return $default(_that.active,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? active,  UserQueryOrder? order)  $default,) {final _that = this;
switch (_that) {
case _UserQuery():
return $default(_that.active,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? active,  UserQueryOrder? order)?  $default,) {final _that = this;
switch (_that) {
case _UserQuery() when $default != null:
return $default(_that.active,_that.order);case _:
  return null;

}
}

}

/// @nodoc


class _UserQuery implements UserQuery {
  const _UserQuery({this.active, this.order});
  

@override final  bool? active;
@override final  UserQueryOrder? order;

/// Create a copy of UserQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserQueryCopyWith<_UserQuery> get copyWith => __$UserQueryCopyWithImpl<_UserQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserQuery&&(identical(other.active, active) || other.active == active)&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,active,order);

@override
String toString() {
  return 'UserQuery(active: $active, order: $order)';
}


}

/// @nodoc
abstract mixin class _$UserQueryCopyWith<$Res> implements $UserQueryCopyWith<$Res> {
  factory _$UserQueryCopyWith(_UserQuery value, $Res Function(_UserQuery) _then) = __$UserQueryCopyWithImpl;
@override @useResult
$Res call({
 bool? active, UserQueryOrder? order
});




}
/// @nodoc
class __$UserQueryCopyWithImpl<$Res>
    implements _$UserQueryCopyWith<$Res> {
  __$UserQueryCopyWithImpl(this._self, this._then);

  final _UserQuery _self;
  final $Res Function(_UserQuery) _then;

/// Create a copy of UserQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = freezed,Object? order = freezed,}) {
  return _then(_UserQuery(
active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as UserQueryOrder?,
  ));
}


}

// dart format on
