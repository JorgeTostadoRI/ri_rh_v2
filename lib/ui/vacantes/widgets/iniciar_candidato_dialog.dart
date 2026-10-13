import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';

/// Fase E (lado de RH): registra al candidato que se decide avanzar para
/// una solicitud ya aceptada -- nombre, correo y carta oferta. Al enviar,
/// el backend le manda un correo con un link (válido 3 días) para que
/// llene sus datos (el formulario público que el candidato llena queda
/// para una siguiente ronda).
class IniciarCandidatoDialog extends StatefulWidget {
  const IniciarCandidatoDialog({super.key});

  @override
  State<IniciarCandidatoDialog> createState() => _IniciarCandidatoDialogState();
}

class _IniciarCandidatoDialogState extends State<IniciarCandidatoDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _correo = TextEditingController();
  PlatformFile? _cartaOferta;

  @override
  void dispose() {
    _nombre.dispose();
    _correo.dispose();
    super.dispose();
  }

  Future<void> _pickCartaOferta() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _cartaOferta = result.files.first);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final cartaOferta = _cartaOferta;
    if (cartaOferta == null) return;
    context.pop((
      nombre: _nombre.text.trim(),
      correo: _correo.text.trim(),
      cartaOferta: cartaOferta,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Iniciar candidato'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 16,
            children: [
              TextFormField(
                controller: _nombre,
                decoration: InputDecoration(labelText: 'NOMBRE DEL CANDIDATO'),
                validator: (value) => (value ?? '').trim().isEmpty ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _correo,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'CORREO'),
                validator: (value) {
                  final v = (value ?? '').trim();
                  if (v.isEmpty) return 'Requerido';
                  if (!v.contains('@')) return 'Correo inválido';
                  return null;
                },
              ),
              DocumentPickerRow(
                label: 'Carta oferta (PDF)',
                file: _cartaOferta,
                onPick: _pickCartaOferta,
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        ElevatedButton(onPressed: _cartaOferta == null ? null : _submit, child: Text('Enviar')),
      ],
    );
  }
}
