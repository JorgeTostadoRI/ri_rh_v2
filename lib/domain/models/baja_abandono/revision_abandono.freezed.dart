// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revision_abandono.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevisionAbandono implements DiagnosticableTreeMixin {

 bool get procede; String get motivo; DateTime? get ultimaChecada; List<DiaRevisadoAbandono> get dias;
/// Create a copy of RevisionAbandono
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevisionAbandonoCopyWith<RevisionAbandono> get copyWith => _$RevisionAbandonoCopyWithImpl<RevisionAbandono>(this as RevisionAbandono, _$identity);

  /// Serializes this RevisionAbandono to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RevisionAbandono'))
    ..add(DiagnosticsProperty('procede', procede))..add(DiagnosticsProperty('motivo', motivo))..add(DiagnosticsProperty('ultimaChecada', ultimaChecada))..add(DiagnosticsProperty('dias', dias));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevisionAbandono&&(identical(other.procede, procede) || other.procede == procede)&&(identical(other.motivo, motivo) || other.motivo == motivo)&&(identical(other.ultimaChecada, ultimaChecada) || other.ultimaChecada == ultimaChecada)&&const DeepCollectionEquality().equals(other.dias, dias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,procede,motivo,ultimaChecada,const DeepCollectionEquality().hash(dias));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RevisionAbandono(procede: $procede, motivo: $motivo, ultimaChecada: $ultimaChecada, dias: $dias)';
}


}

/// @nodoc
abstract mixin class $RevisionAbandonoCopyWith<$Res>  {
  factory $RevisionAbandonoCopyWith(RevisionAbandono value, $Res Function(RevisionAbandono) _then) = _$RevisionAbandonoCopyWithImpl;
@useResult
$Res call({
 bool procede, String motivo, DateTime? ultimaChecada, List<DiaRevisadoAbandono> dias
});




}
/// @nodoc
class _$RevisionAbandonoCopyWithImpl<$Res>
    implements $RevisionAbandonoCopyWith<$Res> {
  _$RevisionAbandonoCopyWithImpl(this._self, this._then);

  final RevisionAbandono _self;
  final $Res Function(RevisionAbandono) _then;

/// Create a copy of RevisionAbandono
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? procede = null,Object? motivo = null,Object? ultimaChecada = freezed,Object? dias = null,}) {
  return _then(RevisionAbandono(
procede: null == procede ? _self.procede : procede // ignore: cast_nullable_to_non_nullable
as bool,motivo: null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String,ultimaChecada: freezed == ultimaChecada ? _self.ultimaChecada : ultimaChecada // ignore: cast_nullable_to_non_nullable
as DateTime?,dias: null == dias ? _self.dias : dias // ignore: cast_nullable_to_non_nullable
as List<DiaRevisadoAbandono>,
  ));
}

}


