import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/base_empleado/base_empleado.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';

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
  final DateFormat ddMMyy = DateFormat('dd/MM/yy');
  final NumberFormat currencyFormat = NumberFormat.decimalPatternDigits(locale: 'en', decimalDigits: 2);

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
  late final TextEditingController _jefe;
  late final TextEditingController _usuario;

  @override
  void initState() {
    super.initState();
    final base = widget.baseEmpleado;
    _nombre = TextEditingController(text: base.nombre);
    _nss = TextEditingController(text: base.nss);
    _curp = TextEditingController(text: base.curp);
    _rfc = TextEditingController(text: base.rfc);
    _puesto = TextEditingController(text: base.puesto.nombre);
    _salario = TextEditingController(text: currencyFormat.format(base.salario));
    _alta = TextEditingController(text: base.registradoEn != null ? ddMMyy.format(base.registradoEn!) : null);
    _nombreEmergencia = TextEditingController(text: base.numeroContacto);
    _contactoEmergencia = TextEditingController(text: base.contactoEmergencia);
    _direccion = TextEditingController(text: base.direccion);
    _jefe = TextEditingController(text: base.jefe?.nombre);
    _usuario = TextEditingController(text: base.user?.username);
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
            TextFormField(
              readOnly: true,
              controller: _usuario,
              decoration: InputDecoration(
                labelText: 'USUARIO ASOCIADO',
              ),
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
                      prefixIcon: Icon(LucideIcons.dollarSign, color: labelTextColor),
                      labelText: 'SALARIO DIARIO',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: crossSpacing,
              children: [
                Flexible(
                  child: DateFormField(
                    readOnly: widget.readOnly,
                    controller: _alta,
                    decoration: InputDecoration(
                      labelText: 'FECHA ALTA',
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    readOnly: true,
                    controller: _jefe,
                    decoration: InputDecoration(
                      labelText: 'JEFE DIRECTO',
                    ),
                  ),
                ),
              ],
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
