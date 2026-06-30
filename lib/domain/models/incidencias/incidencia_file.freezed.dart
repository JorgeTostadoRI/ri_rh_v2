// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incidencia_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidenciaFile implements DiagnosticableTreeMixin {

 int? get id; DateTime? get createdAt; DateTime? get updatedAt;@JsonKey(name: 'file') String get filepath;@JsonKey(includeFromJson: false, includeToJson: false) PlatformFile? get file;
/// Create a copy of IncidenciaFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidenciaFileCopyWith<IncidenciaFile> get copyWith => _$IncidenciaFileCopyWithImpl<IncidenciaFile>(this as IncidenciaFile, _$identity);

  /// Serializes this IncidenciaFile to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IncidenciaFile'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('filepath', filepath))..add(DiagnosticsProperty('file', file));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidenciaFile&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.filepath, filepath) || other.filepath == filepath)&&(identical(other.file, file) || other.file == file));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,filepath,file);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IncidenciaFile(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, filepath: $filepath, file: $file)';
}


}

/// @nodoc
abstract mixin class $IncidenciaFileCopyWith<$Res>  {
  factory $IncidenciaFileCopyWith(IncidenciaFile value, $Res Function(IncidenciaFile) _then) = _$IncidenciaFileCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt,@JsonKey(name: 'file') String filepath,@JsonKey(includeFromJson: false, includeToJson: false) PlatformFile? file
});




}
/// @nodoc
class _$IncidenciaFileCopyWithImpl<$Res>
    implements $IncidenciaFileCopyWith<$Res> {
  _$IncidenciaFileCopyWithImpl(this._self, this._then);

  final IncidenciaFile _self;
  final $Res Function(IncidenciaFile) _then;

/// Create a copy of IncidenciaFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? filepath = null,Object? file = freezed,}) {
  return _then(IncidenciaFile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,filepath: null == filepath ? _self.filepath : filepath // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as PlatformFile?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidenciaFile].
extension IncidenciaFilePatterns on IncidenciaFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidenciaFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidenciaFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidenciaFile value)  $default,){
final _that = this;
switch (_that) {
case _IncidenciaFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidenciaFile value)?  $default,){
final _that = this;
switch (_that) {
case _IncidenciaFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(name: 'file')  String filepath, @JsonKey(includeFromJson: false, includeToJson: false)  PlatformFile? file)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidenciaFile() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.filepath,_that.file);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(name: 'file')  String filepath, @JsonKey(includeFromJson: false, includeToJson: false)  PlatformFile? file)  $default,) {final _that = this;
switch (_that) {
case _IncidenciaFile():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.filepath,_that.file);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(name: 'file')  String filepath, @JsonKey(includeFromJson: false, includeToJson: false)  PlatformFile? file)?  $default,) {final _that = this;
switch (_that) {
case _IncidenciaFile() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.filepath,_that.file);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidenciaFile with DiagnosticableTreeMixin implements IncidenciaFile {
  const _IncidenciaFile({this.id, this.createdAt, this.updatedAt, @JsonKey(name: 'file') required this.filepath, @JsonKey(includeFromJson: false, includeToJson: false) this.file});
  factory _IncidenciaFile.fromJson(Map<String, dynamic> json) => _$IncidenciaFileFromJson(json);

@override final  int? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey(name: 'file') final  String filepath;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  PlatformFile? file;

/// Create a copy of IncidenciaFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidenciaFileCopyWith<_IncidenciaFile> get copyWith => __$IncidenciaFileCopyWithImpl<_IncidenciaFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidenciaFileToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IncidenciaFile'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt))..add(DiagnosticsProperty('filepath', filepath))..add(DiagnosticsProperty('file', file));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidenciaFile&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.filepath, filepath) || other.filepath == filepath)&&(identical(other.file, file) || other.file == file));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,filepath,file);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IncidenciaFile(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, filepath: $filepath, file: $file)';
}


}

/// @nodoc
abstract mixin class _$IncidenciaFileCopyWith<$Res> implements $IncidenciaFileCopyWith<$Res> {
  factory _$IncidenciaFileCopyWith(_IncidenciaFile value, $Res Function(_IncidenciaFile) _then) = __$IncidenciaFileCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt,@JsonKey(name: 'file') String filepath,@JsonKey(includeFromJson: false, includeToJson: false) PlatformFile? file
});




}
/// @nodoc
class __$IncidenciaFileCopyWithImpl<$Res>
    implements _$IncidenciaFileCopyWith<$Res> {
  __$IncidenciaFileCopyWithImpl(this._self, this._then);

  final _IncidenciaFile _self;
  final $Res Function(_IncidenciaFile) _then;

/// Create a copy of IncidenciaFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? filepath = null,Object? file = freezed,}) {
  return _then(_IncidenciaFile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,filepath: null == filepath ? _self.filepath : filepath // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as PlatformFile?,
  ));
}


}

// dart format on
