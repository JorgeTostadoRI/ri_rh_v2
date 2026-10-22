import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/step_timeline.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/altas_imss_viewmodel.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

const _fase2StepLabelsIndeterminado = ['Solicitud enviada', 'Alta archivada'];

List<String> _fase2StepLabels(int totalSteps, EvaluacionRespuesta? respuesta) {
  if (totalSteps != 4) return _fase2StepLabelsIndeterminado;
  final resultado = switch (respuesta) {
    EvaluacionRespuesta.renovar => 'Contrato definitivo firmado',
    EvaluacionRespuesta.noRenovar => 'Proceso de baja iniciado',
    null => 'Resultado',
  };
  return ['Solicitud enviada', 'Alta archivada', 'Evaluación', resultado];
}

int _fase2CurrentStep(Fase2Stage stage) => switch (stage) {
  Fase2Stage.pendienteEnvio => -1,
  Fase2Stage.enviado => 0,
  Fase2Stage.archivado => 1,
  Fase2Stage.evaluacionPendiente => 1,
  Fase2Stage.evaluacionRespondida => 2,
  Fase2Stage.contratoFirmado => 3,
  Fase2Stage.bajaIniciada => 3,
};

/// Progreso de "Fase 2" (seguimiento posterior a la contratación) de un
/// candidato ya contratado -- se muestra junto a su fila en la pestaña
/// "Pendientes" de Reclutamiento, debajo del `StepTimeline` de 6 pasos de
/// `CandidatoStage`. Contrato "indeterminado": 2 pasos, termina en "Alta
/// archivada". Contrato "determinado": 4 pasos -- al vencer su periodo de
/// prueba/capacitación, el jefe directo contesta la evaluación (actividad
/// 16, desde su propia pantalla, no desde aquí) y eso ejecuta directo el
/// contrato nuevo o la no renovación; RH solo archiva el contrato
/// definitivo ya firmado (actividad 18) una vez que vuelve firmado.
///
/// Cada acción/indicador aparece directo en la fila, condicionado al paso
/// en el que va el empleado -- en cualquier momento se ve solo lo que
/// corresponde a ese paso, nunca todo junto. "Ver documento" del PDF de
/// alta IMSS NO vive aquí -- esa es la única función de la pestaña "Altas
/// IMSS" (`fase2_altas_imss_section.dart`). `mostrarAcciones` controla si
/// se ven los botones de subir (solo RH).
class Fase2ProgressPanel extends StatefulWidget {
  const Fase2ProgressPanel({
    super.key,
    required this.item,
    required this.viewmodel,
    required this.mostrarAcciones,
  });

  final AltaImssItem item;
  final AltasImssViewmodel viewmodel;
  final bool mostrarAcciones;

  @override
  State<Fase2ProgressPanel> createState() => _Fase2ProgressPanelState();
}

