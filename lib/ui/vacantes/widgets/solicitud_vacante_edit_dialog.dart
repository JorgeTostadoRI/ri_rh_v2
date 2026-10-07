import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';

/// Edita puesto/rol/cantidad de una solicitud ya existente. Solo lo usa
/// Dirección (el backend también lo valida).
class SolicitudVacanteEditDialog extends StatefulWidget {
  const SolicitudVacanteEditDialog({super.key, required this.solicitud, required this.puestos});

  final SolicitudVacante solicitud;
  final List<Puesto> puestos;

  @override
  State<SolicitudVacanteEditDialog> createState() => _SolicitudVacanteEditDialogState();
}

class _SolicitudVacanteEditDialogState extends State<SolicitudVacanteEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late Puesto? _puesto;
  late String? _rol;
  late final _cantidad = TextEditingController(text: widget.solicitud.cantidad.toString());

  @override
  void initState() {
    super.initState();
    _puesto = widget.puestos.where((p) => p.id == widget.solicitud.puesto).firstOrNull;
    _rol = widget.solicitud.rol;
  }

  @override
  void dispose() {
    _cantidad.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_puesto == null || _rol == null) return;
    context.pop((
      id: widget.solicitud.id!,
      puestoId: _puesto!.id!,
      rol: _rol!,
      cantidad: int.parse(_cantidad.text.trim()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar solicitud'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: .min,
          spacing: 16,
          children: [
            DropdownButtonFormField<Puesto>(
              initialValue: _puesto,
              isExpanded: true,
              decoration: InputDecoration(labelText: 'PUESTO'),
              items: widget.puestos
                  .map((p) => DropdownMenuItem(value: p, child: Text(p.nombre, overflow: TextOverflow.ellipsis)))
                  .toList(),
              onChanged: (value) => setState(() => _puesto = value),
              validator: (value) => value == null ? 'Requerido' : null,
            ),
            DropdownButtonFormField<String>(
              initialValue: _rol,
              isExpanded: true,
              decoration: InputDecoration(labelText: 'ROL'),
              items: rolOptions.map((r) => DropdownMenuItem(value: r.$1, child: Text(r.$2))).toList(),
              onChanged: (value) => setState(() => _rol = value),
              validator: (value) => value == null ? 'Requerido' : null,
            ),
            TextFormField(
              controller: _cantidad,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'CANTIDAD'),
              validator: (value) {
                final n = int.tryParse((value ?? '').trim());
                if (n == null || n < 1) return 'Inválido';
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        ElevatedButton(onPressed: _submit, child: Text('Guardar')),
      ],
    );
  }
}
