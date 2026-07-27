// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'empleado.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Empleado implements DiagnosticableTreeMixin {

 BaseEmpleado get base; Escolaridad get escolaridad; double get montoRetencionInfonavit; EmpleadoEstatus get estatus; int? get antiguedad; int? get diasVacaciones; AltaEmpleo get alta; BajaEmpleo get baja;
/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmpleadoCopyWith<Empleado> get copyWith => _$EmpleadoCopyWithImpl<Empleado>(this as Empleado, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Empleado'))
    ..add(DiagnosticsProperty('base', base))..add(DiagnosticsProperty('escolaridad', escolaridad))..add(DiagnosticsProperty('montoRetencionInfonavit', montoRetencionInfonavit))..add(DiagnosticsProperty('estatus', estatus))..add(DiagnosticsProperty('antiguedad', antiguedad))..add(DiagnosticsProperty('diasVacaciones', diasVacaciones))..add(DiagnosticsProperty('alta', alta))..add(DiagnosticsProperty('baja', baja));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Empleado&&(identical(other.base, base) || other.base == base)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.antiguedad, antiguedad) || other.antiguedad == antiguedad)&&(identical(other.diasVacaciones, diasVacaciones) || other.diasVacaciones == diasVacaciones)&&(identical(other.alta, alta) || other.alta == alta)&&(identical(other.baja, baja) || other.baja == baja));
}


@override
int get hashCode => Object.hash(runtimeType,base,escolaridad,montoRetencionInfonavit,estatus,antiguedad,diasVacaciones,alta,baja);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Empleado(base: $base, escolaridad: $escolaridad, montoRetencionInfonavit: $montoRetencionInfonavit, estatus: $estatus, antiguedad: $antiguedad, diasVacaciones: $diasVacaciones, alta: $alta, baja: $baja)';
}


}

/// @nodoc
abstract mixin class $EmpleadoCopyWith<$Res>  {
  factory $EmpleadoCopyWith(Empleado value, $Res Function(Empleado) _then) = _$EmpleadoCopyWithImpl;
@useResult
$Res call({
 BaseEmpleado base, Escolaridad escolaridad, double montoRetencionInfonavit, EmpleadoEstatus estatus, int? antiguedad, int? diasVacaciones, AltaEmpleo alta, BajaEmpleo baja
});


$BaseEmpleadoCopyWith<$Res> get base;$AltaEmpleoCopyWith<$Res> get alta;$BajaEmpleoCopyWith<$Res> get baja;

}
/// @nodoc
class _$EmpleadoCopyWithImpl<$Res>
    implements $EmpleadoCopyWith<$Res> {
  _$EmpleadoCopyWithImpl(this._self, this._then);

  final Empleado _self;
  final $Res Function(Empleado) _then;

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? escolaridad = null,Object? montoRetencionInfonavit = null,Object? estatus = null,Object? antiguedad = freezed,Object? diasVacaciones = freezed,Object? alta = null,Object? baja = null,}) {
  return _then(Empleado(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as BaseEmpleado,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as Escolaridad,montoRetencionInfonavit: null == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EmpleadoEstatus,antiguedad: freezed == antiguedad ? _self.antiguedad : antiguedad // ignore: cast_nullable_to_non_nullable
as int?,diasVacaciones: freezed == diasVacaciones ? _self.diasVacaciones : diasVacaciones // ignore: cast_nullable_to_non_nullable
as int?,alta: null == alta ? _self.alta : alta // ignore: cast_nullable_to_non_nullable
as AltaEmpleo,baja: null == baja ? _self.baja : baja // ignore: cast_nullable_to_non_nullable
as BajaEmpleo,
  ));
}
/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseEmpleadoCopyWith<$Res> get base {
  
  return $BaseEmpleadoCopyWith<$Res>(_self.base, (value) {
    return _then(_self.copyWith(base: value));
  });
}/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AltaEmpleoCopyWith<$Res> get alta {
  
  return $AltaEmpleoCopyWith<$Res>(_self.alta, (value) {
    return _then(_self.copyWith(alta: value));
  });
}/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BajaEmpleoCopyWith<$Res> get baja {
  
  return $BajaEmpleoCopyWith<$Res>(_self.baja, (value) {
    return _then(_self.copyWith(baja: value));
  });
}
}


