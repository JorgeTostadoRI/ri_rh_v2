// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserApiModel implements DiagnosticableTreeMixin {

 int get id; String get username; String get nombre; String get telefono; String get correo; String get rol; DepartamentoApiModel get departamento; List<DepartamentoApiModel> get departamentosPermitidos; bool get liderPermitido; int? get empleadoId;
/// Create a copy of UserApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserApiModelCopyWith<UserApiModel> get copyWith => _$UserApiModelCopyWithImpl<UserApiModel>(this as UserApiModel, _$identity);

  /// Serializes this UserApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamento', departamento))..add(DiagnosticsProperty('departamentosPermitidos', departamentosPermitidos))..add(DiagnosticsProperty('liderPermitido', liderPermitido))..add(DiagnosticsProperty('empleadoId', empleadoId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamento, departamento) || other.departamento == departamento)&&const DeepCollectionEquality().equals(other.departamentosPermitidos, departamentosPermitidos)&&(identical(other.liderPermitido, liderPermitido) || other.liderPermitido == liderPermitido)&&(identical(other.empleadoId, empleadoId) || other.empleadoId == empleadoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,telefono,correo,rol,departamento,const DeepCollectionEquality().hash(departamentosPermitidos),liderPermitido,empleadoId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserApiModel(id: $id, username: $username, nombre: $nombre, telefono: $telefono, correo: $correo, rol: $rol, departamento: $departamento, departamentosPermitidos: $departamentosPermitidos, liderPermitido: $liderPermitido, empleadoId: $empleadoId)';
}


}

