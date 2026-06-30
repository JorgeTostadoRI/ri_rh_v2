// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User implements DiagnosticableTreeMixin {

 int get id; String get username; String get nombre; String get telefono; String get correo; String get rol; Departamento get departamento; List<Departamento> get departamentosPermitidos; bool get liderPermitido; int? get empleadoId;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamento', departamento))..add(DiagnosticsProperty('departamentosPermitidos', departamentosPermitidos))..add(DiagnosticsProperty('liderPermitido', liderPermitido))..add(DiagnosticsProperty('empleadoId', empleadoId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamento, departamento) || other.departamento == departamento)&&const DeepCollectionEquality().equals(other.departamentosPermitidos, departamentosPermitidos)&&(identical(other.liderPermitido, liderPermitido) || other.liderPermitido == liderPermitido)&&(identical(other.empleadoId, empleadoId) || other.empleadoId == empleadoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,telefono,correo,rol,departamento,const DeepCollectionEquality().hash(departamentosPermitidos),liderPermitido,empleadoId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(id: $id, username: $username, nombre: $nombre, telefono: $telefono, correo: $correo, rol: $rol, departamento: $departamento, departamentosPermitidos: $departamentosPermitidos, liderPermitido: $liderPermitido, empleadoId: $empleadoId)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String nombre, String telefono, String correo, String rol, Departamento departamento, List<Departamento> departamentosPermitidos, bool liderPermitido, int? empleadoId
});


$DepartamentoCopyWith<$Res> get departamento;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? telefono = null,Object? correo = null,Object? rol = null,Object? departamento = null,Object? departamentosPermitidos = null,Object? liderPermitido = null,Object? empleadoId = freezed,}) {
  return _then(User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,departamento: null == departamento ? _self.departamento : departamento // ignore: cast_nullable_to_non_nullable
as Departamento,departamentosPermitidos: null == departamentosPermitidos ? _self.departamentosPermitidos : departamentosPermitidos // ignore: cast_nullable_to_non_nullable
as List<Departamento>,liderPermitido: null == liderPermitido ? _self.liderPermitido : liderPermitido // ignore: cast_nullable_to_non_nullable
as bool,empleadoId: freezed == empleadoId ? _self.empleadoId : empleadoId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartamentoCopyWith<$Res> get departamento {
  
  return $DepartamentoCopyWith<$Res>(_self.departamento, (value) {
    return _then(_self.copyWith(departamento: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String telefono,  String correo,  String rol,  Departamento departamento,  List<Departamento> departamentosPermitidos,  bool liderPermitido,  int? empleadoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.telefono,_that.correo,_that.rol,_that.departamento,_that.departamentosPermitidos,_that.liderPermitido,_that.empleadoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String telefono,  String correo,  String rol,  Departamento departamento,  List<Departamento> departamentosPermitidos,  bool liderPermitido,  int? empleadoId)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.nombre,_that.telefono,_that.correo,_that.rol,_that.departamento,_that.departamentosPermitidos,_that.liderPermitido,_that.empleadoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String nombre,  String telefono,  String correo,  String rol,  Departamento departamento,  List<Departamento> departamentosPermitidos,  bool liderPermitido,  int? empleadoId)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.telefono,_that.correo,_that.rol,_that.departamento,_that.departamentosPermitidos,_that.liderPermitido,_that.empleadoId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User with DiagnosticableTreeMixin implements User {
  const _User({required this.id, required this.username, required this.nombre, required this.telefono, required this.correo, required this.rol, required this.departamento, required  List<Departamento> departamentosPermitidos, required this.liderPermitido, this.empleadoId}): _departamentosPermitidos = departamentosPermitidos;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String nombre;
@override final  String telefono;
@override final  String correo;
@override final  String rol;
@override final  Departamento departamento;
 final  List<Departamento> _departamentosPermitidos;
@override List<Departamento> get departamentosPermitidos {
  if (_departamentosPermitidos is EqualUnmodifiableListView) return _departamentosPermitidos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departamentosPermitidos);
}

@override final  bool liderPermitido;
@override final  int? empleadoId;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamento', departamento))..add(DiagnosticsProperty('departamentosPermitidos', departamentosPermitidos))..add(DiagnosticsProperty('liderPermitido', liderPermitido))..add(DiagnosticsProperty('empleadoId', empleadoId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamento, departamento) || other.departamento == departamento)&&const DeepCollectionEquality().equals(other._departamentosPermitidos, _departamentosPermitidos)&&(identical(other.liderPermitido, liderPermitido) || other.liderPermitido == liderPermitido)&&(identical(other.empleadoId, empleadoId) || other.empleadoId == empleadoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,telefono,correo,rol,departamento,const DeepCollectionEquality().hash(_departamentosPermitidos),liderPermitido,empleadoId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(id: $id, username: $username, nombre: $nombre, telefono: $telefono, correo: $correo, rol: $rol, departamento: $departamento, departamentosPermitidos: $departamentosPermitidos, liderPermitido: $liderPermitido, empleadoId: $empleadoId)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String nombre, String telefono, String correo, String rol, Departamento departamento, List<Departamento> departamentosPermitidos, bool liderPermitido, int? empleadoId
});


@override $DepartamentoCopyWith<$Res> get departamento;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? telefono = null,Object? correo = null,Object? rol = null,Object? departamento = null,Object? departamentosPermitidos = null,Object? liderPermitido = null,Object? empleadoId = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,departamento: null == departamento ? _self.departamento : departamento // ignore: cast_nullable_to_non_nullable
as Departamento,departamentosPermitidos: null == departamentosPermitidos ? _self._departamentosPermitidos : departamentosPermitidos // ignore: cast_nullable_to_non_nullable
as List<Departamento>,liderPermitido: null == liderPermitido ? _self.liderPermitido : liderPermitido // ignore: cast_nullable_to_non_nullable
as bool,empleadoId: freezed == empleadoId ? _self.empleadoId : empleadoId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartamentoCopyWith<$Res> get departamento {
  
  return $DepartamentoCopyWith<$Res>(_self.departamento, (value) {
    return _then(_self.copyWith(departamento: value));
  });
}
}

// dart format on
