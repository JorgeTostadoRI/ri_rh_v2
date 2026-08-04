import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ri_rh_v2/config/incidencia_categories.dart';
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
        
        required DateTime start,
        required DateTime end,
        required String reason,
        required List<IncidenciaFile> files,

        @JsonKey(defaultValue: '')
        required String categoryId,
    }) = _Incidencia;

    factory Incidencia.fromJson(Map<String, Object?> json) => _$IncidenciaFromJson(json);

    factory Incidencia.fromApiModel(IncidenciaApiModel model, {
      required String category,
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
            'category': category,
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
        start: model.start,
        end: model.end,
        reason: model.reason,
        files: model.files,
        categoryId: category,
      );
    }
}

extension IncidenciaGetters on Incidencia {
  String get categoryName {
    return switch(categoryId) {
      permisoCategory => 'Permiso',
      faltaCategory => 'Falta',
      horasExtraCategory => 'Horas Extra',
      vacacionesCategory => 'Vacaciones',
      retardoCategory => 'Retardo',
      incapacidadCategory => 'Incapacidad',
      requerimientoJudicialCategory => 'Requerimiento Judicial',
      _ => 'Desconocido',
    };
  }
}
