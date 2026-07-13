// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthChallenge implements DiagnosticableTreeMixin {

 String get authSessionId; String get nonce; int get expiresInSeconds;
/// Create a copy of AuthChallenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthChallengeCopyWith<AuthChallenge> get copyWith => _$AuthChallengeCopyWithImpl<AuthChallenge>(this as AuthChallenge, _$identity);

  /// Serializes this AuthChallenge to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthChallenge'))
    ..add(DiagnosticsProperty('authSessionId', authSessionId))..add(DiagnosticsProperty('nonce', nonce))..add(DiagnosticsProperty('expiresInSeconds', expiresInSeconds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthChallenge&&(identical(other.authSessionId, authSessionId) || other.authSessionId == authSessionId)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authSessionId,nonce,expiresInSeconds);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthChallenge(authSessionId: $authSessionId, nonce: $nonce, expiresInSeconds: $expiresInSeconds)';
}


}

/// @nodoc
abstract mixin class $AuthChallengeCopyWith<$Res>  {
  factory $AuthChallengeCopyWith(AuthChallenge value, $Res Function(AuthChallenge) _then) = _$AuthChallengeCopyWithImpl;
@useResult
$Res call({
 String authSessionId, String nonce, int expiresInSeconds
});




}
/// @nodoc
class _$AuthChallengeCopyWithImpl<$Res>
    implements $AuthChallengeCopyWith<$Res> {
  _$AuthChallengeCopyWithImpl(this._self, this._then);

  final AuthChallenge _self;
  final $Res Function(AuthChallenge) _then;

/// Create a copy of AuthChallenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authSessionId = null,Object? nonce = null,Object? expiresInSeconds = null,}) {
  return _then(AuthChallenge(
authSessionId: null == authSessionId ? _self.authSessionId : authSessionId // ignore: cast_nullable_to_non_nullable
as String,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthChallenge].
extension AuthChallengePatterns on AuthChallenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthChallenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthChallenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthChallenge value)  $default,){
final _that = this;
switch (_that) {
case _AuthChallenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthChallenge value)?  $default,){
final _that = this;
switch (_that) {
case _AuthChallenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String authSessionId,  String nonce,  int expiresInSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthChallenge() when $default != null:
return $default(_that.authSessionId,_that.nonce,_that.expiresInSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String authSessionId,  String nonce,  int expiresInSeconds)  $default,) {final _that = this;
switch (_that) {
case _AuthChallenge():
return $default(_that.authSessionId,_that.nonce,_that.expiresInSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String authSessionId,  String nonce,  int expiresInSeconds)?  $default,) {final _that = this;
switch (_that) {
case _AuthChallenge() when $default != null:
return $default(_that.authSessionId,_that.nonce,_that.expiresInSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthChallenge with DiagnosticableTreeMixin implements AuthChallenge {
  const _AuthChallenge({required this.authSessionId, required this.nonce, required this.expiresInSeconds});
  factory _AuthChallenge.fromJson(Map<String, dynamic> json) => _$AuthChallengeFromJson(json);

@override final  String authSessionId;
@override final  String nonce;
@override final  int expiresInSeconds;

/// Create a copy of AuthChallenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthChallengeCopyWith<_AuthChallenge> get copyWith => __$AuthChallengeCopyWithImpl<_AuthChallenge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthChallengeToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthChallenge'))
    ..add(DiagnosticsProperty('authSessionId', authSessionId))..add(DiagnosticsProperty('nonce', nonce))..add(DiagnosticsProperty('expiresInSeconds', expiresInSeconds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthChallenge&&(identical(other.authSessionId, authSessionId) || other.authSessionId == authSessionId)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authSessionId,nonce,expiresInSeconds);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthChallenge(authSessionId: $authSessionId, nonce: $nonce, expiresInSeconds: $expiresInSeconds)';
}


}

/// @nodoc
abstract mixin class _$AuthChallengeCopyWith<$Res> implements $AuthChallengeCopyWith<$Res> {
  factory _$AuthChallengeCopyWith(_AuthChallenge value, $Res Function(_AuthChallenge) _then) = __$AuthChallengeCopyWithImpl;
@override @useResult
$Res call({
 String authSessionId, String nonce, int expiresInSeconds
});




}
/// @nodoc
class __$AuthChallengeCopyWithImpl<$Res>
    implements _$AuthChallengeCopyWith<$Res> {
  __$AuthChallengeCopyWithImpl(this._self, this._then);

  final _AuthChallenge _self;
  final $Res Function(_AuthChallenge) _then;

/// Create a copy of AuthChallenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authSessionId = null,Object? nonce = null,Object? expiresInSeconds = null,}) {
  return _then(_AuthChallenge(
authSessionId: null == authSessionId ? _self.authSessionId : authSessionId // ignore: cast_nullable_to_non_nullable
as String,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
