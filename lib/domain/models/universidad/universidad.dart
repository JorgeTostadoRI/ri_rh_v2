import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'universidad.freezed.dart';
part 'universidad.g.dart';

@freezed
abstract class Universidad with _$Universidad {
  const factory Universidad({
    @Default(0)
    int id,
    required String nombre,
    required String direccion,
    required String numeroContacto,
  }) = _Universidad;

  factory Universidad.fromJson(Map<String, Object?> json) => _$UniversidadFromJson(json);
}
