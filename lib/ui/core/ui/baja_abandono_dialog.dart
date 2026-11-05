import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ri_rh_v2/domain/models/baja_abandono/revision_abandono.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

/// "Forzar baja por abandono" -- lo usan el menú de empleados (en proceso de
/// finiquito) y el de practicantes (en proceso de baja). Primero muestra la
/// revisión del checador de sus últimos 4 días laborables; solo si en
/// ninguno checó deja capturar la fecha de baja, la nota de los intentos de
/// contacto y la evidencia. No pide documentos de separación.
class BajaAbandonoDialog extends StatefulWidget {
  const BajaAbandonoDialog({
    super.key,
    required this.id,
    required this.nombre,
    required this.revisionAbandono,
    required this.bajaPorAbandono,
  });

  final int id;
  final String nombre;
  final Command1<RevisionAbandono, int> revisionAbandono;
  final Command1<void, BajaAbandonoParams> bajaPorAbandono;

  @override
  State<BajaAbandonoDialog> createState() => _BajaAbandonoDialogState();
}

class _BajaAbandonoDialogState extends State<BajaAbandonoDialog> {
  static final _diaLargo = DateFormat("EEEE d 'de' MMMM", 'es_ES');
  static final _ddMMyy = DateFormat('dd/MM/yy');

  final _formKey = GlobalKey<FormState>();
  final _justificacion = TextEditingController();
  final _nota = TextEditingController();
  final List<PlatformFile> _evidencias = [];
  DateTime? _fechaBaja;

  @override
  void initState() {
    super.initState();
    widget.bajaPorAbandono.addListener(_onResult);
    widget.revisionAbandono.addListener(_onRevision);
    widget.revisionAbandono.execute(widget.id);
    // Para que el botón "Forzar baja" se habilite en cuanto ambos textos
    // tengan algo.
    _justificacion.addListener(_refrescar);
    _nota.addListener(_refrescar);
  }

  void _refrescar() => setState(() {});

  bool get _completo =>
      _fechaBaja != null &&
      _justificacion.text.trim().isNotEmpty &&
      _nota.text.trim().isNotEmpty &&
      _evidencias.isNotEmpty;

  @override
  void dispose() {
    widget.bajaPorAbandono.removeListener(_onResult);
    widget.revisionAbandono.removeListener(_onRevision);
    widget.revisionAbandono.clearResult();
    _justificacion.dispose();
    _nota.dispose();
    super.dispose();
  }

  // La fecha de baja se prellena con su última checada -- DateFormField solo
  // avisa cuando el texto cambia, así que el valor inicial se toma aquí.
  void _onRevision() {
    final result = widget.revisionAbandono.result;
    if (result is Ok<RevisionAbandono> && _fechaBaja == null && mounted) {
      setState(() => _fechaBaja = result.value.ultimaChecada);
    }
  }

