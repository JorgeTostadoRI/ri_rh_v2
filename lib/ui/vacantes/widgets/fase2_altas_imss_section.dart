import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/repositories/empleados/empleados_repository.dart';
import 'package:ri_rh_v2/ui/core/viewmodels/download_viewmodel.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/altas_imss_viewmodel.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// Pestaña "Altas IMSS" de Reclutamiento: solo de consulta -- quiénes se
/// van a incluir en el envío automático de esta semana al contador
/// (`Fase2Stage.pendienteEnvio`). El seguimiento de lo que pasa después
/// (enviado/archivado/contrato definitivo) ya se ve junto a cada candidato
/// en la pestaña "Pendientes" (ver `Fase2ProgressPanel`, usado desde
/// `_CandidatoRow` en `vacantes_screen.dart`).
class Fase2AltasImssSection extends StatefulWidget {
  const Fase2AltasImssSection({super.key, required this.viewmodel});

  final AltasImssViewmodel viewmodel;

  @override
  State<Fase2AltasImssSection> createState() => _Fase2AltasImssSectionState();
}

class _Fase2AltasImssSectionState extends State<Fase2AltasImssSection> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.vistaPrevia.addListener(_onVistaPrevia);
  }

  @override
  void dispose() {
    widget.viewmodel.vistaPrevia.removeListener(_onVistaPrevia);
    super.dispose();
  }

  void _onVistaPrevia() {
    if (widget.viewmodel.vistaPrevia.completed) {
      final vistaPrevia = (widget.viewmodel.vistaPrevia.result as Ok<VistaPreviaAltaImss>).value;
      widget.viewmodel.vistaPrevia.clearResult();
      context.read<DownloadViewmodel>().downloadFile.execute(
        DownloadFileParams(filename: vistaPrevia.nombreArchivo, url: vistaPrevia.url),
      );
      return;
    }
    if (widget.viewmodel.vistaPrevia.error) {
      final error = widget.viewmodel.vistaPrevia.result;
      widget.viewmodel.vistaPrevia.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo generar el documento: $error')),
      );
    }
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

        final pendientes = (widget.viewmodel.items ?? [])
            .where((item) => item.fase2Stage == Fase2Stage.pendienteEnvio)
            .toList();
        if (pendientes.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('No hay nadie pendiente de incluir en el envío de esta semana.'),
          );
        }

        return Column(
          children: [
            for (final item in pendientes) _PendienteDeEnvioRow(item: item, viewmodel: widget.viewmodel),
          ],
        );
      },
    );
  }
}

class _PendienteDeEnvioRow extends StatelessWidget {
  const _PendienteDeEnvioRow({required this.item, required this.viewmodel});

  final AltaImssItem item;
  final AltasImssViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(item.nombreCompleto, overflow: .ellipsis),
          ),
          Expanded(
            flex: 2,
            child: Text(item.puesto, style: const TextStyle(color: Color(0xFF9A7B5A)), overflow: .ellipsis),
          ),
          const Text('Se incluirá en el envío del viernes', style: TextStyle(fontSize: 11, color: Color(0xFF9A7B5A))),
          ListenableBuilder(
            listenable: viewmodel.vistaPrevia,
            builder: (context, _) => TextButton.icon(
              onPressed: viewmodel.vistaPrevia.running ? null : () => viewmodel.vistaPrevia.execute(item.id),
              icon: const Icon(Icons.download_outlined, size: 16),
              label: const Text('Ver documento'),
            ),
          ),
        ],
      ),
    );
  }
}
