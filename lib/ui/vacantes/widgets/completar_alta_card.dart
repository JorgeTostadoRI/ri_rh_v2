import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';
import 'package:go_router/go_router.dart';

/// Tarjeta de Fase G: una vez solicitado el contrato, RH sube aquí el PDF ya
/// firmado y presiona "Completar alta" para crear el Empleado (y su
/// Usuarios vinculado) real -- rol y departamento(s) los resuelve el
/// backend solo, no se vuelven a pedir aquí. Solo aparece después de
/// "Solicitar contrato"; una vez completada, se reemplaza por un estado de
/// solo lectura.
class CompletarAltaCard extends StatefulWidget {
  const CompletarAltaCard({
    super.key,
    required this.candidato,
    required this.completarAlta,
  });

  final CandidatoDetalle candidato;
  final Command1<AltaCompletada, CompletarAltaParams> completarAlta;

  @override
  State<CompletarAltaCard> createState() => _CompletarAltaCardState();
}

class _CompletarAltaCardState extends State<CompletarAltaCard> {
  PlatformFile? _contratoFirmado;
  DateTime? _fechaAlta = DateTime.now();

  Future<void> _elegirArchivo() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _contratoFirmado = result.files.first);
    }
  }

  Future<void> _elegirFecha() async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: _fechaAlta ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (fecha != null) setState(() => _fechaAlta = fecha);
  }

  void _completar() {
    final contrato = _contratoFirmado;
    if (contrato == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falta subir el contrato firmado')),
      );
      return;
    }
    widget.completarAlta.execute((contratoFirmado: contrato, fechaAlta: _fechaAlta));
  }

  @override
  Widget build(BuildContext context) {
    final empleadoId = widget.candidato.empleado;
    if (empleadoId != null) {
      return IconCard(
        icon: Icons.verified_outlined,
        title: 'Completar alta',
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Ya se dio de alta a este candidato.',
              style: TextStyle(color: Color(0xFF008236), fontWeight: .w700),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () => context.go(Routes.expedienteOfEmpleadoId(empleadoId)),
              icon: const Icon(Icons.folder_open_outlined),
              label: const Text('Ver expediente'),
            ),
          ),
        ],
      );
    }

    return IconCard(
      icon: Icons.verified_outlined,
      title: 'Completar alta',
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          crossAxisAlignment: .center,
          children: [
            OutlinedButton.icon(
              onPressed: _elegirArchivo,
              icon: const Icon(Icons.attach_file),
              label: Text(_contratoFirmado?.name ?? 'Adjuntar contrato firmado'),
            ),
            SizedBox(
              width: 220,
              child: InkWell(
                onTap: _elegirFecha,
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Fecha de alta'),
                  child: Text(_fechaAlta?.toShortIsoString() ?? 'Elegir fecha'),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ListenableBuilder(
            listenable: widget.completarAlta,
            builder: (context, _) => ElevatedButton.icon(
              onPressed: widget.completarAlta.running ? null : _completar,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Completar alta'),
            ),
          ),
        ),
      ],
    );
  }
}
