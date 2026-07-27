// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_empleado.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BaseEmpleado implements DiagnosticableTreeMixin {

 int get id; User? get user; String get nombre; DateTime get nacidoEn; String get clabeInterbancaria; String get numeroContacto; String get contactoEmergencia; String get rfc; String get curp; String get nss; String get direccion; Puesto get puesto; double get salario; DateTime? get registradoEn; DateTime? get finalizadoEn; BaseEmpleadoFiles get files;
/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseEmpleadoCopyWith<BaseEmpleado> get copyWith => _$BaseEmpleadoCopyWithImpl<BaseEmpleado>(this as BaseEmpleado, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BaseEmpleado'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('nacidoEn', nacidoEn))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('nss', nss))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('puesto', puesto))..add(DiagnosticsProperty('salario', salario))..add(DiagnosticsProperty('registradoEn', registradoEn))..add(DiagnosticsProperty('finalizadoEn', finalizadoEn))..add(DiagnosticsProperty('files', files));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseEmpleado&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.nacidoEn, nacidoEn) || other.nacidoEn == nacidoEn)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.nss, nss) || other.nss == nss)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.puesto, puesto) || other.puesto == puesto)&&(identical(other.salario, salario) || other.salario == salario)&&(identical(other.registradoEn, registradoEn) || other.registradoEn == registradoEn)&&(identical(other.finalizadoEn, finalizadoEn) || other.finalizadoEn == finalizadoEn)&&(identical(other.files, files) || other.files == files));
}


@override
int get hashCode => Object.hash(runtimeType,id,user,nombre,nacidoEn,clabeInterbancaria,numeroContacto,contactoEmergencia,rfc,curp,nss,direccion,puesto,salario,registradoEn,finalizadoEn,files);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BaseEmpleado(id: $id, user: $user, nombre: $nombre, nacidoEn: $nacidoEn, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, rfc: $rfc, curp: $curp, nss: $nss, direccion: $direccion, puesto: $puesto, salario: $salario, registradoEn: $registradoEn, finalizadoEn: $finalizadoEn, files: $files)';
}


}

/// @nodoc
abstract mixin class $BaseEmpleadoCopyWith<$Res>  {
  factory $BaseEmpleadoCopyWith(BaseEmpleado value, $Res Function(BaseEmpleado) _then) = _$BaseEmpleadoCopyWithImpl;
@useResult
$Res call({
 int id, User? user, String nombre, DateTime nacidoEn, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String rfc, String curp, String nss, String direccion, Puesto puesto, double salario, DateTime? registradoEn, DateTime? finalizadoEn, BaseEmpleadoFiles files
});


$UserCopyWith<$Res>? get user;$PuestoCopyWith<$Res> get puesto;$BaseEmpleadoFilesCopyWith<$Res> get files;

}
/// @nodoc
class _$BaseEmpleadoCopyWithImpl<$Res>
    implements $BaseEmpleadoCopyWith<$Res> {
  _$BaseEmpleadoCopyWithImpl(this._self, this._then);

  final BaseEmpleado _self;
  final $Res Function(BaseEmpleado) _then;

/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = freezed,Object? nombre = null,Object? nacidoEn = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? rfc = null,Object? curp = null,Object? nss = null,Object? direccion = null,Object? puesto = null,Object? salario = null,Object? registradoEn = freezed,Object? finalizadoEn = freezed,Object? files = null,}) {
  return _then(BaseEmpleado(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,nacidoEn: null == nacidoEn ? _self.nacidoEn : nacidoEn // ignore: cast_nullable_to_non_nullable
as DateTime,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,nss: null == nss ? _self.nss : nss // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,puesto: null == puesto ? _self.puesto : puesto // ignore: cast_nullable_to_non_nullable
as Puesto,salario: null == salario ? _self.salario : salario // ignore: cast_nullable_to_non_nullable
as double,registradoEn: freezed == registradoEn ? _self.registradoEn : registradoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,finalizadoEn: freezed == finalizadoEn ? _self.finalizadoEn : finalizadoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as BaseEmpleadoFiles,
  ));
}
/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PuestoCopyWith<$Res> get puesto {
  
  return $PuestoCopyWith<$Res>(_self.puesto, (value) {
    return _then(_self.copyWith(puesto: value));
  });
}/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseEmpleadoFilesCopyWith<$Res> get files {
  
  return $BaseEmpleadoFilesCopyWith<$Res>(_self.files, (value) {
    return _then(_self.copyWith(files: value));
  });
}
}


