import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/data/repositories/incidencias/incidencias_repository.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/utils/result.dart';

class IncidenciasViewmodel extends ChangeNotifier {
  IncidenciasViewmodel({
    required IncidenciasRepository incidenciasRepository,
  }) : _incidenciasRepository = incidenciasRepository;

  final IncidenciasRepository _incidenciasRepository;

  List<IncidenciaCategory> get categories { 
    return [
      const IncidenciaCategory(
        id: "permisos",
        label: "Permisos",
        icon: LucideIcons.fileText,
        description: "Solicitar permiso de ausencia justificada",
        color: Color(0xFFE87B1E),
        bg: Color(0xFFFFF0DC),
        canCreate: true,
      ),
      const IncidenciaCategory(
        id: "faltas",
        label: "Faltas",
        icon: LucideIcons.userX,
        description: "Registro de inasistencias",
        color: Color(0xFFD94F3D),
        bg: Color(0xFFFEF0EE),
        canCreate: false,
      ),
      const IncidenciaCategory(
        id: "horas-extras",
        label: "Horas Extras",
        icon: LucideIcons.clock,
        description: "Reportar tiempo adicional trabajado",
        color: Color(0xFF2E8B57),
        bg: Color(0xFFEDF7F1),
        canCreate: true,
      ),
      const IncidenciaCategory(
        id: "vacaciones",
        label: "Vacaciones",
        icon: LucideIcons.palmtree,
        description: "Solicitar periodo vacacional",
        color: Color(0xFF1A7ABF),
        bg: Color(0xFFEBF4FB),
        canCreate: true,
      ),
      const IncidenciaCategory(
        id: "retardos",
        label: "Retardos",
        icon: LucideIcons.alarmClock,
        description: "Registro de llegadas tardías",
        color: Color(0xFFC4820A),
        bg: Color(0xFFFEF8E7),
        canCreate: false,
      ),
      const IncidenciaCategory(
        id: "incapacidades",
        label: "Incapacidades",
        icon: LucideIcons.stethoscope,
        description:
            "Registra tu incapacidad impartida por el IMSS",
        color: Color(0xFF1E8A9A),
        bg: Color(0xFFEBF7F9),
        canCreate: true,
      ),
      const IncidenciaCategory(
        id: "requerimientos-judiciales",
        label: "Requerimientos Judiciales",
        icon: LucideIcons.scroll,
        description: "Registra tu requerimiento por parte de un juez",
        color: Color(0xFFD94F3D),
        bg: Color(0xFFFEF0EE),
        canCreate: true,
      ),
    ];
  }
}