class _Fase2ProgressPanelState extends State<Fase2ProgressPanel> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.subirAltaImss.addListener(_onSubirAltaImss);
    widget.viewmodel.subirContratoDefinitivo.addListener(_onSubirContratoDefinitivo);
  }

  @override
  void dispose() {
    widget.viewmodel.subirAltaImss.removeListener(_onSubirAltaImss);
    widget.viewmodel.subirContratoDefinitivo.removeListener(_onSubirContratoDefinitivo);
    super.dispose();
  }

  void _onSubirAltaImss() {
    if (widget.viewmodel.subirAltaImss.completed) {
      widget.viewmodel.subirAltaImss.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alta IMSS archivada en el expediente')),
      );
      return;
    }
    if (widget.viewmodel.subirAltaImss.error) {
      final error = widget.viewmodel.subirAltaImss.result;
      widget.viewmodel.subirAltaImss.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo subir el archivo: $error')),
      );
    }
  }

  void _onSubirContratoDefinitivo() {
    if (widget.viewmodel.subirContratoDefinitivo.completed) {
      widget.viewmodel.subirContratoDefinitivo.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contrato definitivo archivado en el expediente')),
      );
      return;
    }
    if (widget.viewmodel.subirContratoDefinitivo.error) {
      final error = widget.viewmodel.subirContratoDefinitivo.result;
      widget.viewmodel.subirContratoDefinitivo.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo subir el archivo: $error')),
      );
    }
  }

  Future<void> _elegirYSubirAltaImss() async {
    final result = await FilePicker.pickFiles(type: FileType.custom, withData: true, allowedExtensions: ['pdf']);
    if (result == null || result.files.isEmpty) return;
    final archivo = result.files.first;
    if (!mounted) return;

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Subir alta IMSS'),
        content: Text(
          '¿Archivar "${archivo.name}" como el acuse de alta IMSS de ${widget.item.nombreCompleto}?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Subir')),
        ],
      ),
    );
    if (confirmado != true) return;

    widget.viewmodel.subirAltaImss.execute((empleadoId: widget.item.id, archivo: archivo));
  }

  Future<void> _elegirYSubirContratoDefinitivo() async {
    final result = await FilePicker.pickFiles(type: FileType.custom, withData: true, allowedExtensions: ['pdf']);
    if (result == null || result.files.isEmpty) return;
    final archivo = result.files.first;
    if (!mounted) return;

    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Subir contrato definitivo'),
        content: Text(
          '¿Archivar "${archivo.name}" como el contrato definitivo firmado de ${widget.item.nombreCompleto}?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Subir')),
        ],
      ),
    );
    if (confirmado != true) return;

    widget.viewmodel.subirContratoDefinitivo.execute((empleadoId: widget.item.id, archivo: archivo));
  }

  String _estadoTexto(AltaImssItem item) => switch (item.fase2Stage) {
    Fase2Stage.pendienteEnvio => 'Pendiente del envío del viernes',
    Fase2Stage.enviado => 'Solicitud enviada, esperando acuse del contador',
    Fase2Stage.archivado => 'Alta archivada en el expediente',
    Fase2Stage.evaluacionPendiente => 'Alta archivada, esperando que el jefe directo conteste la evaluación',
    Fase2Stage.evaluacionRespondida => 'Evaluación contestada, pendiente el contrato definitivo',
    Fase2Stage.contratoFirmado => 'Contrato definitivo firmado y archivado',
    Fase2Stage.bajaIniciada => 'No se renueva -- proceso de baja iniciado',
  };

  static const Widget _procesoCompletadoChip = Chip(
    avatar: Icon(Icons.check_circle, size: 16, color: Color(0xFF008236)),
    label: Text('Proceso completado'),
    backgroundColor: Color(0xFFF0FDF4),
  );

  /// Lo único que se muestra junto al `StepTimeline`, según el paso actual
  /// -- nunca más de una cosa a la vez.
  List<Widget> _accionInline(AltaImssItem item) {
    switch (item.fase2Stage) {
      case Fase2Stage.enviado:
        if (!widget.mostrarAcciones) return const [];
        return [
          ListenableBuilder(
            listenable: widget.viewmodel.subirAltaImss,
            builder: (context, _) => TextButton.icon(
              onPressed: widget.viewmodel.subirAltaImss.running ? null : _elegirYSubirAltaImss,
              icon: const Icon(Icons.upload_outlined, size: 16),
              label: const Text('Subir alta IMSS'),
            ),
          ),
        ];

      case Fase2Stage.evaluacionPendiente:
        return [
          ActionChip(
            avatar: const Icon(Icons.warning_amber_rounded, size: 16, color: Colors.orange),
            label: const Text('Evaluación pendiente'),
            backgroundColor: const Color(0xFFFFF7ED),
            onPressed: () => context.go(Routes.evaluacionOfToken(item.evaluacionToken)),
          ),
        ];

      case Fase2Stage.evaluacionRespondida:
        return [
          Text(
            item.evaluacionRespuesta == EvaluacionRespuesta.renovar
                ? 'El jefe recomendó renovar'
                : 'El jefe recomendó no renovar: ${item.evaluacionMotivoNoRenovacion}',
            style: const TextStyle(fontSize: 11, color: Color(0xFF9A7B5A)),
          ),
          if (widget.mostrarAcciones)
            ListenableBuilder(
              listenable: widget.viewmodel.subirContratoDefinitivo,
              builder: (context, _) => TextButton.icon(
                onPressed: widget.viewmodel.subirContratoDefinitivo.running ? null : _elegirYSubirContratoDefinitivo,
                icon: const Icon(Icons.upload_outlined, size: 16),
                label: const Text('Subir contrato definitivo'),
              ),
            ),
        ];

      case Fase2Stage.contratoFirmado:
        // Renovó y ya se archivó el contrato definitivo -- no queda nada
        // más por hacer para este empleado.
        return const [_procesoCompletadoChip];

      case Fase2Stage.bajaIniciada:
        return const [
          Chip(
            avatar: Icon(Icons.person_off_outlined, size: 16, color: Color(0xFF9A3412)),
            label: Text('Proceso de baja iniciado'),
            backgroundColor: Color(0xFFFFF7ED),
          ),
        ];

      case Fase2Stage.archivado:
        // Para "indeterminado" (2 pasos) este SÍ es el último paso -- no
        // hay evaluación/contrato definitivo después, así que ya terminó
        // todo su seguimiento. Para "determinado" (4 pasos) es solo un
        // paso intermedio (le sigue la evaluación), nada que mostrar aquí
        // todavía.
        return item.fase2TotalSteps == 2 ? const [_procesoCompletadoChip] : const [];

      case Fase2Stage.pendienteEnvio:
        return const [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      crossAxisAlignment: .center,
      children: [
        StepTimeline(
          length: _fase2StepLabels(item.fase2TotalSteps, item.evaluacionRespuesta).length,
          currentStep: _fase2CurrentStep(item.fase2Stage),
          stepLabels: _fase2StepLabels(item.fase2TotalSteps, item.evaluacionRespuesta),
          color: Colors.blue,
        ),
        Text(_estadoTexto(item), style: const TextStyle(fontSize: 11, color: Color(0xFF9A7B5A))),
        if (item.fechaVencimientoPeriodo != null &&
            item.fase2Stage != Fase2Stage.contratoFirmado &&
            item.fase2Stage != Fase2Stage.bajaIniciada)
          Text(
            'Vence el ${item.fechaVencimientoPeriodo!.toShortIsoString()}',
            style: const TextStyle(fontSize: 11, color: Color(0xFF9A7B5A)),
          ),
        ..._accionInline(item),
      ],
    );
  }
}