/// Adds pattern-matching-related methods to [BaseEmpleado].
extension BaseEmpleadoPatterns on BaseEmpleado {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseEmpleado value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseEmpleado() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseEmpleado value)  $default,){
final _that = this;
switch (_that) {
case _BaseEmpleado():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseEmpleado value)?  $default,){
final _that = this;
switch (_that) {
case _BaseEmpleado() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User? user,  String nombre,  DateTime nacidoEn,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp,  String nss,  String direccion,  Puesto puesto,  double salario,  DateTime? registradoEn,  DateTime? finalizadoEn,  BaseEmpleadoFiles files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseEmpleado() when $default != null:
return $default(_that.id,_that.user,_that.nombre,_that.nacidoEn,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.nss,_that.direccion,_that.puesto,_that.salario,_that.registradoEn,_that.finalizadoEn,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User? user,  String nombre,  DateTime nacidoEn,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp,  String nss,  String direccion,  Puesto puesto,  double salario,  DateTime? registradoEn,  DateTime? finalizadoEn,  BaseEmpleadoFiles files)  $default,) {final _that = this;
switch (_that) {
case _BaseEmpleado():
return $default(_that.id,_that.user,_that.nombre,_that.nacidoEn,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.nss,_that.direccion,_that.puesto,_that.salario,_that.registradoEn,_that.finalizadoEn,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User? user,  String nombre,  DateTime nacidoEn,  String clabeInterbancaria,  String numeroContacto,  String contactoEmergencia,  String rfc,  String curp,  String nss,  String direccion,  Puesto puesto,  double salario,  DateTime? registradoEn,  DateTime? finalizadoEn,  BaseEmpleadoFiles files)?  $default,) {final _that = this;
switch (_that) {
case _BaseEmpleado() when $default != null:
return $default(_that.id,_that.user,_that.nombre,_that.nacidoEn,_that.clabeInterbancaria,_that.numeroContacto,_that.contactoEmergencia,_that.rfc,_that.curp,_that.nss,_that.direccion,_that.puesto,_that.salario,_that.registradoEn,_that.finalizadoEn,_that.files);case _:
  return null;

}
}

}

/// @nodoc


class _BaseEmpleado with DiagnosticableTreeMixin implements BaseEmpleado {
  const _BaseEmpleado({this.id = 0, this.user, required this.nombre, required this.nacidoEn, required this.clabeInterbancaria, required this.numeroContacto, required this.contactoEmergencia, required this.rfc, required this.curp, required this.nss, required this.direccion, required this.puesto, required this.salario, this.registradoEn, this.finalizadoEn, required this.files});
  

@override@JsonKey() final  int id;
@override final  User? user;
@override final  String nombre;
@override final  DateTime nacidoEn;
@override final  String clabeInterbancaria;
@override final  String numeroContacto;
@override final  String contactoEmergencia;
@override final  String rfc;
@override final  String curp;
@override final  String nss;
@override final  String direccion;
@override final  Puesto puesto;
@override final  double salario;
@override final  DateTime? registradoEn;
@override final  DateTime? finalizadoEn;
@override final  BaseEmpleadoFiles files;

/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseEmpleadoCopyWith<_BaseEmpleado> get copyWith => __$BaseEmpleadoCopyWithImpl<_BaseEmpleado>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BaseEmpleado'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('nombre', nombre))..add(DiagnosticsProperty('nacidoEn', nacidoEn))..add(DiagnosticsProperty('clabeInterbancaria', clabeInterbancaria))..add(DiagnosticsProperty('numeroContacto', numeroContacto))..add(DiagnosticsProperty('contactoEmergencia', contactoEmergencia))..add(DiagnosticsProperty('rfc', rfc))..add(DiagnosticsProperty('curp', curp))..add(DiagnosticsProperty('nss', nss))..add(DiagnosticsProperty('direccion', direccion))..add(DiagnosticsProperty('puesto', puesto))..add(DiagnosticsProperty('salario', salario))..add(DiagnosticsProperty('registradoEn', registradoEn))..add(DiagnosticsProperty('finalizadoEn', finalizadoEn))..add(DiagnosticsProperty('files', files));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseEmpleado&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.nacidoEn, nacidoEn) || other.nacidoEn == nacidoEn)&&(identical(other.clabeInterbancaria, clabeInterbancaria) || other.clabeInterbancaria == clabeInterbancaria)&&(identical(other.numeroContacto, numeroContacto) || other.numeroContacto == numeroContacto)&&(identical(other.contactoEmergencia, contactoEmergencia) || other.contactoEmergencia == contactoEmergencia)&&(identical(other.rfc, rfc) || other.rfc == rfc)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.nss, nss) || other.nss == nss)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.puesto, puesto) || other.puesto == puesto)&&(identical(other.salario, salario) || other.salario == salario)&&(identical(other.registradoEn, registradoEn) || other.registradoEn == registradoEn)&&(identical(other.finalizadoEn, finalizadoEn) || other.finalizadoEn == finalizadoEn)&&(identical(other.files, files) || other.files == files));
}


@override
int get hashCode => Object.hash(runtimeType,id,user,nombre,nacidoEn,clabeInterbancaria,numeroContacto,contactoEmergencia,rfc,curp,nss,direccion,puesto,salario,registradoEn,finalizadoEn,files);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BaseEmpleado(id: $id, user: $user, nombre: $nombre, nacidoEn: $nacidoEn, clabeInterbancaria: $clabeInterbancaria, numeroContacto: $numeroContacto, contactoEmergencia: $contactoEmergencia, rfc: $rfc, curp: $curp, nss: $nss, direccion: $direccion, puesto: $puesto, salario: $salario, registradoEn: $registradoEn, finalizadoEn: $finalizadoEn, files: $files)';
}


}

