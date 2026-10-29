import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';

typedef IniciarContratacionPracticanteRow = ({String correo, PlatformFile cartaOferta});

/// RH inicia la contratación como empleado de un practicante que Dirección
/// ya aprobó -- en lugar de "Iniciar candidato" en su solicitud. Puesto y
/// rol ya vienen de la solicitud (los eligió el jefe); aquí solo el correo
/// (prellenado con el de su usuario) y la carta oferta. Le llega el mismo
/// correo con el link al portal, ya prellenado con su expediente.
class IniciarContratacionPracticanteDialog extends StatefulWidget {
  const IniciarContratacionPracticanteDialog({super.key, required this.nombre, this.correoInicial = ''});

  final String nombre;

  /// El correo que ya tiene su usuario; vacío si no tiene.
  final String correoInicial;

  @override
  State<IniciarContratacionPracticanteDialog> createState() => _IniciarContratacionPracticanteDialogState();
}

class _IniciarContratacionPracticanteDialogState extends State<IniciarContratacionPracticanteDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _correo = TextEditingController(text: widget.correoInicial);
  PlatformFile? _cartaOferta;
  String? _errorCarta;

  @override
  void dispose() {
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
      setState(() {
        _cartaOferta = result.files.first;
        _errorCarta = null;
      });
    }
  }

  void _submit() {
    final valido = _formKey.currentState!.validate();
    setState(() => _errorCarta = _cartaOferta == null ? 'Sube la carta oferta.' : null);
    if (!valido || _cartaOferta == null) return;
    context.pop<IniciarContratacionPracticanteRow>((correo: _correo.text.trim(), cartaOferta: _cartaOferta!));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Iniciar contratación'),
      content: SizedBox(
        width: 520,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 16,
              children: [
                Text(
                  'Se le mandará a ${widget.nombre} el link para completar su contratación como empleado. '
                  'Ya irá prellenado con lo que tenemos de su expediente; solo completará lo que falte.',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                TextFormField(
                  controller: _correo,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'CORREO'),
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
                if (_errorCarta != null)
                  Text(_errorCarta!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
        ElevatedButton(onPressed: _submit, child: const Text('Enviar')),
      ],
    );
  }
}
