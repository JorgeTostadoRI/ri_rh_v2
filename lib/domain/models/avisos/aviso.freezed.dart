// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aviso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Aviso {

 int? get id; DateTime? get createdAt; DateTime? get updatedAt; String? get attachment; String get content; DateTime get showAt;@JsonKey(includeFromJson: false, includeToJson: false) PlatformFile? get attachmentFile;
/// Create a copy of Aviso
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvisoCopyWith<Aviso> get copyWith => _$AvisoCopyWithImpl<Aviso>(this as Aviso, _$identity);

  /// Serializes this Aviso to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Aviso&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.content, content) || other.content == content)&&(identical(other.showAt, showAt) || other.showAt == showAt)&&(identical(other.attachmentFile, attachmentFile) || other.attachmentFile == attachmentFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,attachment,content,showAt,attachmentFile);

@override
String toString() {
  return 'Aviso(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, attachment: $attachment, content: $content, showAt: $showAt, attachmentFile: $attachmentFile)';
}


}

/// @nodoc
abstract mixin class $AvisoCopyWith<$Res>  {
  factory $AvisoCopyWith(Aviso value, $Res Function(Aviso) _then) = _$AvisoCopyWithImpl;
@useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, String? attachment, String content, DateTime showAt,@JsonKey(includeFromJson: false, includeToJson: false) PlatformFile? attachmentFile
});




}
/// @nodoc
class _$AvisoCopyWithImpl<$Res>
    implements $AvisoCopyWith<$Res> {
  _$AvisoCopyWithImpl(this._self, this._then);

  final Aviso _self;
  final $Res Function(Aviso) _then;

/// Create a copy of Aviso
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attachment = freezed,Object? content = null,Object? showAt = null,Object? attachmentFile = freezed,}) {
  return _then(Aviso(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,showAt: null == showAt ? _self.showAt : showAt // ignore: cast_nullable_to_non_nullable
as DateTime,attachmentFile: freezed == attachmentFile ? _self.attachmentFile : attachmentFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,
  ));
}

}


/// Adds pattern-matching-related methods to [Aviso].
extension AvisoPatterns on Aviso {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Aviso value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Aviso() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Aviso value)  $default,){
final _that = this;
switch (_that) {
case _Aviso():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Aviso value)?  $default,){
final _that = this;
switch (_that) {
case _Aviso() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  String? attachment,  String content,  DateTime showAt, @JsonKey(includeFromJson: false, includeToJson: false)  PlatformFile? attachmentFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Aviso() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attachment,_that.content,_that.showAt,_that.attachmentFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  String? attachment,  String content,  DateTime showAt, @JsonKey(includeFromJson: false, includeToJson: false)  PlatformFile? attachmentFile)  $default,) {final _that = this;
switch (_that) {
case _Aviso():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attachment,_that.content,_that.showAt,_that.attachmentFile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  DateTime? createdAt,  DateTime? updatedAt,  String? attachment,  String content,  DateTime showAt, @JsonKey(includeFromJson: false, includeToJson: false)  PlatformFile? attachmentFile)?  $default,) {final _that = this;
switch (_that) {
case _Aviso() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.attachment,_that.content,_that.showAt,_that.attachmentFile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Aviso implements Aviso {
  const _Aviso({this.id, this.createdAt, this.updatedAt, this.attachment, required this.content, required this.showAt, @JsonKey(includeFromJson: false, includeToJson: false) this.attachmentFile});
  factory _Aviso.fromJson(Map<String, dynamic> json) => _$AvisoFromJson(json);

@override final  int? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String? attachment;
@override final  String content;
@override final  DateTime showAt;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  PlatformFile? attachmentFile;

/// Create a copy of Aviso
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvisoCopyWith<_Aviso> get copyWith => __$AvisoCopyWithImpl<_Aviso>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvisoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Aviso&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.attachment, attachment) || other.attachment == attachment)&&(identical(other.content, content) || other.content == content)&&(identical(other.showAt, showAt) || other.showAt == showAt)&&(identical(other.attachmentFile, attachmentFile) || other.attachmentFile == attachmentFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,attachment,content,showAt,attachmentFile);

@override
String toString() {
  return 'Aviso(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, attachment: $attachment, content: $content, showAt: $showAt, attachmentFile: $attachmentFile)';
}


}

/// @nodoc
abstract mixin class _$AvisoCopyWith<$Res> implements $AvisoCopyWith<$Res> {
  factory _$AvisoCopyWith(_Aviso value, $Res Function(_Aviso) _then) = __$AvisoCopyWithImpl;
@override @useResult
$Res call({
 int? id, DateTime? createdAt, DateTime? updatedAt, String? attachment, String content, DateTime showAt,@JsonKey(includeFromJson: false, includeToJson: false) PlatformFile? attachmentFile
});




}
/// @nodoc
class __$AvisoCopyWithImpl<$Res>
    implements _$AvisoCopyWith<$Res> {
  __$AvisoCopyWithImpl(this._self, this._then);

  final _Aviso _self;
  final $Res Function(_Aviso) _then;

/// Create a copy of Aviso
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? attachment = freezed,Object? content = null,Object? showAt = null,Object? attachmentFile = freezed,}) {
  return _then(_Aviso(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,showAt: null == showAt ? _self.showAt : showAt // ignore: cast_nullable_to_non_nullable
as DateTime,attachmentFile: freezed == attachmentFile ? _self.attachmentFile : attachmentFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,
  ));
}


}

// dart format on
