// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credenciales_generadas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CredencialesGeneradas implements DiagnosticableTreeMixin {

 String get username; String get password;
/// Create a copy of CredencialesGeneradas
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CredencialesGeneradasCopyWith<CredencialesGeneradas> get copyWith => _$CredencialesGeneradasCopyWithImpl<CredencialesGeneradas>(this as CredencialesGeneradas, _$identity);

  /// Serializes this CredencialesGeneradas to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CredencialesGeneradas'))
    ..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CredencialesGeneradas&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CredencialesGeneradas(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $CredencialesGeneradasCopyWith<$Res>  {
  factory $CredencialesGeneradasCopyWith(CredencialesGeneradas value, $Res Function(CredencialesGeneradas) _then) = _$CredencialesGeneradasCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class _$CredencialesGeneradasCopyWithImpl<$Res>
    implements $CredencialesGeneradasCopyWith<$Res> {
  _$CredencialesGeneradasCopyWithImpl(this._self, this._then);

  final CredencialesGeneradas _self;
  final $Res Function(CredencialesGeneradas) _then;

/// Create a copy of CredencialesGeneradas
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,}) {
  return _then(CredencialesGeneradas(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CredencialesGeneradas].
extension CredencialesGeneradasPatterns on CredencialesGeneradas {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CredencialesGeneradas value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CredencialesGeneradas() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CredencialesGeneradas value)  $default,){
final _that = this;
switch (_that) {
case _CredencialesGeneradas():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CredencialesGeneradas value)?  $default,){
final _that = this;
switch (_that) {
case _CredencialesGeneradas() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CredencialesGeneradas() when $default != null:
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _CredencialesGeneradas():
return $default(_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _CredencialesGeneradas() when $default != null:
return $default(_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CredencialesGeneradas with DiagnosticableTreeMixin implements CredencialesGeneradas {
  const _CredencialesGeneradas({required this.username, required this.password});
  factory _CredencialesGeneradas.fromJson(Map<String, dynamic> json) => _$CredencialesGeneradasFromJson(json);

@override final  String username;
@override final  String password;

/// Create a copy of CredencialesGeneradas
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CredencialesGeneradasCopyWith<_CredencialesGeneradas> get copyWith => __$CredencialesGeneradasCopyWithImpl<_CredencialesGeneradas>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CredencialesGeneradasToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CredencialesGeneradas'))
    ..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CredencialesGeneradas&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CredencialesGeneradas(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$CredencialesGeneradasCopyWith<$Res> implements $CredencialesGeneradasCopyWith<$Res> {
  factory _$CredencialesGeneradasCopyWith(_CredencialesGeneradas value, $Res Function(_CredencialesGeneradas) _then) = __$CredencialesGeneradasCopyWithImpl;
@override @useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class __$CredencialesGeneradasCopyWithImpl<$Res>
    implements _$CredencialesGeneradasCopyWith<$Res> {
  __$CredencialesGeneradasCopyWithImpl(this._self, this._then);

  final _CredencialesGeneradas _self;
  final $Res Function(_CredencialesGeneradas) _then;

/// Create a copy of CredencialesGeneradas
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(_CredencialesGeneradas(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
