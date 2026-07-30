// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reporte_asistencia_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReporteAsistenciaResponse implements DiagnosticableTreeMixin {

 DateTime get startDate; DateTime get endDate; List<ReporteAsistenciaUser> get users;
/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteAsistenciaResponseCopyWith<ReporteAsistenciaResponse> get copyWith => _$ReporteAsistenciaResponseCopyWithImpl<ReporteAsistenciaResponse>(this as ReporteAsistenciaResponse, _$identity);

  /// Serializes this ReporteAsistenciaResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaResponse'))
    ..add(DiagnosticsProperty('startDate', startDate))..add(DiagnosticsProperty('endDate', endDate))..add(DiagnosticsProperty('users', users));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteAsistenciaResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.users, users));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(users));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaResponse(startDate: $startDate, endDate: $endDate, users: $users)';
}


}

/// @nodoc
abstract mixin class $ReporteAsistenciaResponseCopyWith<$Res>  {
  factory $ReporteAsistenciaResponseCopyWith(ReporteAsistenciaResponse value, $Res Function(ReporteAsistenciaResponse) _then) = _$ReporteAsistenciaResponseCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate, List<ReporteAsistenciaUser> users
});




}
/// @nodoc
class _$ReporteAsistenciaResponseCopyWithImpl<$Res>
    implements $ReporteAsistenciaResponseCopyWith<$Res> {
  _$ReporteAsistenciaResponseCopyWithImpl(this._self, this._then);

  final ReporteAsistenciaResponse _self;
  final $Res Function(ReporteAsistenciaResponse) _then;

/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,Object? users = null,}) {
  return _then(ReporteAsistenciaResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<ReporteAsistenciaUser>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteAsistenciaResponse].
extension ReporteAsistenciaResponsePatterns on ReporteAsistenciaResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteAsistenciaResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteAsistenciaResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteAsistenciaResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  List<ReporteAsistenciaUser> users)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.users);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate,  List<ReporteAsistenciaUser> users)  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse():
return $default(_that.startDate,_that.endDate,_that.users);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate,  List<ReporteAsistenciaUser> users)?  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaResponse() when $default != null:
return $default(_that.startDate,_that.endDate,_that.users);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteAsistenciaResponse with DiagnosticableTreeMixin implements ReporteAsistenciaResponse {
  const _ReporteAsistenciaResponse({required this.startDate, required this.endDate, required  List<ReporteAsistenciaUser> users}): _users = users;
  factory _ReporteAsistenciaResponse.fromJson(Map<String, dynamic> json) => _$ReporteAsistenciaResponseFromJson(json);

@override final  DateTime startDate;
@override final  DateTime endDate;
 final  List<ReporteAsistenciaUser> _users;
@override List<ReporteAsistenciaUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteAsistenciaResponseCopyWith<_ReporteAsistenciaResponse> get copyWith => __$ReporteAsistenciaResponseCopyWithImpl<_ReporteAsistenciaResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteAsistenciaResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaResponse'))
    ..add(DiagnosticsProperty('startDate', startDate))..add(DiagnosticsProperty('endDate', endDate))..add(DiagnosticsProperty('users', users));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteAsistenciaResponse&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._users, _users));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate,const DeepCollectionEquality().hash(_users));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaResponse(startDate: $startDate, endDate: $endDate, users: $users)';
}


}

/// @nodoc
abstract mixin class _$ReporteAsistenciaResponseCopyWith<$Res> implements $ReporteAsistenciaResponseCopyWith<$Res> {
  factory _$ReporteAsistenciaResponseCopyWith(_ReporteAsistenciaResponse value, $Res Function(_ReporteAsistenciaResponse) _then) = __$ReporteAsistenciaResponseCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate, List<ReporteAsistenciaUser> users
});




}
/// @nodoc
class __$ReporteAsistenciaResponseCopyWithImpl<$Res>
    implements _$ReporteAsistenciaResponseCopyWith<$Res> {
  __$ReporteAsistenciaResponseCopyWithImpl(this._self, this._then);

  final _ReporteAsistenciaResponse _self;
  final $Res Function(_ReporteAsistenciaResponse) _then;

/// Create a copy of ReporteAsistenciaResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,Object? users = null,}) {
  return _then(_ReporteAsistenciaResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<ReporteAsistenciaUser>,
  ));
}


}


