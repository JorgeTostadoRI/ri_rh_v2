abstract final class ApiErrorCodes {
  static const lateEntry = 'late_entry';
  static const earlyEntry = 'early_entry';
  static const noHorario = 'no_horario';
  static const noJefe = 'no_jefe';
  static const faltaNoReportada = 'falta_no_reportada';
  /// Usuario desactivado (empleado en proceso de finiquito/finiquitado o
  /// practicante en proceso de baja/baja) al checar con huella.
  static const usuarioInactivo = 'usuario_inactivo';
  /// Ya hizo todas sus checadas del día. Trae `nombre` en el cuerpo.
  static const registrosCompletos = 'registros_completos';
}
