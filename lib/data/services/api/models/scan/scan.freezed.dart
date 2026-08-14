// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Scan {

 Uint8List get template; Uint8List get image; int get width; int get height;
/// Create a copy of Scan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanCopyWith<Scan> get copyWith => _$ScanCopyWithImpl<Scan>(this as Scan, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scan&&const DeepCollectionEquality().equals(other.template, template)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(template),const DeepCollectionEquality().hash(image),width,height);

@override
String toString() {
  return 'Scan(template: $template, image: $image, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $ScanCopyWith<$Res>  {
  factory $ScanCopyWith(Scan value, $Res Function(Scan) _then) = _$ScanCopyWithImpl;
@useResult
$Res call({
 Uint8List template, Uint8List image, int width, int height
});




}
/// @nodoc
class _$ScanCopyWithImpl<$Res>
    implements $ScanCopyWith<$Res> {
  _$ScanCopyWithImpl(this._self, this._then);

  final Scan _self;
  final $Res Function(Scan) _then;

/// Create a copy of Scan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? template = null,Object? image = null,Object? width = null,Object? height = null,}) {
  return _then(Scan(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as Uint8List,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Scan].
extension ScanPatterns on Scan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scan value)  $default,){
final _that = this;
switch (_that) {
case _Scan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scan value)?  $default,){
final _that = this;
switch (_that) {
case _Scan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List template,  Uint8List image,  int width,  int height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scan() when $default != null:
return $default(_that.template,_that.image,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List template,  Uint8List image,  int width,  int height)  $default,) {final _that = this;
switch (_that) {
case _Scan():
return $default(_that.template,_that.image,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List template,  Uint8List image,  int width,  int height)?  $default,) {final _that = this;
switch (_that) {
case _Scan() when $default != null:
return $default(_that.template,_that.image,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc


class _Scan implements Scan {
  const _Scan({required this.template, required this.image, required this.width, required this.height});
  

@override final  Uint8List template;
@override final  Uint8List image;
@override final  int width;
@override final  int height;

/// Create a copy of Scan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanCopyWith<_Scan> get copyWith => __$ScanCopyWithImpl<_Scan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scan&&const DeepCollectionEquality().equals(other.template, template)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(template),const DeepCollectionEquality().hash(image),width,height);

@override
String toString() {
  return 'Scan(template: $template, image: $image, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$ScanCopyWith<$Res> implements $ScanCopyWith<$Res> {
  factory _$ScanCopyWith(_Scan value, $Res Function(_Scan) _then) = __$ScanCopyWithImpl;
@override @useResult
$Res call({
 Uint8List template, Uint8List image, int width, int height
});




}
/// @nodoc
class __$ScanCopyWithImpl<$Res>
    implements _$ScanCopyWith<$Res> {
  __$ScanCopyWithImpl(this._self, this._then);

  final _Scan _self;
  final $Res Function(_Scan) _then;

/// Create a copy of Scan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? template = null,Object? image = null,Object? width = null,Object? height = null,}) {
  return _then(_Scan(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as Uint8List,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Uint8List,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
