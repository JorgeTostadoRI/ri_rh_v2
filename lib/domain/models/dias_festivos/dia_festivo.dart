import 'package:freezed_annotation/freezed_annotation.dart';

part 'dia_festivo.freezed.dart';
part 'dia_festivo.g.dart';

@freezed
abstract class DiaFestivo with _$DiaFestivo {
  const factory DiaFestivo({
    // Populated on creation
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,

    required DateTime fecha,
    @Default('') String nombre,
  }) = _DiaFestivo;

  factory DiaFestivo.fromJson(Map<String, dynamic> json) =>
      _$DiaFestivoFromJson(json);
}