/// @nodoc
abstract mixin class _$BaseEmpleadoCopyWith<$Res> implements $BaseEmpleadoCopyWith<$Res> {
  factory _$BaseEmpleadoCopyWith(_BaseEmpleado value, $Res Function(_BaseEmpleado) _then) = __$BaseEmpleadoCopyWithImpl;
@override @useResult
$Res call({
 int id, User? user, String nombre, DateTime nacidoEn, String clabeInterbancaria, String numeroContacto, String contactoEmergencia, String rfc, String curp, String nss, String direccion, Puesto puesto, double salario, DateTime? registradoEn, DateTime? finalizadoEn, BaseEmpleadoFiles files
});


@override $UserCopyWith<$Res>? get user;@override $PuestoCopyWith<$Res> get puesto;@override $BaseEmpleadoFilesCopyWith<$Res> get files;

}
/// @nodoc
class __$BaseEmpleadoCopyWithImpl<$Res>
    implements _$BaseEmpleadoCopyWith<$Res> {
  __$BaseEmpleadoCopyWithImpl(this._self, this._then);

  final _BaseEmpleado _self;
  final $Res Function(_BaseEmpleado) _then;

/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = freezed,Object? nombre = null,Object? nacidoEn = null,Object? clabeInterbancaria = null,Object? numeroContacto = null,Object? contactoEmergencia = null,Object? rfc = null,Object? curp = null,Object? nss = null,Object? direccion = null,Object? puesto = null,Object? salario = null,Object? registradoEn = freezed,Object? finalizadoEn = freezed,Object? files = null,}) {
  return _then(_BaseEmpleado(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,nacidoEn: null == nacidoEn ? _self.nacidoEn : nacidoEn // ignore: cast_nullable_to_non_nullable
as DateTime,clabeInterbancaria: null == clabeInterbancaria ? _self.clabeInterbancaria : clabeInterbancaria // ignore: cast_nullable_to_non_nullable
as String,numeroContacto: null == numeroContacto ? _self.numeroContacto : numeroContacto // ignore: cast_nullable_to_non_nullable
as String,contactoEmergencia: null == contactoEmergencia ? _self.contactoEmergencia : contactoEmergencia // ignore: cast_nullable_to_non_nullable
as String,rfc: null == rfc ? _self.rfc : rfc // ignore: cast_nullable_to_non_nullable
as String,curp: null == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String,nss: null == nss ? _self.nss : nss // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,puesto: null == puesto ? _self.puesto : puesto // ignore: cast_nullable_to_non_nullable
as Puesto,salario: null == salario ? _self.salario : salario // ignore: cast_nullable_to_non_nullable
as double,registradoEn: freezed == registradoEn ? _self.registradoEn : registradoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,finalizadoEn: freezed == finalizadoEn ? _self.finalizadoEn : finalizadoEn // ignore: cast_nullable_to_non_nullable
as DateTime?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as BaseEmpleadoFiles,
  ));
}

