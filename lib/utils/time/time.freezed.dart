// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Time {

 int get hour; int get minute; int get second;
/// Create a copy of Time
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeCopyWith<Time> get copyWith => _$TimeCopyWithImpl<Time>(this as Time, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Time&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.second, second) || other.second == second));
}


@override
int get hashCode => Object.hash(runtimeType,hour,minute,second);



}

/// @nodoc
abstract mixin class $TimeCopyWith<$Res>  {
  factory $TimeCopyWith(Time value, $Res Function(Time) _then) = _$TimeCopyWithImpl;
@useResult
$Res call({
 int hour, int minute, int second
});




}
/// @nodoc
class _$TimeCopyWithImpl<$Res>
    implements $TimeCopyWith<$Res> {
  _$TimeCopyWithImpl(this._self, this._then);

  final Time _self;
  final $Res Function(Time) _then;

/// Create a copy of Time
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hour = null,Object? minute = null,Object? second = null,}) {
  return _then(Time(
null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Time].
extension TimePatterns on Time {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Time value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Time() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Time value)  $default,){
final _that = this;
switch (_that) {
case _Time():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Time value)?  $default,){
final _that = this;
switch (_that) {
case _Time() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int hour,  int minute,  int second)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Time() when $default != null:
return $default(_that.hour,_that.minute,_that.second);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int hour,  int minute,  int second)  $default,) {final _that = this;
switch (_that) {
case _Time():
return $default(_that.hour,_that.minute,_that.second);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int hour,  int minute,  int second)?  $default,) {final _that = this;
switch (_that) {
case _Time() when $default != null:
return $default(_that.hour,_that.minute,_that.second);case _:
  return null;

}
}

}

/// @nodoc


class _Time implements Time {
  const _Time(this.hour, [this.minute = 0, this.second = 0]);
  

@override final  int hour;
@override@JsonKey() final  int minute;
@override@JsonKey() final  int second;

/// Create a copy of Time
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeCopyWith<_Time> get copyWith => __$TimeCopyWithImpl<_Time>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Time&&(identical(other.hour, hour) || other.hour == hour)&&(identical(other.minute, minute) || other.minute == minute)&&(identical(other.second, second) || other.second == second));
}


@override
int get hashCode => Object.hash(runtimeType,hour,minute,second);



}

/// @nodoc
abstract mixin class _$TimeCopyWith<$Res> implements $TimeCopyWith<$Res> {
  factory _$TimeCopyWith(_Time value, $Res Function(_Time) _then) = __$TimeCopyWithImpl;
@override @useResult
$Res call({
 int hour, int minute, int second
});




}
/// @nodoc
class __$TimeCopyWithImpl<$Res>
    implements _$TimeCopyWith<$Res> {
  __$TimeCopyWithImpl(this._self, this._then);

  final _Time _self;
  final $Res Function(_Time) _then;

/// Create a copy of Time
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hour = null,Object? minute = null,Object? second = null,}) {
  return _then(_Time(
null == hour ? _self.hour : hour // ignore: cast_nullable_to_non_nullable
as int,null == minute ? _self.minute : minute // ignore: cast_nullable_to_non_nullable
as int,null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