/// Adds pattern-matching-related methods to [Empleado].
extension EmpleadoPatterns on Empleado {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Empleado value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Empleado() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Empleado value)  $default,){
final _that = this;
switch (_that) {
case _Empleado():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Empleado value)?  $default,){
final _that = this;
switch (_that) {
case _Empleado() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BaseEmpleado base,  Escolaridad escolaridad,  double montoRetencionInfonavit,  EmpleadoEstatus estatus,  int? antiguedad,  int? diasVacaciones,  AltaEmpleo alta,  BajaEmpleo baja)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Empleado() when $default != null:
return $default(_that.base,_that.escolaridad,_that.montoRetencionInfonavit,_that.estatus,_that.antiguedad,_that.diasVacaciones,_that.alta,_that.baja);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BaseEmpleado base,  Escolaridad escolaridad,  double montoRetencionInfonavit,  EmpleadoEstatus estatus,  int? antiguedad,  int? diasVacaciones,  AltaEmpleo alta,  BajaEmpleo baja)  $default,) {final _that = this;
switch (_that) {
case _Empleado():
return $default(_that.base,_that.escolaridad,_that.montoRetencionInfonavit,_that.estatus,_that.antiguedad,_that.diasVacaciones,_that.alta,_that.baja);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BaseEmpleado base,  Escolaridad escolaridad,  double montoRetencionInfonavit,  EmpleadoEstatus estatus,  int? antiguedad,  int? diasVacaciones,  AltaEmpleo alta,  BajaEmpleo baja)?  $default,) {final _that = this;
switch (_that) {
case _Empleado() when $default != null:
return $default(_that.base,_that.escolaridad,_that.montoRetencionInfonavit,_that.estatus,_that.antiguedad,_that.diasVacaciones,_that.alta,_that.baja);case _:
  return null;

}
}

}

/// @nodoc


class _Empleado with DiagnosticableTreeMixin implements Empleado {
  const _Empleado({required this.base, required this.escolaridad, required this.montoRetencionInfonavit, required this.estatus, this.antiguedad, this.diasVacaciones, required this.alta, required this.baja});
  

@override final  BaseEmpleado base;
@override final  Escolaridad escolaridad;
@override final  double montoRetencionInfonavit;
@override final  EmpleadoEstatus estatus;
@override final  int? antiguedad;
@override final  int? diasVacaciones;
@override final  AltaEmpleo alta;
@override final  BajaEmpleo baja;

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmpleadoCopyWith<_Empleado> get copyWith => __$EmpleadoCopyWithImpl<_Empleado>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Empleado'))
    ..add(DiagnosticsProperty('base', base))..add(DiagnosticsProperty('escolaridad', escolaridad))..add(DiagnosticsProperty('montoRetencionInfonavit', montoRetencionInfonavit))..add(DiagnosticsProperty('estatus', estatus))..add(DiagnosticsProperty('antiguedad', antiguedad))..add(DiagnosticsProperty('diasVacaciones', diasVacaciones))..add(DiagnosticsProperty('alta', alta))..add(DiagnosticsProperty('baja', baja));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empleado&&(identical(other.base, base) || other.base == base)&&(identical(other.escolaridad, escolaridad) || other.escolaridad == escolaridad)&&(identical(other.montoRetencionInfonavit, montoRetencionInfonavit) || other.montoRetencionInfonavit == montoRetencionInfonavit)&&(identical(other.estatus, estatus) || other.estatus == estatus)&&(identical(other.antiguedad, antiguedad) || other.antiguedad == antiguedad)&&(identical(other.diasVacaciones, diasVacaciones) || other.diasVacaciones == diasVacaciones)&&(identical(other.alta, alta) || other.alta == alta)&&(identical(other.baja, baja) || other.baja == baja));
}


@override
int get hashCode => Object.hash(runtimeType,base,escolaridad,montoRetencionInfonavit,estatus,antiguedad,diasVacaciones,alta,baja);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Empleado(base: $base, escolaridad: $escolaridad, montoRetencionInfonavit: $montoRetencionInfonavit, estatus: $estatus, antiguedad: $antiguedad, diasVacaciones: $diasVacaciones, alta: $alta, baja: $baja)';
}


}

/// @nodoc
abstract mixin class _$EmpleadoCopyWith<$Res> implements $EmpleadoCopyWith<$Res> {
  factory _$EmpleadoCopyWith(_Empleado value, $Res Function(_Empleado) _then) = __$EmpleadoCopyWithImpl;
@override @useResult
$Res call({
 BaseEmpleado base, Escolaridad escolaridad, double montoRetencionInfonavit, EmpleadoEstatus estatus, int? antiguedad, int? diasVacaciones, AltaEmpleo alta, BajaEmpleo baja
});


@override $BaseEmpleadoCopyWith<$Res> get base;@override $AltaEmpleoCopyWith<$Res> get alta;@override $BajaEmpleoCopyWith<$Res> get baja;

}
/// @nodoc
class __$EmpleadoCopyWithImpl<$Res>
    implements _$EmpleadoCopyWith<$Res> {
  __$EmpleadoCopyWithImpl(this._self, this._then);

  final _Empleado _self;
  final $Res Function(_Empleado) _then;

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? escolaridad = null,Object? montoRetencionInfonavit = null,Object? estatus = null,Object? antiguedad = freezed,Object? diasVacaciones = freezed,Object? alta = null,Object? baja = null,}) {
  return _then(_Empleado(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as BaseEmpleado,escolaridad: null == escolaridad ? _self.escolaridad : escolaridad // ignore: cast_nullable_to_non_nullable
as Escolaridad,montoRetencionInfonavit: null == montoRetencionInfonavit ? _self.montoRetencionInfonavit : montoRetencionInfonavit // ignore: cast_nullable_to_non_nullable
as double,estatus: null == estatus ? _self.estatus : estatus // ignore: cast_nullable_to_non_nullable
as EmpleadoEstatus,antiguedad: freezed == antiguedad ? _self.antiguedad : antiguedad // ignore: cast_nullable_to_non_nullable
as int?,diasVacaciones: freezed == diasVacaciones ? _self.diasVacaciones : diasVacaciones // ignore: cast_nullable_to_non_nullable
as int?,alta: null == alta ? _self.alta : alta // ignore: cast_nullable_to_non_nullable
as AltaEmpleo,baja: null == baja ? _self.baja : baja // ignore: cast_nullable_to_non_nullable
as BajaEmpleo,
  ));
}