/// @nodoc
abstract mixin class $UserApiModelCopyWith<$Res>  {
  factory $UserApiModelCopyWith(UserApiModel value, $Res Function(UserApiModel) _then) = _$UserApiModelCopyWithImpl;
@useResult
$Res call({
 int id, String username, String nombre, String telefono, String correo, String rol, DepartamentoApiModel departamento, List<DepartamentoApiModel> departamentosPermitidos, bool liderPermitido, int? empleadoId
});


$DepartamentoApiModelCopyWith<$Res> get departamento;

}
/// @nodoc
class _$UserApiModelCopyWithImpl<$Res>
    implements $UserApiModelCopyWith<$Res> {
  _$UserApiModelCopyWithImpl(this._self, this._then);

  final UserApiModel _self;
  final $Res Function(UserApiModel) _then;

/// Create a copy of UserApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? telefono = null,Object? correo = null,Object? rol = null,Object? departamento = null,Object? departamentosPermitidos = null,Object? liderPermitido = null,Object? empleadoId = freezed,}) {
  return _then(UserApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,departamento: null == departamento ? _self.departamento : departamento // ignore: cast_nullable_to_non_nullable
as DepartamentoApiModel,departamentosPermitidos: null == departamentosPermitidos ? _self.departamentosPermitidos : departamentosPermitidos // ignore: cast_nullable_to_non_nullable
as List<DepartamentoApiModel>,liderPermitido: null == liderPermitido ? _self.liderPermitido : liderPermitido // ignore: cast_nullable_to_non_nullable
as bool,empleadoId: freezed == empleadoId ? _self.empleadoId : empleadoId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of UserApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartamentoApiModelCopyWith<$Res> get departamento {
  
  return $DepartamentoApiModelCopyWith<$Res>(_self.departamento, (value) {
    return _then(_self.copyWith(departamento: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserApiModel].
extension UserApiModelPatterns on UserApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserApiModel value)  $default,){
final _that = this;
switch (_that) {
case _UserApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String telefono,  String correo,  String rol,  DepartamentoApiModel departamento,  List<DepartamentoApiModel> departamentosPermitidos,  bool liderPermitido,  int? empleadoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserApiModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String nombre,  String telefono,  String correo,  String rol,  DepartamentoApiModel departamento,  List<DepartamentoApiModel> departamentosPermitidos,  bool liderPermitido,  int? empleadoId)  $default,) {final _that = this;
switch (_that) {
case _UserApiModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String nombre,  String telefono,  String correo,  String rol,  DepartamentoApiModel departamento,  List<DepartamentoApiModel> departamentosPermitidos,  bool liderPermitido,  int? empleadoId)?  $default,) {final _that = this;
switch (_that) {
case _UserApiModel() when $default != null:
return $default(_that.id,_that.username,_that.nombre,_that.telefono,_that.correo,_that.rol,_that.departamento,_that.departamentosPermitidos,_that.liderPermitido,_that.empleadoId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserApiModel with DiagnosticableTreeMixin implements UserApiModel {
  const _UserApiModel({required this.id, required this.username, required this.nombre, required this.telefono, required this.correo, required this.rol, required this.departamento, required  List<DepartamentoApiModel> departamentosPermitidos, required this.liderPermitido, this.empleadoId}): _departamentosPermitidos = departamentosPermitidos;
  factory _UserApiModel.fromJson(Map<String, dynamic> json) => _$UserApiModelFromJson(json);

@override final  int id;
@override final  String username;
@override final  String nombre;
@override final  String telefono;
@override final  String correo;
@override final  String rol;
@override final  DepartamentoApiModel departamento;
 final  List<DepartamentoApiModel> _departamentosPermitidos;
@override List<DepartamentoApiModel> get departamentosPermitidos {
  if (_departamentosPermitidos is EqualUnmodifiableListView) return _departamentosPermitidos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departamentosPermitidos);
}

@override final  bool liderPermitido;
@override final  int? empleadoId;

/// Create a copy of UserApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserApiModelCopyWith<_UserApiModel> get copyWith => __$UserApiModelCopyWithImpl<_UserApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo))..add(DiagnosticsProperty('rol', rol))..add(DiagnosticsProperty('departamento', departamento))..add(DiagnosticsProperty('departamentosPermitidos', departamentosPermitidos))..add(DiagnosticsProperty('liderPermitido', liderPermitido))..add(DiagnosticsProperty('empleadoId', empleadoId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.departamento, departamento) || other.departamento == departamento)&&const DeepCollectionEquality().equals(other._departamentosPermitidos, _departamentosPermitidos)&&(identical(other.liderPermitido, liderPermitido) || other.liderPermitido == liderPermitido)&&(identical(other.empleadoId, empleadoId) || other.empleadoId == empleadoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,nombre,telefono,correo,rol,departamento,const DeepCollectionEquality().hash(_departamentosPermitidos),liderPermitido,empleadoId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserApiModel(id: $id, username: $username, nombre: $nombre, telefono: $telefono, correo: $correo, rol: $rol, departamento: $departamento, departamentosPermitidos: $departamentosPermitidos, liderPermitido: $liderPermitido, empleadoId: $empleadoId)';
}


}

/// @nodoc
abstract mixin class _$UserApiModelCopyWith<$Res> implements $UserApiModelCopyWith<$Res> {
  factory _$UserApiModelCopyWith(_UserApiModel value, $Res Function(_UserApiModel) _then) = __$UserApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String nombre, String telefono, String correo, String rol, DepartamentoApiModel departamento, List<DepartamentoApiModel> departamentosPermitidos, bool liderPermitido, int? empleadoId
});


@override $DepartamentoApiModelCopyWith<$Res> get departamento;

}
/// @nodoc
class __$UserApiModelCopyWithImpl<$Res>
    implements _$UserApiModelCopyWith<$Res> {
  __$UserApiModelCopyWithImpl(this._self, this._then);

  final _UserApiModel _self;
  final $Res Function(_UserApiModel) _then;

/// Create a copy of UserApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? nombre = null,Object? telefono = null,Object? correo = null,Object? rol = null,Object? departamento = null,Object? departamentosPermitidos = null,Object? liderPermitido = null,Object? empleadoId = freezed,}) {
  return _then(_UserApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String,departamento: null == departamento ? _self.departamento : departamento // ignore: cast_nullable_to_non_nullable
as DepartamentoApiModel,departamentosPermitidos: null == departamentosPermitidos ? _self._departamentosPermitidos : departamentosPermitidos // ignore: cast_nullable_to_non_nullable
as List<DepartamentoApiModel>,liderPermitido: null == liderPermitido ? _self.liderPermitido : liderPermitido // ignore: cast_nullable_to_non_nullable
as bool,empleadoId: freezed == empleadoId ? _self.empleadoId : empleadoId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of UserApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartamentoApiModelCopyWith<$Res> get departamento {
  
  return $DepartamentoApiModelCopyWith<$Res>(_self.departamento, (value) {
    return _then(_self.copyWith(departamento: value));
  });
}
}


/// @nodoc
mixin _$DepartamentoApiModel implements DiagnosticableTreeMixin {

 int get id; String get nombre; String get descripcion; String get presupuesto; Divisa get divisa; LiderApiModel? get lider;
/// Create a copy of DepartamentoApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartamentoApiModelCopyWith<DepartamentoApiModel> get copyWith => _$DepartamentoApiModelCopyWithImpl<DepartamentoApiModel>(this as DepartamentoApiModel, _$identity);

  /// Serializes this DepartamentoApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DepartamentoApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('descripcion', descripcion))..add(DiagnosticsProperty('presupuesto', presupuesto))..add(DiagnosticsProperty('divisa', divisa))..add(DiagnosticsProperty('lider', lider));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartamentoApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.presupuesto, presupuesto) || other.presupuesto == presupuesto)&&(identical(other.divisa, divisa) || other.divisa == divisa)&&(identical(other.lider, lider) || other.lider == lider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,presupuesto,divisa,lider);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DepartamentoApiModel(id: $id, nombre: $nombre, descripcion: $descripcion, presupuesto: $presupuesto, divisa: $divisa, lider: $lider)';
}


}

/// @nodoc
abstract mixin class $DepartamentoApiModelCopyWith<$Res>  {
  factory $DepartamentoApiModelCopyWith(DepartamentoApiModel value, $Res Function(DepartamentoApiModel) _then) = _$DepartamentoApiModelCopyWithImpl;
@useResult
$Res call({
 int id, String nombre, String descripcion, String presupuesto, Divisa divisa, LiderApiModel? lider
});


$LiderApiModelCopyWith<$Res>? get lider;

}
/// @nodoc
class _$DepartamentoApiModelCopyWithImpl<$Res>
    implements $DepartamentoApiModelCopyWith<$Res> {
  _$DepartamentoApiModelCopyWithImpl(this._self, this._then);

  final DepartamentoApiModel _self;
  final $Res Function(DepartamentoApiModel) _then;

/// Create a copy of DepartamentoApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? presupuesto = null,Object? divisa = null,Object? lider = freezed,}) {
  return _then(DepartamentoApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,presupuesto: null == presupuesto ? _self.presupuesto : presupuesto // ignore: cast_nullable_to_non_nullable
as String,divisa: null == divisa ? _self.divisa : divisa // ignore: cast_nullable_to_non_nullable
as Divisa,lider: freezed == lider ? _self.lider : lider // ignore: cast_nullable_to_non_nullable
as LiderApiModel?,
  ));
}
/// Create a copy of DepartamentoApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiderApiModelCopyWith<$Res>? get lider {
    if (_self.lider == null) {
    return null;
  }

  return $LiderApiModelCopyWith<$Res>(_self.lider!, (value) {
    return _then(_self.copyWith(lider: value));
  });
}
}


