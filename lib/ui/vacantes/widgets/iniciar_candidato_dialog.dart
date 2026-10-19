import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';

typedef IniciarCandidatoRow = ({String nombre, String correo, PlatformFile cartaOferta});

/// Fase E (lado de RH): registra a los candidatos que se deciden avanzar
/// para una solicitud ya aceptada -- nombre, correo y carta oferta de cada
/// uno. Muestra un campo por cada vacante que todavía quede disponible en
/// la solicitud (`vacantesDisponibles` = `cantidad` menos los candidatos ya
/// iniciados/completados), para no tener que abrir el diálogo varias veces
/// si `cantidad > 1`. No es obligatorio llenarlos todos de una vez -- las
/// filas que se dejen vacías simplemente se ignoran.
class IniciarCandidatoDialog extends StatefulWidget {
  const IniciarCandidatoDialog({super.key, required this.vacantesDisponibles});

  final int vacantesDisponibles;

  @override
  State<IniciarCandidatoDialog> createState() => _IniciarCandidatoDialogState();
}

class _FilaControllers {
  final nombre = TextEditingController();
  final correo = TextEditingController();
  PlatformFile? cartaOferta;

  bool get vacia => nombre.text.trim().isEmpty && correo.text.trim().isEmpty && cartaOferta == null;
  bool get completa => nombre.text.trim().isNotEmpty && correo.text.trim().isNotEmpty && cartaOferta != null;

  void dispose() {
    nombre.dispose();
    correo.dispose();
  }
}

class _IniciarCandidatoDialogState extends State<IniciarCandidatoDialog> {
  final _formKey = GlobalKey<FormState>();
  late final List<_FilaControllers> _filas = List.generate(widget.vacantesDisponibles, (_) => _FilaControllers());
  String? _errorGeneral;

  @override
  void dispose() {
    for (final fila in _filas) {
      fila.dispose();
    }
    super.dispose();
  }

  Future<void> _pickCartaOferta(_FilaControllers fila) async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => fila.cartaOferta = result.files.first);
    }
  }

  void _submit() {
    setState(() => _errorGeneral = null);
    if (!_formKey.currentState!.validate()) return;

    final filasLlenas = _filas.where((f) => !f.vacia).toList();
    if (filasLlenas.isEmpty) {
      setState(() => _errorGeneral = 'Llena al menos un candidato.');
      return;
    }
    if (filasLlenas.any((f) => !f.completa)) {
      setState(() => _errorGeneral = 'Completa nombre, correo y carta oferta de cada candidato que agregaste.');
      return;
    }

    context.pop([
      for (final fila in filasLlenas)
        (nombre: fila.nombre.text.trim(), correo: fila.correo.text.trim(), cartaOferta: fila.cartaOferta!),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.vacantesDisponibles > 1 ? 'Iniciar candidatos' : 'Iniciar candidato'),
      content: SizedBox(
        width: 520,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 20,
              children: [
                if (widget.vacantesDisponibles > 1)
                  Text(
                    'Quedan ${widget.vacantesDisponibles} vacante(s) por cubrir en esta solicitud. '
                    'Llena las que vayas a iniciar ahora; las demás las puedes dejar vacías.',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                if (_errorGeneral != null)
                  Text(_errorGeneral!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                for (var i = 0; i < _filas.length; i++) ...[
                  if (i > 0) const Divider(),
                  if (widget.vacantesDisponibles > 1)
                    Text('Candidato ${i + 1}', style: Theme.of(context).textTheme.titleSmall),
                  _filaFields(_filas[i]),
                ],
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        ElevatedButton(onPressed: _submit, child: Text('Enviar')),
      ],
    );
  }

  Widget _filaFields(_FilaControllers fila) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16,
      children: [
        TextFormField(
          controller: fila.nombre,
          decoration: InputDecoration(labelText: 'NOMBRE DEL CANDIDATO'),
          validator: (value) {
            if (fila.vacia) return null;
            return (value ?? '').trim().isEmpty ? 'Requerido' : null;
          },
        ),
        TextFormField(
          controller: fila.correo,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'CORREO'),
          validator: (value) {
            final v = (value ?? '').trim();
            if (v.isEmpty) return fila.vacia ? null : 'Requerido';
            if (!v.contains('@')) return 'Correo inválido';
            return null;
          },
        ),
        DocumentPickerRow(
          label: 'Carta oferta (PDF)',
          file: fila.cartaOferta,
          onPick: () => _pickCartaOferta(fila),
        ),
      ],
    );
  }
}
