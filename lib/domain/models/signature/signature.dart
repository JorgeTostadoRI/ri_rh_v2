import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature.freezed.dart';
part 'signature.g.dart';

@freezed
abstract class Signature with _$Signature {
    const factory Signature({
        required int id,
        required DateTime createdAt,
        required DateTime updatedAt,
        required int usuario,
    }) = _Signature;

    factory Signature.fromJson(Map<String, Object?> json) => _$SignatureFromJson(json);
}
