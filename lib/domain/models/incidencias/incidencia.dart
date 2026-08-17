import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/data/services/api/models/incidencia/incidencia_api_model.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_file.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/model_exception.dart';

part 'incidencia.freezed.dart';
part 'incidencia.g.dart';

@JsonEnum()
enum IncidenciaState {
  @JsonValue('PE')
  pending,
  @JsonValue('RE')
  rejected,
  @JsonValue('AP')
  approved,
}

extension IncidenciaStateValue on IncidenciaState {
  String get jsonValue => _$IncidenciaStateEnumMap[this]!;
}

@JsonEnum(valueField: 'id')
enum IncidenciaCategory {
  permiso('permiso', 'permisos', 'Permisos'),
  horasextra('horasextra', 'horas-extras', 'Horas Extras'),
  vacaciones('vacaciones', 'vacaciones', 'Vacaciones'),
  incapacidad('incapacidad', 'incapacidades', 'Incapacidades'),
  requerimientojudicial('requerimientojudicial', 'requerimientos-judiciales', 'Requerimientos Judiciales'),
  falta('falta', 'faltas', 'Faltas'),
  retardo('retardo', 'retardos', 'Retardos');

  final String id;
  final String url;
  final String label;
  const IncidenciaCategory(this.id, this.url, this.label);
}

@freezed
abstract class Incidencia with _$Incidencia {
    const factory Incidencia({
        // Populados en creacion
        int? id,
        DateTime? createdAt,
        DateTime? updatedAt,
        IncidenciaState? state,
        User? revisor,

        // Se puede agregar por RH
        User? solicitor,
        // Agregado al rechazar la incidencia
        String? rejectionReason,

        String? pdfUrl,
        
        required DateTime start,
        required DateTime end,
        required String reason,
        required List<IncidenciaFile> files,

        required IncidenciaCategory category,
    }) = _Incidencia;

    factory Incidencia.fromJson(Map<String, Object?> json) => _$IncidenciaFromJson(json);

    factory Incidencia.fromApiModel(IncidenciaApiModel model, {
      required List<User> users,
    }) {
      late final User solicitor;
      late final User? revisor;

      try {
        solicitor = users.firstWhere((user) => user.id == model.solicitorRef);
        if (model.revisorRef != null) {
          revisor = users.firstWhere((user) => user.id == model.revisorRef);
        } else {
          revisor = null;
        }
      } on StateError {
        throw ModelException(
          'Failed to find element for incidencia',
          context: {
            'model': 'Incidencia',
            'category': model.category,
            'id': model.id,
            'solicitorRef': model.solicitorRef,
            'revisorRef': model.revisorRef,
          },
        );
      }

      return Incidencia(
        id: model.id,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        state: model.state,
        revisor: revisor,
        solicitor: solicitor,
        rejectionReason: model.rejectionReason,
        pdfUrl: model.pdfUrl,
        start: model.start,
        end: model.end,
        reason: model.reason,
        files: model.files,
        category: model.category,
      );
    }
}

extension IncidenciaGetters on Incidencia {
  String get categoryName {
    return switch(category) {
      IncidenciaCategory.permiso => 'Permiso',
      IncidenciaCategory.falta => 'Falta',
      IncidenciaCategory.horasextra => 'Horas Extra',
      IncidenciaCategory.vacaciones => 'Vacaciones',
      IncidenciaCategory.retardo => 'Retardo',
      IncidenciaCategory.incapacidad => 'Incapacidad',
      IncidenciaCategory.requerimientojudicial => 'Requerimiento Judicial',
    };
  }
}