/// @nodoc
mixin _$ReporteAsistenciaUser implements DiagnosticableTreeMixin {

 int get id; String get username; String get nombre; String get rol;@JsonKey(name: 'departamento') int get departamentoRef; List<AsistenciaApiModel> get asistencia; int get totalMinutesLate;
/// Create a copy of ReporteAsistenciaUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReporteAsistenciaUserCopyWith<ReporteAsistenciaUser> get copyWith => _$ReporteAsistenciaUserCopyWithImpl<ReporteAsistenciaUser>(this as ReporteAsistenciaUser, _$identity);

  /// Serializes this ReporteAsistenciaUser to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaUser'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamentoRef', departamentoRef))..add(DiagnosticsProperty('asistencia', asistencia))..add(DiagnosticsProperty('totalMinutesLate', totalMinutesLate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReporteAsistenciaUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamentoRef, departamentoRef) || other.departamentoRef == departamentoRef)&&const DeepCollectionEquality().equals(other.asistencia, asistencia)&&(identical(other.totalMinutesLate, totalMinutesLate) || other.totalMinutesLate == totalMinutesLate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,rol,departamentoRef,const DeepCollectionEquality().hash(asistencia),totalMinutesLate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaUser(id: $id, username: $username, nombre: $nombre, rol: $rol, departamentoRef: $departamentoRef, asistencia: $asistencia, totalMinutesLate: $totalMinutesLate)';
}


}

