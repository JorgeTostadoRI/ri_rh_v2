import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/data/repositories/practicantes/practicantes_repository.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/seguimiento_practicantes_viewmodel.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

/// Pestaña "Practicantes" de Reclutamiento: solo de consulta -- los
/// practicantes en alta con fecha de terminación, si su jefe ya contestó la
/// evaluación y qué contestó. A los que el jefe decidió contratar, muestra en
/// qué va su contratación; esa se maneja en Pendientes, como cualquier
/// solicitud (Dirección la aprueba y RH la inicia desde ahí).
class PracticantesSeguimientoSection extends StatefulWidget {
  const PracticantesSeguimientoSection({super.key, required this.viewmodel});

  final SeguimientoPracticantesViewmodel viewmodel;

  @override
  State<PracticantesSeguimientoSection> createState() => _PracticantesSeguimientoSectionState();
}

class _PracticantesSeguimientoSectionState extends State<PracticantesSeguimientoSection> {
  @override
  void initState() {
    super.initState();
    // Datos frescos cada vez que se abre la pestaña.
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([widget.viewmodel, widget.viewmodel.load]),
      builder: (context, _) {
        if (widget.viewmodel.load.running && widget.viewmodel.items == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (widget.viewmodel.load.error && widget.viewmodel.items == null) {
          return Column(
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              const Text('No se pudo cargar la lista'),
              ElevatedButton.icon(
                onPressed: () => widget.viewmodel.load.execute(),
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          );
        }

        final items = widget.viewmodel.items ?? const <SeguimientoPracticanteItem>[];
        if (items.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('No hay practicantes con fecha de terminación asignada.'),
          );
        }

        return Column(
          children: [for (final item in items) _PracticanteRow(item: item)],
        );
      },
    );
  }
}

class _PracticanteRow extends StatelessWidget {
  const _PracticanteRow({required this.item});

  static final _fecha = DateFormat('dd/MM/yyyy');

  final SeguimientoPracticanteItem item;

  /// En qué va la contratación de alguien que el jefe decidió contratar.
  String _detalleContratacion() {
    if (item.candidatoEstado == 'iniciado') return 'Contratación iniciada -- esperando que complete sus datos';
    if (item.candidatoEstado == 'completado') {
      return item.contratoSolicitado
          ? 'Contrato solicitado -- falta completar su alta como empleado'
          : 'Ya completó sus datos -- falta revisarlos y solicitar su contrato';
    }
    return switch (item.solicitudEstatus) {
      'pendiente' => 'Esperando la aprobación de Dirección',
      'retroalimentacion' => 'Dirección la regresó al jefe: ${item.comentarioDireccion}',
      'aceptada' => 'Aprobada por Dirección -- inicia su contratación en Pendientes',
      'rechazada' => 'Rechazada por Dirección -- terminan sus prácticas',
      _ => 'Contestó el ${_fecha.format(item.evaluacionRespondidaEn!)}',
    };
  }

  @override
  Widget build(BuildContext context) {
    final (etiqueta, color, fondo) = switch (item.etapa) {
      EtapaSeguimientoPracticante.enCurso => ('En curso', context.rh.etiqueta, context.rh.relleno),
      EtapaSeguimientoPracticante.evaluacionPendiente => (
        item.solicitudEstatus == 'retroalimentacion' ? 'Evaluación regresada al jefe' : 'Evaluación pendiente',
        context.rh.avisoTexto,
        context.rh.avisoFondo,
      ),
      EtapaSeguimientoPracticante.contratar => ('Contratar como empleado', context.rh.exitoTexto, context.rh.exitoFondo),
      EtapaSeguimientoPracticante.terminar => (
        item.tipo == 'Residente' ? 'Termina su residencia' : 'Termina sus prácticas',
        context.rh.falloTexto,
        context.rh.falloFondo,
      ),
    };

    final detalle = switch (item.etapa) {
      EtapaSeguimientoPracticante.enCurso => null,
      EtapaSeguimientoPracticante.evaluacionPendiente =>
        item.solicitudEstatus == 'retroalimentacion'
            ? 'Comentario de Dirección: ${item.comentarioDireccion}'
            : item.evaluacionNotificadaEn != null
            ? 'Se le avisó a su jefe el ${_fecha.format(item.evaluacionNotificadaEn!)}'
            : 'El aviso a su jefe sale en el siguiente envío diario',
      EtapaSeguimientoPracticante.contratar => _detalleContratacion(),
      EtapaSeguimientoPracticante.terminar =>
        'Contestó el ${_fecha.format(item.evaluacionRespondidaEn!)} -- pasa a proceso de baja al día siguiente de su fecha. '
            'Motivo: ${item.evaluacionMotivo}',
    };

    final secundario = TextStyle(fontSize: 12, color: context.rh.etiqueta);

    final columnas = <Expanded>[
      Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: .start,
          spacing: 2,
          children: [
            Text(item.nombreCompleto, overflow: esNavegadorMovil ? null : .ellipsis),
            Text(
              '${item.tipo} · ${item.puesto}',
              style: secundario,
              overflow: esNavegadorMovil ? null : .ellipsis,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: .start,
          spacing: 2,
          children: [
            Text('Termina el ${_fecha.format(item.fechaTerminacion)}'),
            Text(item.jefe.isEmpty ? 'Sin jefe directo' : 'Jefe: ${item.jefe}', style: secundario),
          ],
        ),
      ),
      Expanded(
        flex: 4,
        child: Column(
          crossAxisAlignment: .start,
          spacing: 4,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(color: fondo, borderRadius: BorderRadius.circular(12)),
              child: Text(etiqueta, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
            ),
            if (detalle != null) Text(detalle, style: secundario),
          ],
        ),
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.rh.superficie, width: 1)),
      ),
      // Navegador de celular: los 3 bloques uno debajo de otro (en columnas
      // quedaban de ~90, 60 y 120 px, casi todo cortado).
      child: esNavegadorMovil
          ? Column(
              crossAxisAlignment: .stretch,
              spacing: 8,
              children: [for (final Expanded(:child) in columnas) child],
            )
          : Row(
              spacing: 16,
              crossAxisAlignment: .start,
              children: columnas,
            ),
    );
  }
}
