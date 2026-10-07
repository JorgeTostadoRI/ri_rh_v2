import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/vacantes/solicitud_vacante.dart';
import 'package:ri_rh_v2/ui/expediente/widgets/horario_card.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';

/// Edita puesto/rol/cantidad/área/turno/justificación de una solicitud ya
/// existente. Solo lo usa Dirección (el backend también lo valida).
class SolicitudVacanteEditDialog extends StatefulWidget {
  const SolicitudVacanteEditDialog({
    super.key,
    required this.solicitud,
    required this.puestos,
    required this.horarios,
  });

  final SolicitudVacante solicitud;
  final List<Puesto> puestos;
  final List<Horario> horarios;

  @override
  State<SolicitudVacanteEditDialog> createState() => _SolicitudVacanteEditDialogState();
}

class _SolicitudVacanteEditDialogState extends State<SolicitudVacanteEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late Puesto? _puesto;
  late String? _rol;
  late Horario? _turno;
  late final _cantidad = TextEditingController(text: widget.solicitud.cantidad.toString());
  late final _area = TextEditingController(text: widget.solicitud.area);
  late final _justificacion = TextEditingController(text: widget.solicitud.justificacion);

  @override
  void initState() {
    super.initState();
    _puesto = widget.puestos.where((p) => p.id == widget.solicitud.puesto).firstOrNull;
    _rol = widget.solicitud.rol;
    _turno = widget.horarios.where((h) => h.id == widget.solicitud.turno).firstOrNull;
  }

  @override
  void dispose() {
    _cantidad.dispose();
    _area.dispose();
    _justificacion.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_puesto == null || _rol == null || _turno == null) return;
    context.pop((
      id: widget.solicitud.id!,
      puestoId: _puesto!.id!,
      rol: _rol!,
      cantidad: int.parse(_cantidad.text.trim()),
      area: _area.text.trim(),
      turnoId: _turno!.id,
      justificacion: _justificacion.text.trim(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar solicitud'),
      content: SizedBox(
        width: 500,
        child: Form(
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
              TextFormField(
                controller: _area,
                decoration: InputDecoration(labelText: 'AREA'),
                validator: (value) => (value ?? '').trim().isEmpty ? 'Requerido' : null,
              ),
              DropdownButtonFormField<Horario>(
                initialValue: _turno,
                isExpanded: true,
                decoration: InputDecoration(labelText: 'TURNO'),
                items: widget.horarios
                    .map((h) => DropdownMenuItem(
                          value: h,
                          child: Text(horarioDisplayName(h), overflow: TextOverflow.ellipsis),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _turno = value),
                validator: (value) => value == null ? 'Requerido' : null,
              ),
              TextFormField(
                controller: _justificacion,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'JUSTIFICACION DE LA SOLICITUD'),
                validator: (value) => (value ?? '').trim().isEmpty ? 'Requerido' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        ElevatedButton(onPressed: _submit, child: Text('Guardar')),
      ],
    );
  }
}