/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PuestoCopyWith<$Res> get puesto {
  
  return $PuestoCopyWith<$Res>(_self.puesto, (value) {
    return _then(_self.copyWith(puesto: value));
  });
}/// Create a copy of BaseEmpleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseEmpleadoFilesCopyWith<$Res> get files {
  
  return $BaseEmpleadoFilesCopyWith<$Res>(_self.files, (value) {
    return _then(_self.copyWith(files: value));
  });
}
}

/// @nodoc
mixin _$BaseEmpleadoFiles implements DiagnosticableTreeMixin {

 String? get ineUrl; String? get actaNacimientoUrl; String? get estadoCuentaUrl; String? get curpUrl; String? get nssUrl; String? get domicilioUrl; String? get cvUrl;
/// Create a copy of BaseEmpleadoFiles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseEmpleadoFilesCopyWith<BaseEmpleadoFiles> get copyWith => _$BaseEmpleadoFilesCopyWithImpl<BaseEmpleadoFiles>(this as BaseEmpleadoFiles, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BaseEmpleadoFiles'))
    ..add(DiagnosticsProperty('ineUrl', ineUrl))..add(DiagnosticsProperty('actaNacimientoUrl', actaNacimientoUrl))..add(DiagnosticsProperty('estadoCuentaUrl', estadoCuentaUrl))..add(DiagnosticsProperty('curpUrl', curpUrl))..add(DiagnosticsProperty('nssUrl', nssUrl))..add(DiagnosticsProperty('domicilioUrl', domicilioUrl))..add(DiagnosticsProperty('cvUrl', cvUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseEmpleadoFiles&&(identical(other.ineUrl, ineUrl) || other.ineUrl == ineUrl)&&(identical(other.actaNacimientoUrl, actaNacimientoUrl) || other.actaNacimientoUrl == actaNacimientoUrl)&&(identical(other.estadoCuentaUrl, estadoCuentaUrl) || other.estadoCuentaUrl == estadoCuentaUrl)&&(identical(other.curpUrl, curpUrl) || other.curpUrl == curpUrl)&&(identical(other.nssUrl, nssUrl) || other.nssUrl == nssUrl)&&(identical(other.domicilioUrl, domicilioUrl) || other.domicilioUrl == domicilioUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl));
}


@override
int get hashCode => Object.hash(runtimeType,ineUrl,actaNacimientoUrl,estadoCuentaUrl,curpUrl,nssUrl,domicilioUrl,cvUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BaseEmpleadoFiles(ineUrl: $ineUrl, actaNacimientoUrl: $actaNacimientoUrl, estadoCuentaUrl: $estadoCuentaUrl, curpUrl: $curpUrl, nssUrl: $nssUrl, domicilioUrl: $domicilioUrl, cvUrl: $cvUrl)';
}


}