/// Adds pattern-matching-related methods to [DepartamentoApiModel].
extension DepartamentoApiModelPatterns on DepartamentoApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartamentoApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartamentoApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartamentoApiModel value)  $default,){
final _that = this;
switch (_that) {
case _DepartamentoApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartamentoApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _DepartamentoApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nombre,  String descripcion,  String presupuesto,  Divisa divisa,  LiderApiModel? lider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartamentoApiModel() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.presupuesto,_that.divisa,_that.lider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nombre,  String descripcion,  String presupuesto,  Divisa divisa,  LiderApiModel? lider)  $default,) {final _that = this;
switch (_that) {
case _DepartamentoApiModel():
return $default(_that.id,_that.nombre,_that.descripcion,_that.presupuesto,_that.divisa,_that.lider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nombre,  String descripcion,  String presupuesto,  Divisa divisa,  LiderApiModel? lider)?  $default,) {final _that = this;
switch (_that) {
case _DepartamentoApiModel() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.presupuesto,_that.divisa,_that.lider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartamentoApiModel with DiagnosticableTreeMixin implements DepartamentoApiModel {
  const _DepartamentoApiModel({required this.id, required this.nombre, required this.descripcion, required this.presupuesto, required this.divisa, this.lider});
  factory _DepartamentoApiModel.fromJson(Map<String, dynamic> json) => _$DepartamentoApiModelFromJson(json);

@override final  int id;
@override final  String nombre;
@override final  String descripcion;
@override final  String presupuesto;
@override final  Divisa divisa;
@override final  LiderApiModel? lider;

/// Create a copy of DepartamentoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartamentoApiModelCopyWith<_DepartamentoApiModel> get copyWith => __$DepartamentoApiModelCopyWithImpl<_DepartamentoApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartamentoApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DepartamentoApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('descripcion', descripcion))..add(DiagnosticsProperty('presupuesto', presupuesto))..add(DiagnosticsProperty('divisa', divisa))..add(DiagnosticsProperty('lider', lider));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartamentoApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.presupuesto, presupuesto) || other.presupuesto == presupuesto)&&(identical(other.divisa, divisa) || other.divisa == divisa)&&(identical(other.lider, lider) || other.lider == lider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,presupuesto,divisa,lider);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DepartamentoApiModel(id: $id, nombre: $nombre, descripcion: $descripcion, presupuesto: $presupuesto, divisa: $divisa, lider: $lider)';
}


}

/// @nodoc
abstract mixin class _$DepartamentoApiModelCopyWith<$Res> implements $DepartamentoApiModelCopyWith<$Res> {
  factory _$DepartamentoApiModelCopyWith(_DepartamentoApiModel value, $Res Function(_DepartamentoApiModel) _then) = __$DepartamentoApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String nombre, String descripcion, String presupuesto, Divisa divisa, LiderApiModel? lider
});


@override $LiderApiModelCopyWith<$Res>? get lider;

}
/// @nodoc
class __$DepartamentoApiModelCopyWithImpl<$Res>
    implements _$DepartamentoApiModelCopyWith<$Res> {
  __$DepartamentoApiModelCopyWithImpl(this._self, this._then);

  final _DepartamentoApiModel _self;
  final $Res Function(_DepartamentoApiModel) _then;

/// Create a copy of DepartamentoApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = null,Object? presupuesto = null,Object? divisa = null,Object? lider = freezed,}) {
  return _then(_DepartamentoApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: null == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String,presupuesto: null == presupuesto ? _self.presupuesto : presupuesto // ignore: cast_nullable_to_non_nullable
as String,divisa: null == divisa ? _self.divisa : divisa // ignore: cast_nullable_to_non_nullable
as Divisa,lider: freezed == lider ? _self.lider : lider // ignore: cast_nullable_to_non_nullable
as LiderApiModel?,
  ));
}

