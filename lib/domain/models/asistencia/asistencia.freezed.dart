// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asistencia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Asistencia implements DiagnosticableTreeMixin {

 int get id; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get attendedAt; AsistenciaType? get type; String? get photoUrl;@JsonKey(includeFromJson: false, includeToJson: false) XFile? get photoFile; User get user;
/// Create a copy of Asistencia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AsistenciaCopyWith<Asistencia> get copyWith => _$AsistenciaCopyWithImpl<Asistencia>(this as Asistencia, _$identity);

  /// Serializes this Asistencia to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Asistencia'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('attendedAt', attendedAt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoFile', photoFile))..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Asistencia&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attendedAt, attendedAt) || other.attendedAt == attendedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoFile, photoFile) || other.photoFile == photoFile)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,attendedAt,type,photoUrl,photoFile,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Asistencia(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, attendedAt: $attendedAt, type: $type, photoUrl: $photoUrl, photoFile: $photoFile, user: $user)';
}


}

/// @nodoc
abstract mixin class $AsistenciaCopyWith<$Res>  {
  factory $AsistenciaCopyWith(Asistencia value, $Res Function(Asistencia) _then) = _$AsistenciaCopyWithImpl;
@useResult
$Res call({
 int id, DateTime? createdAt, DateTime? updatedAt, DateTime? attendedAt, AsistenciaType? type, String? photoUrl,@JsonKey(includeFromJson: false, includeToJson: false) XFile? photoFile, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AsistenciaCopyWithImpl<$Res>
    implements $AsistenciaCopyWith<$Res> {
  _$AsistenciaCopyWithImpl(this._self, this._then);

  final Asistencia _self;
  final $Res Function(Asistencia) _then;

/// Create a copy of Asistencia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attendedAt = freezed,Object? type = freezed,Object? photoUrl = freezed,Object? photoFile = freezed,Object? user = null,}) {
  return _then(Asistencia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attendedAt: freezed == attendedAt ? _self.attendedAt : attendedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AsistenciaType?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoFile: freezed == photoFile ? _self.photoFile : photoFile // ignore: cast_nullable_to_non_nullable
as XFile?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of Asistencia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Asistencia].
extension AsistenciaPatterns on Asistencia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Asistencia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Asistencia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Asistencia value)  $default,){
final _that = this;
switch (_that) {
case _Asistencia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Asistencia value)?  $default,){
final _that = this;
switch (_that) {
case _Asistencia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? attendedAt,  AsistenciaType? type,  String? photoUrl, @JsonKey(includeFromJson: false, includeToJson: false)  XFile? photoFile,  User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Asistencia() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attendedAt,_that.type,_that.photoUrl,_that.photoFile,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? attendedAt,  AsistenciaType? type,  String? photoUrl, @JsonKey(includeFromJson: false, includeToJson: false)  XFile? photoFile,  User user)  $default,) {final _that = this;
switch (_that) {
case _Asistencia():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attendedAt,_that.type,_that.photoUrl,_that.photoFile,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? attendedAt,  AsistenciaType? type,  String? photoUrl, @JsonKey(includeFromJson: false, includeToJson: false)  XFile? photoFile,  User user)?  $default,) {final _that = this;
switch (_that) {
case _Asistencia() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attendedAt,_that.type,_that.photoUrl,_that.photoFile,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Asistencia with DiagnosticableTreeMixin implements Asistencia {
  const _Asistencia({this.id = 0, this.createdAt, this.updatedAt, this.attendedAt, this.type, this.photoUrl, @JsonKey(includeFromJson: false, includeToJson: false) this.photoFile, required this.user});
  factory _Asistencia.fromJson(Map<String, dynamic> json) => _$AsistenciaFromJson(json);

@override@JsonKey() final  int id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? attendedAt;
@override final  AsistenciaType? type;
@override final  String? photoUrl;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  XFile? photoFile;
@override final  User user;

/// Create a copy of Asistencia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AsistenciaCopyWith<_Asistencia> get copyWith => __$AsistenciaCopyWithImpl<_Asistencia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AsistenciaToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Asistencia'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('attendedAt', attendedAt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoFile', photoFile))..add(DiagnosticsProperty('user', user));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Asistencia&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attendedAt, attendedAt) || other.attendedAt == attendedAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoFile, photoFile) || other.photoFile == photoFile)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,attendedAt,type,photoUrl,photoFile,user);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Asistencia(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, attendedAt: $attendedAt, type: $type, photoUrl: $photoUrl, photoFile: $photoFile, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AsistenciaCopyWith<$Res> implements $AsistenciaCopyWith<$Res> {
  factory _$AsistenciaCopyWith(_Asistencia value, $Res Function(_Asistencia) _then) = __$AsistenciaCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime? createdAt, DateTime? updatedAt, DateTime? attendedAt, AsistenciaType? type, String? photoUrl,@JsonKey(includeFromJson: false, includeToJson: false) XFile? photoFile, User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AsistenciaCopyWithImpl<$Res>
    implements _$AsistenciaCopyWith<$Res> {
  __$AsistenciaCopyWithImpl(this._self, this._then);

  final _Asistencia _self;
  final $Res Function(_Asistencia) _then;

/// Create a copy of Asistencia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attendedAt = freezed,Object? type = freezed,Object? photoUrl = freezed,Object? photoFile = freezed,Object? user = null,}) {
  return _then(_Asistencia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attendedAt: freezed == attendedAt ? _self.attendedAt : attendedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AsistenciaType?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoFile: freezed == photoFile ? _self.photoFile : photoFile // ignore: cast_nullable_to_non_nullable
as XFile?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of Asistencia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
