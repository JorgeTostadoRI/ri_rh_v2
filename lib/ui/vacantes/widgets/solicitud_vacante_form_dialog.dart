import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/horario_card.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';
import 'package:ri_rh_v2/ui/vacantes/viewmodels/vacantes_viewmodel.dart';

class _VacanteFormRow {
  Puesto? puesto;
  String? rol;
  Horario? turno;
  final cantidad = TextEditingController(text: '1');
  final area = TextEditingController();
  final justificacion = TextEditingController();

  void dispose() {
    cantidad.dispose();
    area.dispose();
    justificacion.dispose();
  }
}

class SolicitudVacanteFormDialog extends StatefulWidget {
  const SolicitudVacanteFormDialog({super.key, required this.puestos, required this.horarios});

  final List<Puesto> puestos;
  final List<Horario> horarios;

  @override
  State<SolicitudVacanteFormDialog> createState() => _SolicitudVacanteFormDialogState();
}

class _SolicitudVacanteFormDialogState extends State<SolicitudVacanteFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _filas = [_VacanteFormRow()];

  @override
  void dispose() {
    for (final fila in _filas) {
      fila.dispose();
    }
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_filas.any((f) => f.puesto == null || f.rol == null || f.turno == null)) return;

    final params = <VacanteRowParams>[
      for (final fila in _filas)
        (
          puestoId: fila.puesto!.id!,
          rol: fila.rol!,
          cantidad: int.parse(fila.cantidad.text.trim()),
          area: fila.area.text.trim(),
          turnoId: fila.turno!.id,
          justificacion: fila.justificacion.text.trim(),
        ),
    ];
    context.pop(params);
  }

  Widget _filaForm(_VacanteFormRow fila, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: .start,
            spacing: 12,
            children: [
              Expanded(
                flex: 3,
                child: DropdownButtonFormField<Puesto>(
                  initialValue: fila.puesto,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'PUESTO'),
                  items: widget.puestos
                      .map((p) => DropdownMenuItem(value: p, child: Text(p.nombre, overflow: TextOverflow.ellipsis)))
                      .toList(),
                  onChanged: (value) => setState(() {
                    fila.puesto = value;
                    if (value?.rol != null && rolOptions.any((r) => r.$1 == value!.rol)) {
                      fila.rol = value!.rol;
                    }
                  }),
                  validator: (value) => value == null ? 'Requerido' : null,
                ),
              ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  key: ValueKey(fila.rol),
                  initialValue: fila.rol,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'ROL'),
                  items: rolOptions.map((r) => DropdownMenuItem(value: r.$1, child: Text(r.$2))).toList(),
                  onChanged: (value) => setState(() => fila.rol = value),
                  validator: (value) => value == null ? 'Requerido' : null,
                ),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: fila.cantidad,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'CANTIDAD'),
                  validator: (value) {
                    final n = int.tryParse((value ?? '').trim());
                    if (n == null || n < 1) return 'Inválido';
                    return null;
                  },
                ),
              ),
              if (_filas.length > 1)
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () => setState(() {
                    fila.dispose();
                    _filas.removeAt(index);
                  }),
                ),
            ],
          ),
          Row(
            crossAxisAlignment: .start,
            spacing: 12,
            children: [
              Expanded(
                child: TextFormField(
                  controller: fila.area,
                  decoration: InputDecoration(labelText: 'AREA'),
                  validator: (value) => (value ?? '').trim().isEmpty ? 'Requerido' : null,
                ),
              ),
              Expanded(
                child: DropdownButtonFormField<Horario>(
                  initialValue: fila.turno,
                  isExpanded: true,
                  decoration: InputDecoration(labelText: 'TURNO'),
                  items: widget.horarios
                      .map((h) => DropdownMenuItem(
                            value: h,
                            child: Text(horarioDisplayName(h), overflow: TextOverflow.ellipsis),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => fila.turno = value),
                  validator: (value) => value == null ? 'Requerido' : null,
                ),
              ),
            ],
          ),
          TextFormField(
            controller: fila.justificacion,
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(labelText: 'JUSTIFICACION DE LA SOLICITUD'),
            validator: (value) => (value ?? '').trim().isEmpty ? 'Requerido' : null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Solicitar vacante(s)'),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                for (var i = 0; i < _filas.length; i++) _filaForm(_filas[i], i),
                TextButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Agregar otra vacante'),
                  onPressed: () => setState(() => _filas.add(_VacanteFormRow())),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        ElevatedButton(onPressed: _submit, child: Text('Solicitar')),
      ],
    );
  }
}