/// Create a copy of DepartamentoApiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiderApiModelCopyWith<$Res>? get lider {
    if (_self.lider == null) {
    return null;
  }

  return $LiderApiModelCopyWith<$Res>(_self.lider!, (value) {
    return _then(_self.copyWith(lider: value));
  });
}
}


/// @nodoc
mixin _$LiderApiModel implements DiagnosticableTreeMixin {

 int get id; String get nombre; String get telefono; String get correo;
/// Create a copy of LiderApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiderApiModelCopyWith<LiderApiModel> get copyWith => _$LiderApiModelCopyWithImpl<LiderApiModel>(this as LiderApiModel, _$identity);

  /// Serializes this LiderApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LiderApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiderApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,telefono,correo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LiderApiModel(id: $id, nombre: $nombre, telefono: $telefono, correo: $correo)';
}


}

/// @nodoc
abstract mixin class $LiderApiModelCopyWith<$Res>  {
  factory $LiderApiModelCopyWith(LiderApiModel value, $Res Function(LiderApiModel) _then) = _$LiderApiModelCopyWithImpl;
@useResult
$Res call({
 int id, String nombre, String telefono, String correo
});




}
/// @nodoc
class _$LiderApiModelCopyWithImpl<$Res>
    implements $LiderApiModelCopyWith<$Res> {
  _$LiderApiModelCopyWithImpl(this._self, this._then);

  final LiderApiModel _self;
  final $Res Function(LiderApiModel) _then;

/// Create a copy of LiderApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? telefono = null,Object? correo = null,}) {
  return _then(LiderApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LiderApiModel].
extension LiderApiModelPatterns on LiderApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiderApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiderApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiderApiModel value)  $default,){
final _that = this;
switch (_that) {
case _LiderApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiderApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiderApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String nombre,  String telefono,  String correo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiderApiModel() when $default != null:
return $default(_that.id,_that.nombre,_that.telefono,_that.correo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String nombre,  String telefono,  String correo)  $default,) {final _that = this;
switch (_that) {
case _LiderApiModel():
return $default(_that.id,_that.nombre,_that.telefono,_that.correo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String nombre,  String telefono,  String correo)?  $default,) {final _that = this;
switch (_that) {
case _LiderApiModel() when $default != null:
return $default(_that.id,_that.nombre,_that.telefono,_that.correo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiderApiModel with DiagnosticableTreeMixin implements LiderApiModel {
  const _LiderApiModel({required this.id, required this.nombre, required this.telefono, required this.correo});
  factory _LiderApiModel.fromJson(Map<String, dynamic> json) => _$LiderApiModelFromJson(json);

@override final  int id;
@override final  String nombre;
@override final  String telefono;
@override final  String correo;

/// Create a copy of LiderApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiderApiModelCopyWith<_LiderApiModel> get copyWith => __$LiderApiModelCopyWithImpl<_LiderApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiderApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LiderApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('telefono', telefono))..add(DiagnosticsProperty('correo', correo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiderApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.correo, correo) || other.correo == correo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,telefono,correo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LiderApiModel(id: $id, nombre: $nombre, telefono: $telefono, correo: $correo)';
}


}

/// @nodoc
abstract mixin class _$LiderApiModelCopyWith<$Res> implements $LiderApiModelCopyWith<$Res> {
  factory _$LiderApiModelCopyWith(_LiderApiModel value, $Res Function(_LiderApiModel) _then) = __$LiderApiModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String nombre, String telefono, String correo
});




}
/// @nodoc
class __$LiderApiModelCopyWithImpl<$Res>
    implements _$LiderApiModelCopyWith<$Res> {
  __$LiderApiModelCopyWithImpl(this._self, this._then);

  final _LiderApiModel _self;
  final $Res Function(_LiderApiModel) _then;

/// Create a copy of LiderApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? telefono = null,Object? correo = null,}) {
  return _then(_LiderApiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,telefono: null == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String,correo: null == correo ? _self.correo : correo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
