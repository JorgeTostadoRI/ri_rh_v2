// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Finger implements DiagnosticableTreeMixin {

 int get id; Hand get hand; FingerName get fingerName; bool get scanned;
/// Create a copy of Finger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FingerCopyWith<Finger> get copyWith => _$FingerCopyWithImpl<Finger>(this as Finger, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Finger'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('hand', hand))..add(DiagnosticsProperty('fingerName', fingerName))..add(DiagnosticsProperty('scanned', scanned));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Finger&&(identical(other.id, id) || other.id == id)&&(identical(other.hand, hand) || other.hand == hand)&&(identical(other.fingerName, fingerName) || other.fingerName == fingerName)&&(identical(other.scanned, scanned) || other.scanned == scanned));
}


@override
int get hashCode => Object.hash(runtimeType,id,hand,fingerName,scanned);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Finger(id: $id, hand: $hand, fingerName: $fingerName, scanned: $scanned)';
}


}

/// @nodoc
abstract mixin class $FingerCopyWith<$Res>  {
  factory $FingerCopyWith(Finger value, $Res Function(Finger) _then) = _$FingerCopyWithImpl;
@useResult
$Res call({
 int id, Hand hand, FingerName fingerName, bool scanned
});




}
/// @nodoc
class _$FingerCopyWithImpl<$Res>
    implements $FingerCopyWith<$Res> {
  _$FingerCopyWithImpl(this._self, this._then);

  final Finger _self;
  final $Res Function(Finger) _then;

/// Create a copy of Finger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hand = null,Object? fingerName = null,Object? scanned = null,}) {
  return _then(Finger(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as Hand,fingerName: null == fingerName ? _self.fingerName : fingerName // ignore: cast_nullable_to_non_nullable
as FingerName,scanned: null == scanned ? _self.scanned : scanned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Finger].
extension FingerPatterns on Finger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Finger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Finger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Finger value)  $default,){
final _that = this;
switch (_that) {
case _Finger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Finger value)?  $default,){
final _that = this;
switch (_that) {
case _Finger() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Hand hand,  FingerName fingerName,  bool scanned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Finger() when $default != null:
return $default(_that.id,_that.hand,_that.fingerName,_that.scanned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Hand hand,  FingerName fingerName,  bool scanned)  $default,) {final _that = this;
switch (_that) {
case _Finger():
return $default(_that.id,_that.hand,_that.fingerName,_that.scanned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Hand hand,  FingerName fingerName,  bool scanned)?  $default,) {final _that = this;
switch (_that) {
case _Finger() when $default != null:
return $default(_that.id,_that.hand,_that.fingerName,_that.scanned);case _:
  return null;

}
}

}

/// @nodoc


class _Finger with DiagnosticableTreeMixin implements Finger {
  const _Finger({required this.id, required this.hand, required this.fingerName, required this.scanned});
  

@override final  int id;
@override final  Hand hand;
@override final  FingerName fingerName;
@override final  bool scanned;

/// Create a copy of Finger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FingerCopyWith<_Finger> get copyWith => __$FingerCopyWithImpl<_Finger>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Finger'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('hand', hand))..add(DiagnosticsProperty('fingerName', fingerName))..add(DiagnosticsProperty('scanned', scanned));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Finger&&(identical(other.id, id) || other.id == id)&&(identical(other.hand, hand) || other.hand == hand)&&(identical(other.fingerName, fingerName) || other.fingerName == fingerName)&&(identical(other.scanned, scanned) || other.scanned == scanned));
}


@override
int get hashCode => Object.hash(runtimeType,id,hand,fingerName,scanned);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Finger(id: $id, hand: $hand, fingerName: $fingerName, scanned: $scanned)';
}


}

/// @nodoc
abstract mixin class _$FingerCopyWith<$Res> implements $FingerCopyWith<$Res> {
  factory _$FingerCopyWith(_Finger value, $Res Function(_Finger) _then) = __$FingerCopyWithImpl;
@override @useResult
$Res call({
 int id, Hand hand, FingerName fingerName, bool scanned
});




}
/// @nodoc
class __$FingerCopyWithImpl<$Res>
    implements _$FingerCopyWith<$Res> {
  __$FingerCopyWithImpl(this._self, this._then);

  final _Finger _self;
  final $Res Function(_Finger) _then;

/// Create a copy of Finger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hand = null,Object? fingerName = null,Object? scanned = null,}) {
  return _then(_Finger(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,hand: null == hand ? _self.hand : hand // ignore: cast_nullable_to_non_nullable
as Hand,fingerName: null == fingerName ? _self.fingerName : fingerName // ignore: cast_nullable_to_non_nullable
as FingerName,scanned: null == scanned ? _self.scanned : scanned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
