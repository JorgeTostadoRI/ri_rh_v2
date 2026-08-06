// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incidencia_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidenciaApiModel implements DiagnosticableTreeMixin {

 int? get id; DateTime? get createdAt; DateTime? get updatedAt; IncidenciaState? get state;@JsonKey(name: 'revisor') int? get revisorRef;@JsonKey(name: 'solicitor') int? get solicitorRef; String? get rejectionReason; DateTime get start; DateTime get end; String get reason; List<IncidenciaFile> get files; IncidenciaCategory get category;
/// Create a copy of IncidenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidenciaApiModelCopyWith<IncidenciaApiModel> get copyWith => _$IncidenciaApiModelCopyWithImpl<IncidenciaApiModel>(this as IncidenciaApiModel, _$identity);

  /// Serializes this IncidenciaApiModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IncidenciaApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('revisorRef', revisorRef))..add(DiagnosticsProperty('solicitorRef', solicitorRef))..add(DiagnosticsProperty('rejectionReason', rejectionReason))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('category', category));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidenciaApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.state, state) || other.state == state)&&(identical(other.revisorRef, revisorRef) || other.revisorRef == revisorRef)&&(identical(other.solicitorRef, solicitorRef) || other.solicitorRef == solicitorRef)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,state,revisorRef,solicitorRef,rejectionReason,start,end,reason,const DeepCollectionEquality().hash(files),category);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IncidenciaApiModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, revisorRef: $revisorRef, solicitorRef: $solicitorRef, rejectionReason: $rejectionReason, start: $start, end: $end, reason: $reason, files: $files, category: $category)';
}


}