/// Adds pattern-matching-related methods to [RevisionAbandono].
extension RevisionAbandonoPatterns on RevisionAbandono {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevisionAbandono value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevisionAbandono() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevisionAbandono value)  $default,){
final _that = this;
switch (_that) {
case _RevisionAbandono():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevisionAbandono value)?  $default,){
final _that = this;
switch (_that) {
case _RevisionAbandono() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool procede,  String motivo,  DateTime? ultimaChecada,  List<DiaRevisadoAbandono> dias)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevisionAbandono() when $default != null:
return $default(_that.procede,_that.motivo,_that.ultimaChecada,_that.dias);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool procede,  String motivo,  DateTime? ultimaChecada,  List<DiaRevisadoAbandono> dias)  $default,) {final _that = this;
switch (_that) {
case _RevisionAbandono():
return $default(_that.procede,_that.motivo,_that.ultimaChecada,_that.dias);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool procede,  String motivo,  DateTime? ultimaChecada,  List<DiaRevisadoAbandono> dias)?  $default,) {final _that = this;
switch (_that) {
case _RevisionAbandono() when $default != null:
return $default(_that.procede,_that.motivo,_that.ultimaChecada,_that.dias);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevisionAbandono with DiagnosticableTreeMixin implements RevisionAbandono {
  const _RevisionAbandono({required this.procede, this.motivo = '', this.ultimaChecada,  List<DiaRevisadoAbandono> dias = const []}): _dias = dias;
  factory _RevisionAbandono.fromJson(Map<String, dynamic> json) => _$RevisionAbandonoFromJson(json);

@override final  bool procede;
@override@JsonKey() final  String motivo;
@override final  DateTime? ultimaChecada;
 final  List<DiaRevisadoAbandono> _dias;
@override@JsonKey() List<DiaRevisadoAbandono> get dias {
  if (_dias is EqualUnmodifiableListView) return _dias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dias);
}


/// Create a copy of RevisionAbandono
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevisionAbandonoCopyWith<_RevisionAbandono> get copyWith => __$RevisionAbandonoCopyWithImpl<_RevisionAbandono>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevisionAbandonoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RevisionAbandono'))
    ..add(DiagnosticsProperty('procede', procede))..add(DiagnosticsProperty('motivo', motivo))..add(DiagnosticsProperty('ultimaChecada', ultimaChecada))..add(DiagnosticsProperty('dias', dias));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevisionAbandono&&(identical(other.procede, procede) || other.procede == procede)&&(identical(other.motivo, motivo) || other.motivo == motivo)&&(identical(other.ultimaChecada, ultimaChecada) || other.ultimaChecada == ultimaChecada)&&const DeepCollectionEquality().equals(other._dias, _dias));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,procede,motivo,ultimaChecada,const DeepCollectionEquality().hash(_dias));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RevisionAbandono(procede: $procede, motivo: $motivo, ultimaChecada: $ultimaChecada, dias: $dias)';
}


}

/// @nodoc
abstract mixin class _$RevisionAbandonoCopyWith<$Res> implements $RevisionAbandonoCopyWith<$Res> {
  factory _$RevisionAbandonoCopyWith(_RevisionAbandono value, $Res Function(_RevisionAbandono) _then) = __$RevisionAbandonoCopyWithImpl;
@override @useResult
$Res call({
 bool procede, String motivo, DateTime? ultimaChecada, List<DiaRevisadoAbandono> dias
});




}
/// @nodoc
class __$RevisionAbandonoCopyWithImpl<$Res>
    implements _$RevisionAbandonoCopyWith<$Res> {
  __$RevisionAbandonoCopyWithImpl(this._self, this._then);

  final _RevisionAbandono _self;
  final $Res Function(_RevisionAbandono) _then;

/// Create a copy of RevisionAbandono
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? procede = null,Object? motivo = null,Object? ultimaChecada = freezed,Object? dias = null,}) {
  return _then(_RevisionAbandono(
procede: null == procede ? _self.procede : procede // ignore: cast_nullable_to_non_nullable
as bool,motivo: null == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as String,ultimaChecada: freezed == ultimaChecada ? _self.ultimaChecada : ultimaChecada // ignore: cast_nullable_to_non_nullable
as DateTime?,dias: null == dias ? _self._dias : dias // ignore: cast_nullable_to_non_nullable
as List<DiaRevisadoAbandono>,
  ));
}


}


/// @nodoc
mixin _$DiaRevisadoAbandono implements DiagnosticableTreeMixin {

 DateTime get fecha; int get checadas;
/// Create a copy of DiaRevisadoAbandono
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaRevisadoAbandonoCopyWith<DiaRevisadoAbandono> get copyWith => _$DiaRevisadoAbandonoCopyWithImpl<DiaRevisadoAbandono>(this as DiaRevisadoAbandono, _$identity);

  /// Serializes this DiaRevisadoAbandono to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DiaRevisadoAbandono'))
    ..add(DiagnosticsProperty('fecha', fecha))..add(DiagnosticsProperty('checadas', checadas));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaRevisadoAbandono&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.checadas, checadas) || other.checadas == checadas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fecha,checadas);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DiaRevisadoAbandono(fecha: $fecha, checadas: $checadas)';
}


}

