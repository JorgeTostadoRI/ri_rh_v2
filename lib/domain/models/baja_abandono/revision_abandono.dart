import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'revision_abandono.freezed.dart';
part 'revision_abandono.g.dart';

/// Revisión previa a "Forzar baja por abandono" (empleado en proceso de
/// finiquito o practicante en proceso de baja): sus últimos 4 días
/// laborables según el checador. Solo procede si en ninguno checó; si no,
/// `motivo` explica por qué. El backend la vuelve a calcular al confirmar.
@freezed
abstract class RevisionAbandono with _$RevisionAbandono {
  const factory RevisionAbandono({
    required bool procede,
    @Default('') String motivo,
    DateTime? ultimaChecada,
    @Default([]) List<DiaRevisadoAbandono> dias,
  }) = _RevisionAbandono;

  factory RevisionAbandono.fromJson(Map<String, Object?> json) => _$RevisionAbandonoFromJson(json);
}

@freezed
abstract class DiaRevisadoAbandono with _$DiaRevisadoAbandono {
  const factory DiaRevisadoAbandono({
    required DateTime fecha,
    required int checadas,
  }) = _DiaRevisadoAbandono;

  factory DiaRevisadoAbandono.fromJson(Map<String, Object?> json) => _$DiaRevisadoAbandonoFromJson(json);
}

/// Lo que RH captura al forzar la baja: fecha, por qué se fuerza
/// (justificación), nota de los intentos de contacto y al menos un archivo
/// de evidencia.
typedef BajaAbandonoParams = ({
  int id,
  DateTime fechaBaja,
  String justificacion,
  String nota,
  List<PlatformFile> evidencias,
});