  void _onResult() {
    if (widget.bajaPorAbandono.completed) {
      widget.bajaPorAbandono.clearResult();
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Baja por abandono registrada. La constancia quedó en su expediente.')),
        );
      }
      return;
    }

    if (widget.bajaPorAbandono.error) {
      final error = (widget.bajaPorAbandono.result as Error).error;
      widget.bajaPorAbandono.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo forzar la baja', error: error),
        );
      }
    }
  }

  Future<void> _agregarEvidencias() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowMultiple: true,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _evidencias.addAll(result.files));
    }
  }

  void _confirmar() {
    if (!_formKey.currentState!.validate() || !_completo) return;
    widget.bajaPorAbandono.execute((
      id: widget.id,
      fechaBaja: _fechaBaja!,
      justificacion: _justificacion.text.trim(),
      nota: _nota.text.trim(),
      evidencias: List.of(_evidencias),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([widget.revisionAbandono, widget.bajaPorAbandono]),
      builder: (context, _) {
        final running = widget.bajaPorAbandono.running;
        final revision = widget.revisionAbandono.result is Ok<RevisionAbandono>
            ? (widget.revisionAbandono.result as Ok<RevisionAbandono>).value
            : null;
        final procede = revision?.procede ?? false;

        return AlertDialog(
          title: Text('Forzar baja por abandono'),
          content: SizedBox(
            width: 480,
            child: SingleChildScrollView(
              child: _contenido(revision),
            ),
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || !procede || !_completo ? null : _confirmar,
              style: ElevatedButton.styleFrom(backgroundColor: errorColor),
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text('Forzar baja'),
            ),
          ],
        );
      },
    );
  }

  Widget _contenido(RevisionAbandono? revision) {
    if (widget.revisionAbandono.running || (revision == null && !widget.revisionAbandono.error)) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (revision == null) {
      return Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          Text('No se pudo revisar la asistencia de ${widget.nombre}.'),
          TextButton.icon(
            onPressed: () => widget.revisionAbandono.execute(widget.id),
            icon: const Icon(Icons.refresh),
            label: Text('Reintentar'),
          ),
        ],
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          Text('Checador de ${widget.nombre} en sus últimos 4 días laborables:'),
          for (final dia in revision.dias)
            Row(
              spacing: 8,
              children: [
                Icon(
                  dia.checadas == 0 ? Icons.close : Icons.check,
                  size: 18,
                  color: dia.checadas == 0 ? errorColor : Colors.green,
                ),
                Expanded(child: Text(_diaLargo.format(dia.fecha))),
                Text(dia.checadas == 0 ? 'Sin checadas' : '${dia.checadas} checada(s)'),
              ],
            ),
          Text(
            'Última checada: ${revision.ultimaChecada != null ? _diaLargo.format(revision.ultimaChecada!) : 'ninguna'}',
            style: const TextStyle(fontWeight: .w700),
          ),
          if (!revision.procede)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFDEBEB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(revision.motivo, style: TextStyle(color: errorColor)),
            )
          else ...[
            const Divider(),
            Text(
              'No se pedirán documentos de separación. Se generará una constancia de '
              'inasistencias en su expediente junto con la evidencia.',
            ),
            DateFormField(
              initialValue: revision.ultimaChecada != null ? _ddMMyy.format(revision.ultimaChecada!) : null,
              decoration: InputDecoration(labelText: 'FECHA DE BAJA'),
              required: true,
              onDateSaved: (value) => setState(() => _fechaBaja = value),
            ),
            TextFormField(
              controller: _justificacion,
              minLines: 2,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Justificación',
                hintText: 'Por qué se fuerza la baja (ej. dejó de presentarse sin avisar)',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value ?? '').trim().isEmpty ? 'Escribe la justificación' : null,
            ),
            TextFormField(
              controller: _nota,
              minLines: 3,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Intentos de contacto',
                hintText: 'Fechas, medio (llamada, WhatsApp, correo) y si hubo respuesta',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value ?? '').trim().isEmpty ? 'Describe los intentos de contacto' : null,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _evidencias.isEmpty
                        ? 'Evidencia de contacto (requerida)'
                        : 'Evidencia de contacto (${_evidencias.length})',
                    style: TextStyle(fontWeight: _evidencias.isEmpty ? .normal : .w700),
                  ),
                ),
                TextButton(
                  onPressed: widget.bajaPorAbandono.running ? null : _agregarEvidencias,
                  child: Text('Adjuntar'),
                ),
              ],
            ),
            for (final evidencia in _evidencias)
              Row(
                children: [
                  const Icon(Icons.attach_file, size: 16),
                  Expanded(child: Text(evidencia.name, overflow: .ellipsis)),
                  IconButton(
                    onPressed: widget.bajaPorAbandono.running ? null : () => setState(() => _evidencias.remove(evidencia)),
                    icon: Icon(Icons.close, size: 16, color: errorColor),
                    tooltip: 'Quitar',
                  ),
                ],
              ),
          ],
        ],
      ),
    );
  }
}
