import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

class ExpedienteForm extends StatefulWidget {
  const ExpedienteForm({
    super.key,
    required this.baseEmpleado,
    required this.readOnly,
  });

  final BaseEmpleado baseEmpleado;
  final bool readOnly;

  @override
  State<ExpedienteForm> createState() => _ExpedienteFormState();
}

class _ExpedienteFormState extends State<ExpedienteForm> {
  late final TextEditingController _nombre;
  late final TextEditingController _nss;
  late final TextEditingController _curp;
  late final TextEditingController _rfc;
  late final TextEditingController _puesto;
  late final TextEditingController _salario;
  late final TextEditingController _alta;
  late final TextEditingController _nombreEmergencia;
  late final TextEditingController _contactoEmergencia;
  late final TextEditingController _direccion;

  @override
  void initState() {
    super.initState();
    _nombre = TextEditingController(text: widget.baseEmpleado.nombre);
    _nss = TextEditingController(text: widget.baseEmpleado.nss);
    _curp = TextEditingController(text: widget.baseEmpleado.curp);
    _rfc = TextEditingController(text: widget.baseEmpleado.rfc);
    _puesto = TextEditingController(text: widget.baseEmpleado.puesto.nombre);
    _salario = TextEditingController(text: widget.baseEmpleado.salario.toString());
    _alta = TextEditingController(text: widget.baseEmpleado.registradoEn?.toShortIsoString());
    _nombreEmergencia = TextEditingController(text: widget.baseEmpleado.numeroContacto);
    _contactoEmergencia = TextEditingController(text: widget.baseEmpleado.contactoEmergencia);
    _direccion = TextEditingController(text: widget.baseEmpleado.direccion);
  }

  @override
  void dispose() {
    _nombre.dispose();
    _nss.dispose();
    _curp.dispose();
    _rfc.dispose();
    _puesto.dispose();
    _salario.dispose();
    _alta.dispose();
    _nombreEmergencia.dispose();
    _contactoEmergencia.dispose();
    _direccion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double crossSpacing = 24;

    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        IconCard(
          icon: LucideIcons.user,
          title: 'Datos Generales',
          children: [
            Row(
              spacing: crossSpacing,
              children: [
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _nombre,
                    decoration: InputDecoration(
                      labelText: 'NOMBRE COMPLETO',
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    readOnly: widget.readOnly,
                    controller: _nss,
                    decoration: InputDecoration(
                      labelText: 'NSS',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: crossSpacing,
              children: [
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _curp,
                    decoration: InputDecoration(
                      labelText: 'CURP',
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _rfc,
                    decoration: InputDecoration(
                      labelText: 'RFC',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        IconCard(
          icon: LucideIcons.briefcase,
          title: 'Datos Laborales',
          children: [
            Row(
              spacing: crossSpacing,
              children: [
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _puesto,
                    decoration: InputDecoration(
                      labelText: 'PUESTO',
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _salario,
                    decoration: InputDecoration(
                      labelText: 'SALARIO DIARIO',
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              readOnly: widget.readOnly,
              controller: _alta,
              decoration: InputDecoration(
                labelText: 'FECHA ALTA',
              ),
            ),
          ],
        ),
        IconCard(
          icon: LucideIcons.phone,
          title: 'Contacto y Dirección',
          children: [
            Row(
              spacing: crossSpacing,
              children: [
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _nombreEmergencia,
                    decoration: InputDecoration(
                      labelText: 'NOMBRE EMERGENCIA',
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    readOnly: widget.readOnly,
                    controller: _contactoEmergencia,
                    decoration: InputDecoration(
                      labelText: 'CONTACTO EMERGENCIA',
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: TextFormField(
                readOnly: widget.readOnly,
                controller: _direccion,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'DIRECCIÓN',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