/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BaseEmpleadoCopyWith<$Res> get base {
  
  return $BaseEmpleadoCopyWith<$Res>(_self.base, (value) {
    return _then(_self.copyWith(base: value));
  });
}/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AltaEmpleoCopyWith<$Res> get alta {
  
  return $AltaEmpleoCopyWith<$Res>(_self.alta, (value) {
    return _then(_self.copyWith(alta: value));
  });
}/// Create a copy of Empleado
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BajaEmpleoCopyWith<$Res> get baja {
  
  return $BajaEmpleoCopyWith<$Res>(_self.baja, (value) {
    return _then(_self.copyWith(baja: value));
  });
}
}

/// @nodoc
mixin _$AltaEmpleo implements DiagnosticableTreeMixin {

 String? get constanciaEstudioUrl; String? get constanciaSituacionFiscalUrl; String? get altaImssUrl; String? get avisoInfonavitUrl; String? get cartaRecomendacion1Url; String? get cartaRecomendacion2Url; String? get cartaRecomendacion3Url; String? get cartaNoAntecedentesPenalesUrl; String? get contratoLaboralUrl; String? get cartaOfertaUrl; String? get examenMedicoUrl;
/// Create a copy of AltaEmpleo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AltaEmpleoCopyWith<AltaEmpleo> get copyWith => _$AltaEmpleoCopyWithImpl<AltaEmpleo>(this as AltaEmpleo, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AltaEmpleo'))
    ..add(DiagnosticsProperty('constanciaEstudioUrl', constanciaEstudioUrl))..add(DiagnosticsProperty('constanciaSituacionFiscalUrl', constanciaSituacionFiscalUrl))..add(DiagnosticsProperty('altaImssUrl', altaImssUrl))..add(DiagnosticsProperty('avisoInfonavitUrl', avisoInfonavitUrl))..add(DiagnosticsProperty('cartaRecomendacion1Url', cartaRecomendacion1Url))..add(DiagnosticsProperty('cartaRecomendacion2Url', cartaRecomendacion2Url))..add(DiagnosticsProperty('cartaRecomendacion3Url', cartaRecomendacion3Url))..add(DiagnosticsProperty('cartaNoAntecedentesPenalesUrl', cartaNoAntecedentesPenalesUrl))..add(DiagnosticsProperty('contratoLaboralUrl', contratoLaboralUrl))..add(DiagnosticsProperty('cartaOfertaUrl', cartaOfertaUrl))..add(DiagnosticsProperty('examenMedicoUrl', examenMedicoUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AltaEmpleo&&(identical(other.constanciaEstudioUrl, constanciaEstudioUrl) || other.constanciaEstudioUrl == constanciaEstudioUrl)&&(identical(other.constanciaSituacionFiscalUrl, constanciaSituacionFiscalUrl) || other.constanciaSituacionFiscalUrl == constanciaSituacionFiscalUrl)&&(identical(other.altaImssUrl, altaImssUrl) || other.altaImssUrl == altaImssUrl)&&(identical(other.avisoInfonavitUrl, avisoInfonavitUrl) || other.avisoInfonavitUrl == avisoInfonavitUrl)&&(identical(other.cartaRecomendacion1Url, cartaRecomendacion1Url) || other.cartaRecomendacion1Url == cartaRecomendacion1Url)&&(identical(other.cartaRecomendacion2Url, cartaRecomendacion2Url) || other.cartaRecomendacion2Url == cartaRecomendacion2Url)&&(identical(other.cartaRecomendacion3Url, cartaRecomendacion3Url) || other.cartaRecomendacion3Url == cartaRecomendacion3Url)&&(identical(other.cartaNoAntecedentesPenalesUrl, cartaNoAntecedentesPenalesUrl) || other.cartaNoAntecedentesPenalesUrl == cartaNoAntecedentesPenalesUrl)&&(identical(other.contratoLaboralUrl, contratoLaboralUrl) || other.contratoLaboralUrl == contratoLaboralUrl)&&(identical(other.cartaOfertaUrl, cartaOfertaUrl) || other.cartaOfertaUrl == cartaOfertaUrl)&&(identical(other.examenMedicoUrl, examenMedicoUrl) || other.examenMedicoUrl == examenMedicoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,constanciaEstudioUrl,constanciaSituacionFiscalUrl,altaImssUrl,avisoInfonavitUrl,cartaRecomendacion1Url,cartaRecomendacion2Url,cartaRecomendacion3Url,cartaNoAntecedentesPenalesUrl,contratoLaboralUrl,cartaOfertaUrl,examenMedicoUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AltaEmpleo(constanciaEstudioUrl: $constanciaEstudioUrl, constanciaSituacionFiscalUrl: $constanciaSituacionFiscalUrl, altaImssUrl: $altaImssUrl, avisoInfonavitUrl: $avisoInfonavitUrl, cartaRecomendacion1Url: $cartaRecomendacion1Url, cartaRecomendacion2Url: $cartaRecomendacion2Url, cartaRecomendacion3Url: $cartaRecomendacion3Url, cartaNoAntecedentesPenalesUrl: $cartaNoAntecedentesPenalesUrl, contratoLaboralUrl: $contratoLaboralUrl, cartaOfertaUrl: $cartaOfertaUrl, examenMedicoUrl: $examenMedicoUrl)';
}


}

/// @nodoc
abstract mixin class $AltaEmpleoCopyWith<$Res>  {
  factory $AltaEmpleoCopyWith(AltaEmpleo value, $Res Function(AltaEmpleo) _then) = _$AltaEmpleoCopyWithImpl;
@useResult
$Res call({
 String? constanciaEstudioUrl, String? constanciaSituacionFiscalUrl, String? altaImssUrl, String? avisoInfonavitUrl, String? cartaRecomendacion1Url, String? cartaRecomendacion2Url, String? cartaRecomendacion3Url, String? cartaNoAntecedentesPenalesUrl, String? contratoLaboralUrl, String? cartaOfertaUrl, String? examenMedicoUrl
});




}
/// @nodoc
class _$AltaEmpleoCopyWithImpl<$Res>
    implements $AltaEmpleoCopyWith<$Res> {
  _$AltaEmpleoCopyWithImpl(this._self, this._then);

  final AltaEmpleo _self;
  final $Res Function(AltaEmpleo) _then;

/// Create a copy of AltaEmpleo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? constanciaEstudioUrl = freezed,Object? constanciaSituacionFiscalUrl = freezed,Object? altaImssUrl = freezed,Object? avisoInfonavitUrl = freezed,Object? cartaRecomendacion1Url = freezed,Object? cartaRecomendacion2Url = freezed,Object? cartaRecomendacion3Url = freezed,Object? cartaNoAntecedentesPenalesUrl = freezed,Object? contratoLaboralUrl = freezed,Object? cartaOfertaUrl = freezed,Object? examenMedicoUrl = freezed,}) {
  return _then(AltaEmpleo(
constanciaEstudioUrl: freezed == constanciaEstudioUrl ? _self.constanciaEstudioUrl : constanciaEstudioUrl // ignore: cast_nullable_to_non_nullable
as String?,constanciaSituacionFiscalUrl: freezed == constanciaSituacionFiscalUrl ? _self.constanciaSituacionFiscalUrl : constanciaSituacionFiscalUrl // ignore: cast_nullable_to_non_nullable
as String?,altaImssUrl: freezed == altaImssUrl ? _self.altaImssUrl : altaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,avisoInfonavitUrl: freezed == avisoInfonavitUrl ? _self.avisoInfonavitUrl : avisoInfonavitUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion1Url: freezed == cartaRecomendacion1Url ? _self.cartaRecomendacion1Url : cartaRecomendacion1Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion2Url: freezed == cartaRecomendacion2Url ? _self.cartaRecomendacion2Url : cartaRecomendacion2Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion3Url: freezed == cartaRecomendacion3Url ? _self.cartaRecomendacion3Url : cartaRecomendacion3Url // ignore: cast_nullable_to_non_nullable
as String?,cartaNoAntecedentesPenalesUrl: freezed == cartaNoAntecedentesPenalesUrl ? _self.cartaNoAntecedentesPenalesUrl : cartaNoAntecedentesPenalesUrl // ignore: cast_nullable_to_non_nullable
as String?,contratoLaboralUrl: freezed == contratoLaboralUrl ? _self.contratoLaboralUrl : contratoLaboralUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaOfertaUrl: freezed == cartaOfertaUrl ? _self.cartaOfertaUrl : cartaOfertaUrl // ignore: cast_nullable_to_non_nullable
as String?,examenMedicoUrl: freezed == examenMedicoUrl ? _self.examenMedicoUrl : examenMedicoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AltaEmpleo].
extension AltaEmpleoPatterns on AltaEmpleo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AltaEmpleo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AltaEmpleo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AltaEmpleo value)  $default,){
final _that = this;
switch (_that) {
case _AltaEmpleo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AltaEmpleo value)?  $default,){
final _that = this;
switch (_that) {
case _AltaEmpleo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? constanciaEstudioUrl,  String? constanciaSituacionFiscalUrl,  String? altaImssUrl,  String? avisoInfonavitUrl,  String? cartaRecomendacion1Url,  String? cartaRecomendacion2Url,  String? cartaRecomendacion3Url,  String? cartaNoAntecedentesPenalesUrl,  String? contratoLaboralUrl,  String? cartaOfertaUrl,  String? examenMedicoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AltaEmpleo() when $default != null:
return $default(_that.constanciaEstudioUrl,_that.constanciaSituacionFiscalUrl,_that.altaImssUrl,_that.avisoInfonavitUrl,_that.cartaRecomendacion1Url,_that.cartaRecomendacion2Url,_that.cartaRecomendacion3Url,_that.cartaNoAntecedentesPenalesUrl,_that.contratoLaboralUrl,_that.cartaOfertaUrl,_that.examenMedicoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? constanciaEstudioUrl,  String? constanciaSituacionFiscalUrl,  String? altaImssUrl,  String? avisoInfonavitUrl,  String? cartaRecomendacion1Url,  String? cartaRecomendacion2Url,  String? cartaRecomendacion3Url,  String? cartaNoAntecedentesPenalesUrl,  String? contratoLaboralUrl,  String? cartaOfertaUrl,  String? examenMedicoUrl)  $default,) {final _that = this;
switch (_that) {
case _AltaEmpleo():
return $default(_that.constanciaEstudioUrl,_that.constanciaSituacionFiscalUrl,_that.altaImssUrl,_that.avisoInfonavitUrl,_that.cartaRecomendacion1Url,_that.cartaRecomendacion2Url,_that.cartaRecomendacion3Url,_that.cartaNoAntecedentesPenalesUrl,_that.contratoLaboralUrl,_that.cartaOfertaUrl,_that.examenMedicoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? constanciaEstudioUrl,  String? constanciaSituacionFiscalUrl,  String? altaImssUrl,  String? avisoInfonavitUrl,  String? cartaRecomendacion1Url,  String? cartaRecomendacion2Url,  String? cartaRecomendacion3Url,  String? cartaNoAntecedentesPenalesUrl,  String? contratoLaboralUrl,  String? cartaOfertaUrl,  String? examenMedicoUrl)?  $default,) {final _that = this;
switch (_that) {
case _AltaEmpleo() when $default != null:
return $default(_that.constanciaEstudioUrl,_that.constanciaSituacionFiscalUrl,_that.altaImssUrl,_that.avisoInfonavitUrl,_that.cartaRecomendacion1Url,_that.cartaRecomendacion2Url,_that.cartaRecomendacion3Url,_that.cartaNoAntecedentesPenalesUrl,_that.contratoLaboralUrl,_that.cartaOfertaUrl,_that.examenMedicoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _AltaEmpleo with DiagnosticableTreeMixin implements AltaEmpleo {
  const _AltaEmpleo({this.constanciaEstudioUrl, this.constanciaSituacionFiscalUrl, this.altaImssUrl, this.avisoInfonavitUrl, this.cartaRecomendacion1Url, this.cartaRecomendacion2Url, this.cartaRecomendacion3Url, this.cartaNoAntecedentesPenalesUrl, this.contratoLaboralUrl, this.cartaOfertaUrl, this.examenMedicoUrl});
  

@override final  String? constanciaEstudioUrl;
@override final  String? constanciaSituacionFiscalUrl;
@override final  String? altaImssUrl;
@override final  String? avisoInfonavitUrl;
@override final  String? cartaRecomendacion1Url;
@override final  String? cartaRecomendacion2Url;
@override final  String? cartaRecomendacion3Url;
@override final  String? cartaNoAntecedentesPenalesUrl;
@override final  String? contratoLaboralUrl;
@override final  String? cartaOfertaUrl;
@override final  String? examenMedicoUrl;

/// Create a copy of AltaEmpleo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AltaEmpleoCopyWith<_AltaEmpleo> get copyWith => __$AltaEmpleoCopyWithImpl<_AltaEmpleo>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AltaEmpleo'))
    ..add(DiagnosticsProperty('constanciaEstudioUrl', constanciaEstudioUrl))..add(DiagnosticsProperty('constanciaSituacionFiscalUrl', constanciaSituacionFiscalUrl))..add(DiagnosticsProperty('altaImssUrl', altaImssUrl))..add(DiagnosticsProperty('avisoInfonavitUrl', avisoInfonavitUrl))..add(DiagnosticsProperty('cartaRecomendacion1Url', cartaRecomendacion1Url))..add(DiagnosticsProperty('cartaRecomendacion2Url', cartaRecomendacion2Url))..add(DiagnosticsProperty('cartaRecomendacion3Url', cartaRecomendacion3Url))..add(DiagnosticsProperty('cartaNoAntecedentesPenalesUrl', cartaNoAntecedentesPenalesUrl))..add(DiagnosticsProperty('contratoLaboralUrl', contratoLaboralUrl))..add(DiagnosticsProperty('cartaOfertaUrl', cartaOfertaUrl))..add(DiagnosticsProperty('examenMedicoUrl', examenMedicoUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AltaEmpleo&&(identical(other.constanciaEstudioUrl, constanciaEstudioUrl) || other.constanciaEstudioUrl == constanciaEstudioUrl)&&(identical(other.constanciaSituacionFiscalUrl, constanciaSituacionFiscalUrl) || other.constanciaSituacionFiscalUrl == constanciaSituacionFiscalUrl)&&(identical(other.altaImssUrl, altaImssUrl) || other.altaImssUrl == altaImssUrl)&&(identical(other.avisoInfonavitUrl, avisoInfonavitUrl) || other.avisoInfonavitUrl == avisoInfonavitUrl)&&(identical(other.cartaRecomendacion1Url, cartaRecomendacion1Url) || other.cartaRecomendacion1Url == cartaRecomendacion1Url)&&(identical(other.cartaRecomendacion2Url, cartaRecomendacion2Url) || other.cartaRecomendacion2Url == cartaRecomendacion2Url)&&(identical(other.cartaRecomendacion3Url, cartaRecomendacion3Url) || other.cartaRecomendacion3Url == cartaRecomendacion3Url)&&(identical(other.cartaNoAntecedentesPenalesUrl, cartaNoAntecedentesPenalesUrl) || other.cartaNoAntecedentesPenalesUrl == cartaNoAntecedentesPenalesUrl)&&(identical(other.contratoLaboralUrl, contratoLaboralUrl) || other.contratoLaboralUrl == contratoLaboralUrl)&&(identical(other.cartaOfertaUrl, cartaOfertaUrl) || other.cartaOfertaUrl == cartaOfertaUrl)&&(identical(other.examenMedicoUrl, examenMedicoUrl) || other.examenMedicoUrl == examenMedicoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,constanciaEstudioUrl,constanciaSituacionFiscalUrl,altaImssUrl,avisoInfonavitUrl,cartaRecomendacion1Url,cartaRecomendacion2Url,cartaRecomendacion3Url,cartaNoAntecedentesPenalesUrl,contratoLaboralUrl,cartaOfertaUrl,examenMedicoUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AltaEmpleo(constanciaEstudioUrl: $constanciaEstudioUrl, constanciaSituacionFiscalUrl: $constanciaSituacionFiscalUrl, altaImssUrl: $altaImssUrl, avisoInfonavitUrl: $avisoInfonavitUrl, cartaRecomendacion1Url: $cartaRecomendacion1Url, cartaRecomendacion2Url: $cartaRecomendacion2Url, cartaRecomendacion3Url: $cartaRecomendacion3Url, cartaNoAntecedentesPenalesUrl: $cartaNoAntecedentesPenalesUrl, contratoLaboralUrl: $contratoLaboralUrl, cartaOfertaUrl: $cartaOfertaUrl, examenMedicoUrl: $examenMedicoUrl)';
}


}

/// @nodoc
abstract mixin class _$AltaEmpleoCopyWith<$Res> implements $AltaEmpleoCopyWith<$Res> {
  factory _$AltaEmpleoCopyWith(_AltaEmpleo value, $Res Function(_AltaEmpleo) _then) = __$AltaEmpleoCopyWithImpl;
@override @useResult
$Res call({
 String? constanciaEstudioUrl, String? constanciaSituacionFiscalUrl, String? altaImssUrl, String? avisoInfonavitUrl, String? cartaRecomendacion1Url, String? cartaRecomendacion2Url, String? cartaRecomendacion3Url, String? cartaNoAntecedentesPenalesUrl, String? contratoLaboralUrl, String? cartaOfertaUrl, String? examenMedicoUrl
});




}
/// @nodoc
class __$AltaEmpleoCopyWithImpl<$Res>
    implements _$AltaEmpleoCopyWith<$Res> {
  __$AltaEmpleoCopyWithImpl(this._self, this._then);

  final _AltaEmpleo _self;
  final $Res Function(_AltaEmpleo) _then;

/// Create a copy of AltaEmpleo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? constanciaEstudioUrl = freezed,Object? constanciaSituacionFiscalUrl = freezed,Object? altaImssUrl = freezed,Object? avisoInfonavitUrl = freezed,Object? cartaRecomendacion1Url = freezed,Object? cartaRecomendacion2Url = freezed,Object? cartaRecomendacion3Url = freezed,Object? cartaNoAntecedentesPenalesUrl = freezed,Object? contratoLaboralUrl = freezed,Object? cartaOfertaUrl = freezed,Object? examenMedicoUrl = freezed,}) {
  return _then(_AltaEmpleo(
constanciaEstudioUrl: freezed == constanciaEstudioUrl ? _self.constanciaEstudioUrl : constanciaEstudioUrl // ignore: cast_nullable_to_non_nullable
as String?,constanciaSituacionFiscalUrl: freezed == constanciaSituacionFiscalUrl ? _self.constanciaSituacionFiscalUrl : constanciaSituacionFiscalUrl // ignore: cast_nullable_to_non_nullable
as String?,altaImssUrl: freezed == altaImssUrl ? _self.altaImssUrl : altaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,avisoInfonavitUrl: freezed == avisoInfonavitUrl ? _self.avisoInfonavitUrl : avisoInfonavitUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion1Url: freezed == cartaRecomendacion1Url ? _self.cartaRecomendacion1Url : cartaRecomendacion1Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion2Url: freezed == cartaRecomendacion2Url ? _self.cartaRecomendacion2Url : cartaRecomendacion2Url // ignore: cast_nullable_to_non_nullable
as String?,cartaRecomendacion3Url: freezed == cartaRecomendacion3Url ? _self.cartaRecomendacion3Url : cartaRecomendacion3Url // ignore: cast_nullable_to_non_nullable
as String?,cartaNoAntecedentesPenalesUrl: freezed == cartaNoAntecedentesPenalesUrl ? _self.cartaNoAntecedentesPenalesUrl : cartaNoAntecedentesPenalesUrl // ignore: cast_nullable_to_non_nullable
as String?,contratoLaboralUrl: freezed == contratoLaboralUrl ? _self.contratoLaboralUrl : contratoLaboralUrl // ignore: cast_nullable_to_non_nullable
as String?,cartaOfertaUrl: freezed == cartaOfertaUrl ? _self.cartaOfertaUrl : cartaOfertaUrl // ignore: cast_nullable_to_non_nullable
as String?,examenMedicoUrl: freezed == examenMedicoUrl ? _self.examenMedicoUrl : examenMedicoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BajaEmpleo implements DiagnosticableTreeMixin {

 String? get cartaRenunciaUrl; String? get finiquitoUrl; String? get bajaImssUrl; String? get comprobanteFiniquitoUrl;
/// Create a copy of BajaEmpleo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BajaEmpleoCopyWith<BajaEmpleo> get copyWith => _$BajaEmpleoCopyWithImpl<BajaEmpleo>(this as BajaEmpleo, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BajaEmpleo'))
    ..add(DiagnosticsProperty('cartaRenunciaUrl', cartaRenunciaUrl))..add(DiagnosticsProperty('finiquitoUrl', finiquitoUrl))..add(DiagnosticsProperty('bajaImssUrl', bajaImssUrl))..add(DiagnosticsProperty('comprobanteFiniquitoUrl', comprobanteFiniquitoUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BajaEmpleo&&(identical(other.cartaRenunciaUrl, cartaRenunciaUrl) || other.cartaRenunciaUrl == cartaRenunciaUrl)&&(identical(other.finiquitoUrl, finiquitoUrl) || other.finiquitoUrl == finiquitoUrl)&&(identical(other.bajaImssUrl, bajaImssUrl) || other.bajaImssUrl == bajaImssUrl)&&(identical(other.comprobanteFiniquitoUrl, comprobanteFiniquitoUrl) || other.comprobanteFiniquitoUrl == comprobanteFiniquitoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,cartaRenunciaUrl,finiquitoUrl,bajaImssUrl,comprobanteFiniquitoUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BajaEmpleo(cartaRenunciaUrl: $cartaRenunciaUrl, finiquitoUrl: $finiquitoUrl, bajaImssUrl: $bajaImssUrl, comprobanteFiniquitoUrl: $comprobanteFiniquitoUrl)';
}


}

/// @nodoc
abstract mixin class $BajaEmpleoCopyWith<$Res>  {
  factory $BajaEmpleoCopyWith(BajaEmpleo value, $Res Function(BajaEmpleo) _then) = _$BajaEmpleoCopyWithImpl;
@useResult
$Res call({
 String? cartaRenunciaUrl, String? finiquitoUrl, String? bajaImssUrl, String? comprobanteFiniquitoUrl
});




}
/// @nodoc
class _$BajaEmpleoCopyWithImpl<$Res>
    implements $BajaEmpleoCopyWith<$Res> {
  _$BajaEmpleoCopyWithImpl(this._self, this._then);

  final BajaEmpleo _self;
  final $Res Function(BajaEmpleo) _then;

/// Create a copy of BajaEmpleo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cartaRenunciaUrl = freezed,Object? finiquitoUrl = freezed,Object? bajaImssUrl = freezed,Object? comprobanteFiniquitoUrl = freezed,}) {
  return _then(BajaEmpleo(
cartaRenunciaUrl: freezed == cartaRenunciaUrl ? _self.cartaRenunciaUrl : cartaRenunciaUrl // ignore: cast_nullable_to_non_nullable
as String?,finiquitoUrl: freezed == finiquitoUrl ? _self.finiquitoUrl : finiquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,bajaImssUrl: freezed == bajaImssUrl ? _self.bajaImssUrl : bajaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,comprobanteFiniquitoUrl: freezed == comprobanteFiniquitoUrl ? _self.comprobanteFiniquitoUrl : comprobanteFiniquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BajaEmpleo].
extension BajaEmpleoPatterns on BajaEmpleo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BajaEmpleo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BajaEmpleo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BajaEmpleo value)  $default,){
final _that = this;
switch (_that) {
case _BajaEmpleo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BajaEmpleo value)?  $default,){
final _that = this;
switch (_that) {
case _BajaEmpleo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? cartaRenunciaUrl,  String? finiquitoUrl,  String? bajaImssUrl,  String? comprobanteFiniquitoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BajaEmpleo() when $default != null:
return $default(_that.cartaRenunciaUrl,_that.finiquitoUrl,_that.bajaImssUrl,_that.comprobanteFiniquitoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? cartaRenunciaUrl,  String? finiquitoUrl,  String? bajaImssUrl,  String? comprobanteFiniquitoUrl)  $default,) {final _that = this;
switch (_that) {
case _BajaEmpleo():
return $default(_that.cartaRenunciaUrl,_that.finiquitoUrl,_that.bajaImssUrl,_that.comprobanteFiniquitoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? cartaRenunciaUrl,  String? finiquitoUrl,  String? bajaImssUrl,  String? comprobanteFiniquitoUrl)?  $default,) {final _that = this;
switch (_that) {
case _BajaEmpleo() when $default != null:
return $default(_that.cartaRenunciaUrl,_that.finiquitoUrl,_that.bajaImssUrl,_that.comprobanteFiniquitoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _BajaEmpleo with DiagnosticableTreeMixin implements BajaEmpleo {
  const _BajaEmpleo({this.cartaRenunciaUrl, this.finiquitoUrl, this.bajaImssUrl, this.comprobanteFiniquitoUrl});
  

@override final  String? cartaRenunciaUrl;
@override final  String? finiquitoUrl;
@override final  String? bajaImssUrl;
@override final  String? comprobanteFiniquitoUrl;

/// Create a copy of BajaEmpleo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BajaEmpleoCopyWith<_BajaEmpleo> get copyWith => __$BajaEmpleoCopyWithImpl<_BajaEmpleo>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BajaEmpleo'))
    ..add(DiagnosticsProperty('cartaRenunciaUrl', cartaRenunciaUrl))..add(DiagnosticsProperty('finiquitoUrl', finiquitoUrl))..add(DiagnosticsProperty('bajaImssUrl', bajaImssUrl))..add(DiagnosticsProperty('comprobanteFiniquitoUrl', comprobanteFiniquitoUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BajaEmpleo&&(identical(other.cartaRenunciaUrl, cartaRenunciaUrl) || other.cartaRenunciaUrl == cartaRenunciaUrl)&&(identical(other.finiquitoUrl, finiquitoUrl) || other.finiquitoUrl == finiquitoUrl)&&(identical(other.bajaImssUrl, bajaImssUrl) || other.bajaImssUrl == bajaImssUrl)&&(identical(other.comprobanteFiniquitoUrl, comprobanteFiniquitoUrl) || other.comprobanteFiniquitoUrl == comprobanteFiniquitoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,cartaRenunciaUrl,finiquitoUrl,bajaImssUrl,comprobanteFiniquitoUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BajaEmpleo(cartaRenunciaUrl: $cartaRenunciaUrl, finiquitoUrl: $finiquitoUrl, bajaImssUrl: $bajaImssUrl, comprobanteFiniquitoUrl: $comprobanteFiniquitoUrl)';
}


}

/// @nodoc
abstract mixin class _$BajaEmpleoCopyWith<$Res> implements $BajaEmpleoCopyWith<$Res> {
  factory _$BajaEmpleoCopyWith(_BajaEmpleo value, $Res Function(_BajaEmpleo) _then) = __$BajaEmpleoCopyWithImpl;
@override @useResult
$Res call({
 String? cartaRenunciaUrl, String? finiquitoUrl, String? bajaImssUrl, String? comprobanteFiniquitoUrl
});




}
/// @nodoc
class __$BajaEmpleoCopyWithImpl<$Res>
    implements _$BajaEmpleoCopyWith<$Res> {
  __$BajaEmpleoCopyWithImpl(this._self, this._then);

  final _BajaEmpleo _self;
  final $Res Function(_BajaEmpleo) _then;

/// Create a copy of BajaEmpleo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cartaRenunciaUrl = freezed,Object? finiquitoUrl = freezed,Object? bajaImssUrl = freezed,Object? comprobanteFiniquitoUrl = freezed,}) {
  return _then(_BajaEmpleo(
cartaRenunciaUrl: freezed == cartaRenunciaUrl ? _self.cartaRenunciaUrl : cartaRenunciaUrl // ignore: cast_nullable_to_non_nullable
as String?,finiquitoUrl: freezed == finiquitoUrl ? _self.finiquitoUrl : finiquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,bajaImssUrl: freezed == bajaImssUrl ? _self.bajaImssUrl : bajaImssUrl // ignore: cast_nullable_to_non_nullable
as String?,comprobanteFiniquitoUrl: freezed == comprobanteFiniquitoUrl ? _self.comprobanteFiniquitoUrl : comprobanteFiniquitoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