/// @nodoc
abstract mixin class $DiaRevisadoAbandonoCopyWith<$Res>  {
  factory $DiaRevisadoAbandonoCopyWith(DiaRevisadoAbandono value, $Res Function(DiaRevisadoAbandono) _then) = _$DiaRevisadoAbandonoCopyWithImpl;
@useResult
$Res call({
 DateTime fecha, int checadas
});




}
/// @nodoc
class _$DiaRevisadoAbandonoCopyWithImpl<$Res>
    implements $DiaRevisadoAbandonoCopyWith<$Res> {
  _$DiaRevisadoAbandonoCopyWithImpl(this._self, this._then);

  final DiaRevisadoAbandono _self;
  final $Res Function(DiaRevisadoAbandono) _then;

/// Create a copy of DiaRevisadoAbandono
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fecha = null,Object? checadas = null,}) {
  return _then(DiaRevisadoAbandono(
fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,checadas: null == checadas ? _self.checadas : checadas // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaRevisadoAbandono].
extension DiaRevisadoAbandonoPatterns on DiaRevisadoAbandono {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaRevisadoAbandono value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaRevisadoAbandono() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaRevisadoAbandono value)  $default,){
final _that = this;
switch (_that) {
case _DiaRevisadoAbandono():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaRevisadoAbandono value)?  $default,){
final _that = this;
switch (_that) {
case _DiaRevisadoAbandono() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime fecha,  int checadas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaRevisadoAbandono() when $default != null:
return $default(_that.fecha,_that.checadas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime fecha,  int checadas)  $default,) {final _that = this;
switch (_that) {
case _DiaRevisadoAbandono():
return $default(_that.fecha,_that.checadas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime fecha,  int checadas)?  $default,) {final _that = this;
switch (_that) {
case _DiaRevisadoAbandono() when $default != null:
return $default(_that.fecha,_that.checadas);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiaRevisadoAbandono with DiagnosticableTreeMixin implements DiaRevisadoAbandono {
  const _DiaRevisadoAbandono({required this.fecha, required this.checadas});
  factory _DiaRevisadoAbandono.fromJson(Map<String, dynamic> json) => _$DiaRevisadoAbandonoFromJson(json);

@override final  DateTime fecha;
@override final  int checadas;

/// Create a copy of DiaRevisadoAbandono
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaRevisadoAbandonoCopyWith<_DiaRevisadoAbandono> get copyWith => __$DiaRevisadoAbandonoCopyWithImpl<_DiaRevisadoAbandono>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiaRevisadoAbandonoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DiaRevisadoAbandono'))
    ..add(DiagnosticsProperty('fecha', fecha))..add(DiagnosticsProperty('checadas', checadas));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaRevisadoAbandono&&(identical(other.fecha, fecha) || other.fecha == fecha)&&(identical(other.checadas, checadas) || other.checadas == checadas));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fecha,checadas);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DiaRevisadoAbandono(fecha: $fecha, checadas: $checadas)';
}


}

/// @nodoc
abstract mixin class _$DiaRevisadoAbandonoCopyWith<$Res> implements $DiaRevisadoAbandonoCopyWith<$Res> {
  factory _$DiaRevisadoAbandonoCopyWith(_DiaRevisadoAbandono value, $Res Function(_DiaRevisadoAbandono) _then) = __$DiaRevisadoAbandonoCopyWithImpl;
@override @useResult
$Res call({
 DateTime fecha, int checadas
});




}
/// @nodoc
class __$DiaRevisadoAbandonoCopyWithImpl<$Res>
    implements _$DiaRevisadoAbandonoCopyWith<$Res> {
  __$DiaRevisadoAbandonoCopyWithImpl(this._self, this._then);

  final _DiaRevisadoAbandono _self;
  final $Res Function(_DiaRevisadoAbandono) _then;

/// Create a copy of DiaRevisadoAbandono
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fecha = null,Object? checadas = null,}) {
  return _then(_DiaRevisadoAbandono(
fecha: null == fecha ? _self.fecha : fecha // ignore: cast_nullable_to_non_nullable
as DateTime,checadas: null == checadas ? _self.checadas : checadas // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