/// @nodoc
abstract mixin class $BaseEmpleadoFilesCopyWith<$Res>  {
  factory $BaseEmpleadoFilesCopyWith(BaseEmpleadoFiles value, $Res Function(BaseEmpleadoFiles) _then) = _$BaseEmpleadoFilesCopyWithImpl;
@useResult
$Res call({
 String? ineUrl, String? actaNacimientoUrl, String? estadoCuentaUrl, String? curpUrl, String? nssUrl, String? domicilioUrl, String? cvUrl
});




}
/// @nodoc
class _$BaseEmpleadoFilesCopyWithImpl<$Res>
    implements $BaseEmpleadoFilesCopyWith<$Res> {
  _$BaseEmpleadoFilesCopyWithImpl(this._self, this._then);

  final BaseEmpleadoFiles _self;
  final $Res Function(BaseEmpleadoFiles) _then;

/// Create a copy of BaseEmpleadoFiles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ineUrl = freezed,Object? actaNacimientoUrl = freezed,Object? estadoCuentaUrl = freezed,Object? curpUrl = freezed,Object? nssUrl = freezed,Object? domicilioUrl = freezed,Object? cvUrl = freezed,}) {
  return _then(BaseEmpleadoFiles(
ineUrl: freezed == ineUrl ? _self.ineUrl : ineUrl // ignore: cast_nullable_to_non_nullable
as String?,actaNacimientoUrl: freezed == actaNacimientoUrl ? _self.actaNacimientoUrl : actaNacimientoUrl // ignore: cast_nullable_to_non_nullable
as String?,estadoCuentaUrl: freezed == estadoCuentaUrl ? _self.estadoCuentaUrl : estadoCuentaUrl // ignore: cast_nullable_to_non_nullable
as String?,curpUrl: freezed == curpUrl ? _self.curpUrl : curpUrl // ignore: cast_nullable_to_non_nullable
as String?,nssUrl: freezed == nssUrl ? _self.nssUrl : nssUrl // ignore: cast_nullable_to_non_nullable
as String?,domicilioUrl: freezed == domicilioUrl ? _self.domicilioUrl : domicilioUrl // ignore: cast_nullable_to_non_nullable
as String?,cvUrl: freezed == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseEmpleadoFiles].
extension BaseEmpleadoFilesPatterns on BaseEmpleadoFiles {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseEmpleadoFiles value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseEmpleadoFiles() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseEmpleadoFiles value)  $default,){
final _that = this;
switch (_that) {
case _BaseEmpleadoFiles():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseEmpleadoFiles value)?  $default,){
final _that = this;
switch (_that) {
case _BaseEmpleadoFiles() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? ineUrl,  String? actaNacimientoUrl,  String? estadoCuentaUrl,  String? curpUrl,  String? nssUrl,  String? domicilioUrl,  String? cvUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseEmpleadoFiles() when $default != null:
return $default(_that.ineUrl,_that.actaNacimientoUrl,_that.estadoCuentaUrl,_that.curpUrl,_that.nssUrl,_that.domicilioUrl,_that.cvUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? ineUrl,  String? actaNacimientoUrl,  String? estadoCuentaUrl,  String? curpUrl,  String? nssUrl,  String? domicilioUrl,  String? cvUrl)  $default,) {final _that = this;
switch (_that) {
case _BaseEmpleadoFiles():
return $default(_that.ineUrl,_that.actaNacimientoUrl,_that.estadoCuentaUrl,_that.curpUrl,_that.nssUrl,_that.domicilioUrl,_that.cvUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? ineUrl,  String? actaNacimientoUrl,  String? estadoCuentaUrl,  String? curpUrl,  String? nssUrl,  String? domicilioUrl,  String? cvUrl)?  $default,) {final _that = this;
switch (_that) {
case _BaseEmpleadoFiles() when $default != null:
return $default(_that.ineUrl,_that.actaNacimientoUrl,_that.estadoCuentaUrl,_that.curpUrl,_that.nssUrl,_that.domicilioUrl,_that.cvUrl);case _:
  return null;

}
}

}

/// @nodoc


class _BaseEmpleadoFiles with DiagnosticableTreeMixin implements BaseEmpleadoFiles {
  const _BaseEmpleadoFiles({this.ineUrl, this.actaNacimientoUrl, this.estadoCuentaUrl, this.curpUrl, this.nssUrl, this.domicilioUrl, this.cvUrl});
  

@override final  String? ineUrl;
@override final  String? actaNacimientoUrl;
@override final  String? estadoCuentaUrl;
@override final  String? curpUrl;
@override final  String? nssUrl;
@override final  String? domicilioUrl;
@override final  String? cvUrl;

/// Create a copy of BaseEmpleadoFiles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseEmpleadoFilesCopyWith<_BaseEmpleadoFiles> get copyWith => __$BaseEmpleadoFilesCopyWithImpl<_BaseEmpleadoFiles>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BaseEmpleadoFiles'))
    ..add(DiagnosticsProperty('ineUrl', ineUrl))..add(DiagnosticsProperty('actaNacimientoUrl', actaNacimientoUrl))..add(DiagnosticsProperty('estadoCuentaUrl', estadoCuentaUrl))..add(DiagnosticsProperty('curpUrl', curpUrl))..add(DiagnosticsProperty('nssUrl', nssUrl))..add(DiagnosticsProperty('domicilioUrl', domicilioUrl))..add(DiagnosticsProperty('cvUrl', cvUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseEmpleadoFiles&&(identical(other.ineUrl, ineUrl) || other.ineUrl == ineUrl)&&(identical(other.actaNacimientoUrl, actaNacimientoUrl) || other.actaNacimientoUrl == actaNacimientoUrl)&&(identical(other.estadoCuentaUrl, estadoCuentaUrl) || other.estadoCuentaUrl == estadoCuentaUrl)&&(identical(other.curpUrl, curpUrl) || other.curpUrl == curpUrl)&&(identical(other.nssUrl, nssUrl) || other.nssUrl == nssUrl)&&(identical(other.domicilioUrl, domicilioUrl) || other.domicilioUrl == domicilioUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl));
}


@override
int get hashCode => Object.hash(runtimeType,ineUrl,actaNacimientoUrl,estadoCuentaUrl,curpUrl,nssUrl,domicilioUrl,cvUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BaseEmpleadoFiles(ineUrl: $ineUrl, actaNacimientoUrl: $actaNacimientoUrl, estadoCuentaUrl: $estadoCuentaUrl, curpUrl: $curpUrl, nssUrl: $nssUrl, domicilioUrl: $domicilioUrl, cvUrl: $cvUrl)';
}


}

/// @nodoc
abstract mixin class _$BaseEmpleadoFilesCopyWith<$Res> implements $BaseEmpleadoFilesCopyWith<$Res> {
  factory _$BaseEmpleadoFilesCopyWith(_BaseEmpleadoFiles value, $Res Function(_BaseEmpleadoFiles) _then) = __$BaseEmpleadoFilesCopyWithImpl;
@override @useResult
$Res call({
 String? ineUrl, String? actaNacimientoUrl, String? estadoCuentaUrl, String? curpUrl, String? nssUrl, String? domicilioUrl, String? cvUrl
});




}
/// @nodoc
class __$BaseEmpleadoFilesCopyWithImpl<$Res>
    implements _$BaseEmpleadoFilesCopyWith<$Res> {
  __$BaseEmpleadoFilesCopyWithImpl(this._self, this._then);

  final _BaseEmpleadoFiles _self;
  final $Res Function(_BaseEmpleadoFiles) _then;

/// Create a copy of BaseEmpleadoFiles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ineUrl = freezed,Object? actaNacimientoUrl = freezed,Object? estadoCuentaUrl = freezed,Object? curpUrl = freezed,Object? nssUrl = freezed,Object? domicilioUrl = freezed,Object? cvUrl = freezed,}) {
  return _then(_BaseEmpleadoFiles(
ineUrl: freezed == ineUrl ? _self.ineUrl : ineUrl // ignore: cast_nullable_to_non_nullable
as String?,actaNacimientoUrl: freezed == actaNacimientoUrl ? _self.actaNacimientoUrl : actaNacimientoUrl // ignore: cast_nullable_to_non_nullable
as String?,estadoCuentaUrl: freezed == estadoCuentaUrl ? _self.estadoCuentaUrl : estadoCuentaUrl // ignore: cast_nullable_to_non_nullable
as String?,curpUrl: freezed == curpUrl ? _self.curpUrl : curpUrl // ignore: cast_nullable_to_non_nullable
as String?,nssUrl: freezed == nssUrl ? _self.nssUrl : nssUrl // ignore: cast_nullable_to_non_nullable
as String?,domicilioUrl: freezed == domicilioUrl ? _self.domicilioUrl : domicilioUrl // ignore: cast_nullable_to_non_nullable
as String?,cvUrl: freezed == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
