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

  final List<IncidenciaCategory> incidenciaCategories = [
  IncidenciaCategory(
    id: "permisos",
    label: "Permisos",
    icon: LucideIcons.fileText,
    description: "Solicitar permiso de ausencia justificada",
    color: Color(0xFFE87B1E),
    bg: Color(0xFFFFF0DC),
  ),
  IncidenciaCategory(
    id: "faltas",
    label: "Faltas",
    icon: LucideIcons.userX,
    description: "Registro de inasistencias",
    color: Color(0xFFD94F3D),
    bg: Color(0xFFFEF0EE),
  ),
  IncidenciaCategory(
    id: "horas-extras",
    label: "Horas Extras",
    icon: LucideIcons.clock,
    description: "Reportar tiempo adicional trabajado",
    color: Color(0xFF2E8B57),
    bg: Color(0xFFEDF7F1),
  ),
  IncidenciaCategory(
    id: "vacaciones",
    label: "Vacaciones",
    icon: LucideIcons.palmtree,
    description: "Solicitar periodo vacacional",
    color: Color(0xFF1A7ABF),
    bg: Color(0xFFEBF4FB),
  ),
  IncidenciaCategory(
    id: "retardos",
    label: "Retardos",
    icon: LucideIcons.alarmClock,
    description: "Registro de llegadas tardías",
    color: Color(0xFFC4820A),
    bg: Color(0xFFFEF8E7),
  ),
  IncidenciaCategory(
    id: "incapacidades",
    label: "Incapacidades / Requerimientos Judiciales",
    icon: LucideIcons.stethoscope,
    description:
        "Registra tu incapacidad impartida por el IMSS o tu requerimiento por parte de un juez",
    color: Color(0xFF1E8A9A),
    bg: Color(0xFFEBF7F9),
  ),
  IncidenciaCategory(
    id: "bajas",
    label: "Bajas",
    icon: LucideIcons.arrowBigDownDash,
    description: "Registra la terminación definitiva de contrato",
    color: Color(0xFFD94F3D),
    bg: Color(0xFFFEF0EE),
  ),
];
}