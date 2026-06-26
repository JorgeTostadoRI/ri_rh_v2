// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incidencia.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Incidencia implements DiagnosticableTreeMixin {

 int? get id; DateTime? get createdAt; DateTime? get updatedAt; IncidenciaState? get state; int? get revisor; int? get solicitor; DateTime get start; DateTime get end; String get reason; List<IncidenciaFile> get files; String get categoryId;
/// Create a copy of Incidencia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidenciaCopyWith<Incidencia> get copyWith => _$IncidenciaCopyWithImpl<Incidencia>(this as Incidencia, _$identity);

  /// Serializes this Incidencia to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Incidencia'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('revisor', revisor))..add(DiagnosticsProperty('solicitor', solicitor))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('categoryId', categoryId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Incidencia&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.state, state) || other.state == state)&&(identical(other.revisor, revisor) || other.revisor == revisor)&&(identical(other.solicitor, solicitor) || other.solicitor == solicitor)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,state,revisor,solicitor,start,end,reason,const DeepCollectionEquality().hash(files),categoryId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Incidencia(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, revisor: $revisor, solicitor: $solicitor, start: $start, end: $end, reason: $reason, files: $files, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $IncidenciaCopyWith<$Res>  {
  factory $IncidenciaCopyWith(Incidencia value, $Res Function(Incidencia) _then) = _$IncidenciaCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, IncidenciaState? state, int? revisor, int? solicitor, DateTime start, DateTime end, String reason, List<IncidenciaFile> files, String categoryId
});




}
/// @nodoc
class _$IncidenciaCopyWithImpl<$Res>
    implements $IncidenciaCopyWith<$Res> {
  _$IncidenciaCopyWithImpl(this._self, this._then);

  final Incidencia _self;
  final $Res Function(Incidencia) _then;

/// Create a copy of Incidencia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? state = freezed,Object? revisor = freezed,Object? solicitor = freezed,Object? start = null,Object? end = null,Object? reason = null,Object? files = null,Object? categoryId = null,}) {
  return _then(Incidencia(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState?,revisor: freezed == revisor ? _self.revisor : revisor // ignore: cast_nullable_to_non_nullable
as int?,solicitor: freezed == solicitor ? _self.solicitor : solicitor // ignore: cast_nullable_to_non_nullable
as int?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<IncidenciaFile>,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Incidencia].
extension IncidenciaPatterns on Incidencia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Incidencia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Incidencia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Incidencia value)  $default,){
final _that = this;
switch (_that) {
case _Incidencia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Incidencia value)?  $default,){
final _that = this;
switch (_that) {
case _Incidencia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  IncidenciaState? state,  int? revisor,  int? solicitor,  DateTime start,  DateTime end,  String reason,  List<IncidenciaFile> files,  String categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Incidencia() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.state,_that.revisor,_that.solicitor,_that.start,_that.end,_that.reason,_that.files,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  IncidenciaState? state,  int? revisor,  int? solicitor,  DateTime start,  DateTime end,  String reason,  List<IncidenciaFile> files,  String categoryId)  $default,) {final _that = this;
switch (_that) {
case _Incidencia():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.state,_that.revisor,_that.solicitor,_that.start,_that.end,_that.reason,_that.files,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  IncidenciaState? state,  int? revisor,  int? solicitor,  DateTime start,  DateTime end,  String reason,  List<IncidenciaFile> files,  String categoryId)?  $default,) {final _that = this;
switch (_that) {
case _Incidencia() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.state,_that.revisor,_that.solicitor,_that.start,_that.end,_that.reason,_that.files,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Incidencia with DiagnosticableTreeMixin implements Incidencia {
  const _Incidencia({this.id, this.createdAt, this.updatedAt, this.state, this.revisor, this.solicitor, required this.start, required this.end, required this.reason, required  List<IncidenciaFile> files, required this.categoryId}): _files = files;
  factory _Incidencia.fromJson(Map<String, dynamic> json) => _$IncidenciaFromJson(json);

@override final  int? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  IncidenciaState? state;
@override final  int? revisor;
@override final  int? solicitor;
@override final  DateTime start;
@override final  DateTime end;
@override final  String reason;
 final  List<IncidenciaFile> _files;
@override List<IncidenciaFile> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  String categoryId;

/// Create a copy of Incidencia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidenciaCopyWith<_Incidencia> get copyWith => __$IncidenciaCopyWithImpl<_Incidencia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidenciaToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Incidencia'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('revisor', revisor))..add(DiagnosticsProperty('solicitor', solicitor))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('categoryId', categoryId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Incidencia&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.state, state) || other.state == state)&&(identical(other.revisor, revisor) || other.revisor == revisor)&&(identical(other.solicitor, solicitor) || other.solicitor == solicitor)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,state,revisor,solicitor,start,end,reason,const DeepCollectionEquality().hash(_files),categoryId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Incidencia(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, revisor: $revisor, solicitor: $solicitor, start: $start, end: $end, reason: $reason, files: $files, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$IncidenciaCopyWith<$Res> implements $IncidenciaCopyWith<$Res> {
  factory _$IncidenciaCopyWith(_Incidencia value, $Res Function(_Incidencia) _then) = __$IncidenciaCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, IncidenciaState? state, int? revisor, int? solicitor, DateTime start, DateTime end, String reason, List<IncidenciaFile> files, String categoryId
});




}
/// @nodoc
class __$IncidenciaCopyWithImpl<$Res>
    implements _$IncidenciaCopyWith<$Res> {
  __$IncidenciaCopyWithImpl(this._self, this._then);

  final _Incidencia _self;
  final $Res Function(_Incidencia) _then;

/// Create a copy of Incidencia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? state = freezed,Object? revisor = freezed,Object? solicitor = freezed,Object? start = null,Object? end = null,Object? reason = null,Object? files = null,Object? categoryId = null,}) {
  return _then(_Incidencia(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState?,revisor: freezed == revisor ? _self.revisor : revisor // ignore: cast_nullable_to_non_nullable
as int?,solicitor: freezed == solicitor ? _self.solicitor : solicitor // ignore: cast_nullable_to_non_nullable
as int?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<IncidenciaFile>,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