/// @nodoc
abstract mixin class $ReporteAsistenciaUserCopyWith<$Res>  {
  factory $ReporteAsistenciaUserCopyWith(ReporteAsistenciaUser value, $Res Function(ReporteAsistenciaUser) _then) = _$ReporteAsistenciaUserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String nombre, String rol,@JsonKey(name: 'departamento') int departamentoRef, List<AsistenciaApiModel> asistencia, int totalMinutesLate
});




}
/// @nodoc
class _$ReporteAsistenciaUserCopyWithImpl<$Res>
    implements $ReporteAsistenciaUserCopyWith<$Res> {
  _$ReporteAsistenciaUserCopyWithImpl(this._self, this._then);

  final ReporteAsistenciaUser _self;
  final $Res Function(ReporteAsistenciaUser) _then;

/// Create a copy of ReporteAsistenciaUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? rol = null,Object? departamentoRef = null,Object? asistencia = null,Object? totalMinutesLate = null,}) {
  return _then(ReporteAsistenciaUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,departamentoRef: null == departamentoRef ? _self.departamentoRef : departamentoRef // ignore: cast_nullable_to_non_nullable
as int,asistencia: null == asistencia ? _self.asistencia : asistencia // ignore: cast_nullable_to_non_nullable
as List<AsistenciaApiModel>,totalMinutesLate: null == totalMinutesLate ? _self.totalMinutesLate : totalMinutesLate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReporteAsistenciaUser].
extension ReporteAsistenciaUserPatterns on ReporteAsistenciaUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReporteAsistenciaUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReporteAsistenciaUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReporteAsistenciaUser value)  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReporteAsistenciaUser value)?  $default,){
final _that = this;
switch (_that) {
case _ReporteAsistenciaUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String rol, @JsonKey(name: 'departamento')  int departamentoRef,  List<AsistenciaApiModel> asistencia,  int totalMinutesLate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReporteAsistenciaUser() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.rol,_that.departamentoRef,_that.asistencia,_that.totalMinutesLate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String rol, @JsonKey(name: 'departamento')  int departamentoRef,  List<AsistenciaApiModel> asistencia,  int totalMinutesLate)  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaUser():
return $default(_that.id,_that.username,_that.nombre,_that.rol,_that.departamentoRef,_that.asistencia,_that.totalMinutesLate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String nombre,  String rol, @JsonKey(name: 'departamento')  int departamentoRef,  List<AsistenciaApiModel> asistencia,  int totalMinutesLate)?  $default,) {final _that = this;
switch (_that) {
case _ReporteAsistenciaUser() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.rol,_that.departamentoRef,_that.asistencia,_that.totalMinutesLate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReporteAsistenciaUser with DiagnosticableTreeMixin implements ReporteAsistenciaUser {
  const _ReporteAsistenciaUser({required this.id, required this.username, required this.nombre, required this.rol, @JsonKey(name: 'departamento') required this.departamentoRef, required  List<AsistenciaApiModel> asistencia, required this.totalMinutesLate}): _asistencia = asistencia;
  factory _ReporteAsistenciaUser.fromJson(Map<String, dynamic> json) => _$ReporteAsistenciaUserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String nombre;
@override final  String rol;
@override@JsonKey(name: 'departamento') final  int departamentoRef;
 final  List<AsistenciaApiModel> _asistencia;
@override List<AsistenciaApiModel> get asistencia {
  if (_asistencia is EqualUnmodifiableListView) return _asistencia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_asistencia);
}

@override final  int totalMinutesLate;

/// Create a copy of ReporteAsistenciaUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReporteAsistenciaUserCopyWith<_ReporteAsistenciaUser> get copyWith => __$ReporteAsistenciaUserCopyWithImpl<_ReporteAsistenciaUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReporteAsistenciaUserToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ReporteAsistenciaUser'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamentoRef', departamentoRef))..add(DiagnosticsProperty('asistencia', asistencia))..add(DiagnosticsProperty('totalMinutesLate', totalMinutesLate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReporteAsistenciaUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamentoRef, departamentoRef) || other.departamentoRef == departamentoRef)&&const DeepCollectionEquality().equals(other._asistencia, _asistencia)&&(identical(other.totalMinutesLate, totalMinutesLate) || other.totalMinutesLate == totalMinutesLate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,rol,departamentoRef,const DeepCollectionEquality().hash(_asistencia),totalMinutesLate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ReporteAsistenciaUser(id: $id, username: $username, nombre: $nombre, rol: $rol, departamentoRef: $departamentoRef, asistencia: $asistencia, totalMinutesLate: $totalMinutesLate)';
}


}

/// @nodoc
abstract mixin class _$ReporteAsistenciaUserCopyWith<$Res> implements $ReporteAsistenciaUserCopyWith<$Res> {
  factory _$ReporteAsistenciaUserCopyWith(_ReporteAsistenciaUser value, $Res Function(_ReporteAsistenciaUser) _then) = __$ReporteAsistenciaUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String nombre, String rol,@JsonKey(name: 'departamento') int departamentoRef, List<AsistenciaApiModel> asistencia, int totalMinutesLate
});




}
/// @nodoc
class __$ReporteAsistenciaUserCopyWithImpl<$Res>
    implements _$ReporteAsistenciaUserCopyWith<$Res> {
  __$ReporteAsistenciaUserCopyWithImpl(this._self, this._then);

  final _ReporteAsistenciaUser _self;
  final $Res Function(_ReporteAsistenciaUser) _then;

/// Create a copy of ReporteAsistenciaUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? rol = null,Object? departamentoRef = null,Object? asistencia = null,Object? totalMinutesLate = null,}) {
  return _then(_ReporteAsistenciaUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,departamentoRef: null == departamentoRef ? _self.departamentoRef : departamentoRef // ignore: cast_nullable_to_non_nullable
as int,asistencia: null == asistencia ? _self._asistencia : asistencia // ignore: cast_nullable_to_non_nullable
as List<AsistenciaApiModel>,totalMinutesLate: null == totalMinutesLate ? _self.totalMinutesLate : totalMinutesLate // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