/// @nodoc
abstract mixin class $IncidenciaApiModelCopyWith<$Res>  {
  factory $IncidenciaApiModelCopyWith(IncidenciaApiModel value, $Res Function(IncidenciaApiModel) _then) = _$IncidenciaApiModelCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, IncidenciaState? state,@JsonKey(name: 'revisor') int? revisorRef,@JsonKey(name: 'solicitor') int? solicitorRef, String? rejectionReason, DateTime start, DateTime end, String reason, List<IncidenciaFile> files, IncidenciaCategory category
});




}
/// @nodoc
class _$IncidenciaApiModelCopyWithImpl<$Res>
    implements $IncidenciaApiModelCopyWith<$Res> {
  _$IncidenciaApiModelCopyWithImpl(this._self, this._then);

  final IncidenciaApiModel _self;
  final $Res Function(IncidenciaApiModel) _then;

/// Create a copy of IncidenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? state = freezed,Object? revisorRef = freezed,Object? solicitorRef = freezed,Object? rejectionReason = freezed,Object? start = null,Object? end = null,Object? reason = null,Object? files = null,Object? category = null,}) {
  return _then(IncidenciaApiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState?,revisorRef: freezed == revisorRef ? _self.revisorRef : revisorRef // ignore: cast_nullable_to_non_nullable
as int?,solicitorRef: freezed == solicitorRef ? _self.solicitorRef : solicitorRef // ignore: cast_nullable_to_non_nullable
as int?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<IncidenciaFile>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidenciaCategory,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidenciaApiModel].
extension IncidenciaApiModelPatterns on IncidenciaApiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidenciaApiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidenciaApiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidenciaApiModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidenciaApiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidenciaApiModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidenciaApiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  IncidenciaState? state, @JsonKey(name: 'revisor')  int? revisorRef, @JsonKey(name: 'solicitor')  int? solicitorRef,  String? rejectionReason,  DateTime start,  DateTime end,  String reason,  List<IncidenciaFile> files,  IncidenciaCategory category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidenciaApiModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.state,_that.revisorRef,_that.solicitorRef,_that.rejectionReason,_that.start,_that.end,_that.reason,_that.files,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  IncidenciaState? state, @JsonKey(name: 'revisor')  int? revisorRef, @JsonKey(name: 'solicitor')  int? solicitorRef,  String? rejectionReason,  DateTime start,  DateTime end,  String reason,  List<IncidenciaFile> files,  IncidenciaCategory category)  $default,) {final _that = this;
switch (_that) {
case _IncidenciaApiModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.state,_that.revisorRef,_that.solicitorRef,_that.rejectionReason,_that.start,_that.end,_that.reason,_that.files,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  IncidenciaState? state, @JsonKey(name: 'revisor')  int? revisorRef, @JsonKey(name: 'solicitor')  int? solicitorRef,  String? rejectionReason,  DateTime start,  DateTime end,  String reason,  List<IncidenciaFile> files,  IncidenciaCategory category)?  $default,) {final _that = this;
switch (_that) {
case _IncidenciaApiModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.state,_that.revisorRef,_that.solicitorRef,_that.rejectionReason,_that.start,_that.end,_that.reason,_that.files,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidenciaApiModel with DiagnosticableTreeMixin implements IncidenciaApiModel {
  const _IncidenciaApiModel({this.id, this.createdAt, this.updatedAt, this.state, @JsonKey(name: 'revisor') this.revisorRef, @JsonKey(name: 'solicitor') this.solicitorRef, this.rejectionReason, required this.start, required this.end, required this.reason, required  List<IncidenciaFile> files, required this.category}): _files = files;
  factory _IncidenciaApiModel.fromJson(Map<String, dynamic> json) => _$IncidenciaApiModelFromJson(json);

@override final  int? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  IncidenciaState? state;
@override@JsonKey(name: 'revisor') final  int? revisorRef;
@override@JsonKey(name: 'solicitor') final  int? solicitorRef;
@override final  String? rejectionReason;
@override final  DateTime start;
@override final  DateTime end;
@override final  String reason;
 final  List<IncidenciaFile> _files;
@override List<IncidenciaFile> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  IncidenciaCategory category;

/// Create a copy of IncidenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidenciaApiModelCopyWith<_IncidenciaApiModel> get copyWith => __$IncidenciaApiModelCopyWithImpl<_IncidenciaApiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidenciaApiModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IncidenciaApiModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('revisorRef', revisorRef))..add(DiagnosticsProperty('solicitorRef', solicitorRef))..add(DiagnosticsProperty('rejectionReason', rejectionReason))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('reason', reason))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('category', category));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidenciaApiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.state, state) || other.state == state)&&(identical(other.revisorRef, revisorRef) || other.revisorRef == revisorRef)&&(identical(other.solicitorRef, solicitorRef) || other.solicitorRef == solicitorRef)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,state,revisorRef,solicitorRef,rejectionReason,start,end,reason,const DeepCollectionEquality().hash(_files),category);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IncidenciaApiModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, state: $state, revisorRef: $revisorRef, solicitorRef: $solicitorRef, rejectionReason: $rejectionReason, start: $start, end: $end, reason: $reason, files: $files, category: $category)';
}


}

/// @nodoc
abstract mixin class _$IncidenciaApiModelCopyWith<$Res> implements $IncidenciaApiModelCopyWith<$Res> {
  factory _$IncidenciaApiModelCopyWith(_IncidenciaApiModel value, $Res Function(_IncidenciaApiModel) _then) = __$IncidenciaApiModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, IncidenciaState? state,@JsonKey(name: 'revisor') int? revisorRef,@JsonKey(name: 'solicitor') int? solicitorRef, String? rejectionReason, DateTime start, DateTime end, String reason, List<IncidenciaFile> files, IncidenciaCategory category
});




}
/// @nodoc
class __$IncidenciaApiModelCopyWithImpl<$Res>
    implements _$IncidenciaApiModelCopyWith<$Res> {
  __$IncidenciaApiModelCopyWithImpl(this._self, this._then);

  final _IncidenciaApiModel _self;
  final $Res Function(_IncidenciaApiModel) _then;

/// Create a copy of IncidenciaApiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? state = freezed,Object? revisorRef = freezed,Object? solicitorRef = freezed,Object? rejectionReason = freezed,Object? start = null,Object? end = null,Object? reason = null,Object? files = null,Object? category = null,}) {
  return _then(_IncidenciaApiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as IncidenciaState?,revisorRef: freezed == revisorRef ? _self.revisorRef : revisorRef // ignore: cast_nullable_to_non_nullable
as int?,solicitorRef: freezed == solicitorRef ? _self.solicitorRef : solicitorRef // ignore: cast_nullable_to_non_nullable
as int?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<IncidenciaFile>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncidenciaCategory,
  ));
}


}

// dart format on
