import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/credenciales_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/empleados/viewmodels/nuevo_empleado_viewmodel.dart';
import 'package:ri_rh_v2/ui/puestos/widgets/puesto_form_dialog.dart';
import 'package:ri_rh_v2/utils/result.dart';

const _documentSections = [
  (
    'Identificación y datos personales',
    [
      ('identificacionOficial', 'Identificación oficial'),
      ('actaNacimiento', 'Acta de nacimiento'),
      ('pdfCurp', 'CURP (PDF)'),
      ('constanciaEstudio', 'Constancia de estudios'),
    ],
  ),
  (
    'Seguro social y fiscal',
    [
      ('comprobanteNss', 'Comprobante NSS'),
      ('altaImss', 'Alta IMSS'),
      ('constanciaSituacionFiscal', 'Constancia de situación fiscal'),
      ('comprobanteDomicilio', 'Comprobante de domicilio'),
      ('estadoCuenta', 'Estado de cuenta'),
      ('avisoRetencionInfonavit', 'Aviso de retención Infonavit'),
    ],
  ),
  (
    'Documentos laborales',
    [
      ('contratoLaboral', 'Contrato laboral'),
      ('curriculumVitae', 'Curriculum vitae'),
      ('cartaOferta', 'Carta oferta'), 
      ('cartaRecomendacion1', 'Carta de recomendación 1'),
      ('examenMedico', 'Examen médico'),
      ('cartaRecomendacion2', 'Carta de recomendación 2'),
      ('cartaNoAntecedentesPenales', 'Carta de no antecedentes penales'),
      ('cartaRecomendacion3', 'Carta de recomendación 3'),
    ],
  ),
];

final _documentFields = [
  for (final (_, fields) in _documentSections) ...fields,
];

class NuevoEmpleadoScreen extends StatefulWidget {
  const NuevoEmpleadoScreen({
    super.key,
    required this.viewmodel,
  });

  final NuevoEmpleadoViewmodel viewmodel;

  @override
  State<NuevoEmpleadoScreen> createState() => _NuevoEmpleadoScreenState();
}

class _NuevoEmpleadoScreenState extends State<NuevoEmpleadoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreCompleto = TextEditingController();
  final _clabeInterbancaria = TextEditingController();
  final _telefono = TextEditingController();
  final _numeroContacto = TextEditingController();
  final _contactoEmergencia = TextEditingController();
  final _rfc = TextEditingController();
  final _curp = TextEditingController();
  final _numeroSeguroSocial = TextEditingController();
  final _direccionCompleta = TextEditingController();
  final _correo = TextEditingController();
  final _salarioDiario = TextEditingController();
  final _montoRetencionInfonavit = TextEditingController(text: '0.00');

  DateTime? _fechaNacimiento;
  DateTime? _fechaAlta = DateTime.now();
  Puesto? _puesto;
  Escolaridad? _escolaridad;
  final Set<int> _departamentosSeleccionados = {};
  String? _rol;

  final Map<String, PlatformFile?> _files = {
    for (final (key, _) in _documentFields) key: null,
  };

  @override
  void initState() {
    super.initState();
    widget.viewmodel.create.addListener(_onCreateResult);
    widget.viewmodel.deletePuesto.addListener(_onDeletePuestoResult);
  }

  @override
  void dispose() {
    widget.viewmodel.create.removeListener(_onCreateResult);
    widget.viewmodel.deletePuesto.removeListener(_onDeletePuestoResult);
    _nombreCompleto.dispose();
    _clabeInterbancaria.dispose();
    _telefono.dispose();
    _numeroContacto.dispose();
    _contactoEmergencia.dispose();
    _rfc.dispose();
    _curp.dispose();
    _numeroSeguroSocial.dispose();
    _direccionCompleta.dispose();
    _correo.dispose();
    _salarioDiario.dispose();
    _montoRetencionInfonavit.dispose();
    super.dispose();
  }

  void _onCreateResult() {
    if (widget.viewmodel.create.completed) {
      final empleado = (widget.viewmodel.create.result as Ok<Empleado>).value;
      widget.viewmodel.create.clearResult();
      _showCredencialesAndNavigate(empleado);
      return;
    }

    if (widget.viewmodel.create.error) {
      final error = (widget.viewmodel.create.result as Error).error;
      widget.viewmodel.create.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo dar de alta al empleado', error: error),
      );
    }
  }

  void _onDeletePuestoResult() {
    if (widget.viewmodel.deletePuesto.completed) {
      final deletedId = (widget.viewmodel.deletePuesto.result as Ok<int>).value;
      widget.viewmodel.deletePuesto.clearResult();
      if (_puesto?.id == deletedId) {
        setState(() => _puesto = null);
      }
      return;
    }

    if (widget.viewmodel.deletePuesto.error) {
      final error = (widget.viewmodel.deletePuesto.result as Error).error;
      widget.viewmodel.deletePuesto.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo eliminar el puesto', error: error),
      );
    }
  }

  Future<void> _showCredencialesAndNavigate(Empleado empleado) async {
    final credenciales = empleado.credencialesGeneradas;
    if (credenciales != null) {
      await CredencialesDialog.show(context, nombre: empleado.base.nombre, credenciales: credenciales);
    }

    if (!mounted) return;
    context.go(Routes.expedienteOfEmpleado(empleado));
  }

  Future<void> _pickFile(String key) async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      withData: true,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() => _files[key] = result.files.first);
    }
  }

  Future<void> _openCreatePuestoDialog() async {
    final puesto = await showDialog<Puesto>(
      context: context,
      builder: (context) => PuestoFormDialog(
        createPuesto: widget.viewmodel.createPuesto,
        editPuesto: widget.viewmodel.editPuesto,
        departamentos: widget.viewmodel.departamentos,
      ),
    );
    if (puesto != null) {
      setState(() {
        _puesto = puesto;
        _applyPuestoDefaults(puesto);
      });
    }
  }

  Future<void> _openEditPuestoDialog() async {
    final actual = _puesto;
    if (actual == null) return;
    final puesto = await showDialog<Puesto>(
      context: context,
      builder: (context) => PuestoFormDialog(
        createPuesto: widget.viewmodel.createPuesto,
        editPuesto: widget.viewmodel.editPuesto,
        departamentos: widget.viewmodel.departamentos,
        initialPuesto: actual,
      ),
    );
    if (puesto != null) {
      setState(() => _puesto = puesto);
    }
  }

  Future<void> _confirmDeletePuesto() async {
    final actual = _puesto;
    if (actual == null) return;
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Eliminar puesto'),
        content: Text('¿Eliminar "${actual.nombre}"? Esta acción no se puede deshacer.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Cancelar')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: Text('Eliminar')),
        ],
      ),
    );
    if (confirmado != true) return;
    if (!mounted) return;
    widget.viewmodel.deletePuesto.execute(actual.id!);
  }

  /// Prellena ROL/DEPARTAMENTO (USUARIO) con lo definido en el Puesto, sin
  /// restringir las opciones disponibles de esos dropdowns: el usuario de RH
  /// puede seguir cambiándolos libremente después.
  void _applyPuestoDefaults(Puesto puesto) {
    if (puesto.rol != null && rolOptions.any((r) => r.$1 == puesto.rol)) {
      _rol = puesto.rol;
    }
    if (puesto.departamentos.isNotEmpty) {
      _departamentosSeleccionados.addAll(puesto.departamentos);
    }
  }

  double? _parseDecimal(String value) => double.tryParse(value.trim());

  String _formatDate(DateTime date) {
    final dd = date.day.toString().padLeft(2, '0');
    final mm = date.month.toString().padLeft(2, '0');
    return '$dd/$mm/${date.year}';
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_puesto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecciona un puesto')),
      );
      return;
    }
    if (_fechaNacimiento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ingresa la fecha de nacimiento')),
      );
      return;
    }
    if (_departamentosSeleccionados.isEmpty || _rol == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecciona al menos un departamento y el rol del usuario')),
      );
      return;
    }

    final params = EmpleadoCreateParams(
      nombreCompleto: _nombreCompleto.text.trim(),
      fechaNacimiento: _fechaNacimiento!,
      escolaridad: _escolaridad!,
      salarioDiario: _parseDecimal(_salarioDiario.text)!,
      clabeInterbancaria: _clabeInterbancaria.text.trim(),
      numeroContacto: _numeroContacto.text.trim(),
      contactoEmergencia: _contactoEmergencia.text.trim(),
      rfc: _rfc.text.trim(),
      curp: _curp.text.trim(),
      numeroSeguroSocial: _numeroSeguroSocial.text.trim(),
      direccionCompleta: _direccionCompleta.text.trim(),
      montoRetencionInfonavit: _parseDecimal(_montoRetencionInfonavit.text) ?? 0,
      puestoId: _puesto!.id!,
      telefono: _telefono.text.trim(),
      correo: _correo.text.trim().isEmpty ? null : _correo.text.trim(),
      departamentoIds: _departamentosSeleccionados.toList(),
      rol: _rol,
      fechaAlta: _fechaAlta,
      identificacionOficial: _files['identificacionOficial'],
      actaNacimiento: _files['actaNacimiento'],
      constanciaEstudio: _files['constanciaEstudio'],
      estadoCuenta: _files['estadoCuenta'],
      constanciaSituacionFiscal: _files['constanciaSituacionFiscal'],
      pdfCurp: _files['pdfCurp'],
      comprobanteNss: _files['comprobanteNss'],
      altaImss: _files['altaImss'],
      comprobanteDomicilio: _files['comprobanteDomicilio'],
      avisoRetencionInfonavit: _files['avisoRetencionInfonavit'],
      cartaRecomendacion1: _files['cartaRecomendacion1'],
      cartaRecomendacion2: _files['cartaRecomendacion2'],
      cartaRecomendacion3: _files['cartaRecomendacion3'],
      cartaNoAntecedentesPenales: _files['cartaNoAntecedentesPenales'],
      contratoLaboral: _files['contratoLaboral'],
      curriculumVitae: _files['curriculumVitae'],
      cartaOferta: _files['cartaOferta'],
      examenMedico: _files['examenMedico'],
    );

    widget.viewmodel.create.execute(params);
  }

  String? _requiredValidator(String? value) => (value == null || value.trim().isEmpty) ? 'Campo requerido' : null;

  String? _decimalValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Campo requerido';
    if (_parseDecimal(value) == null) return 'Ingresa un número válido';
    return null;
  }

  Widget _documentSection(String title, List<(String, String)> fields) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          Text(
            title.toUpperCase(),
            style: TextTheme.of(context).labelMedium?.copyWith(fontWeight: .w700, color: primaryColor),
          ),
          for (var i = 0; i < fields.length; i += 2)
            Row(
              spacing: 24,
              crossAxisAlignment: .start,
              children: [
                Expanded(child: _documentPicker(fields[i])),
                Expanded(child: i + 1 < fields.length ? _documentPicker(fields[i + 1]) : const SizedBox.shrink()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _documentPicker((String, String) field) {
    final (key, label) = field;
    return DocumentPickerRow(
      label: label,
      file: _files[key],
      onPick: () => _pickFile(key),
    );
  }

  Widget _text(
    String label,
    TextEditingController controller, {
    bool required = true,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(labelText: label.toUpperCase()),
      validator: validator ?? (required ? _requiredValidator : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 32,
            crossAxisAlignment: .start,
            children: [
              PageHeader(
                title: 'Nuevo Empleado',
                subtitle: 'Da de alta a un nuevo empleado. El sistema creará y vinculará su usuario automáticamente.',
                showBackButton: true,
              ),
              IconCard(
                icon: Icons.person,
                title: 'Datos Generales',
                children: [
                  Row(
                    spacing: 24,
                    children: [
                      Expanded(child: _text('Nombre completo', _nombreCompleto)),
                      Expanded(
                        child: DateFormField(
                          decoration: InputDecoration(labelText: 'FECHA DE NACIMIENTO'),
                          required: true,
                          fourDigitYear: true,
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                          onDateSaved: (value) => _fechaNacimiento = value,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      Expanded(child: _text('CURP', _curp)),
                      Expanded(child: _text('RFC', _rfc)),
                    ],
                  ),
                  _text('Número de seguro social', _numeroSeguroSocial),
                ],
              ),
              IconCard(
                icon: Icons.work,
                title: 'Datos Laborales',
                children: [
                  ListenableBuilder(
                    listenable: widget.viewmodel.loadCatalogos,
                    builder: (context, _) {
                      return Row(
                        spacing: 12,
                        crossAxisAlignment: .end,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<Puesto>(
                              initialValue: _puesto,
                              decoration: InputDecoration(labelText: 'PUESTO'),
                              items: widget.viewmodel.puestos
                                  .map((p) => DropdownMenuItem(value: p, child: Text(p.nombre)))
                                  .toList(),
                              onChanged: (value) => setState(() {
                                _puesto = value;
                                if (value != null) _applyPuestoDefaults(value);
                              }),
                              validator: (value) => value == null ? 'Selecciona un puesto' : null,
                            ),
                          ),
                          IconButton(
                            tooltip: 'Crear puesto nuevo',
                            onPressed: _openCreatePuestoDialog,
                            icon: Icon(Icons.add_circle_outline),
                          ),
                          IconButton(
                            tooltip: 'Editar puesto',
                            onPressed: _puesto == null ? null : _openEditPuestoDialog,
                            icon: Icon(Icons.edit_outlined),
                          ),
                          ListenableBuilder(
                            listenable: widget.viewmodel.deletePuesto,
                            builder: (context, _) {
                              final running = widget.viewmodel.deletePuesto.running;
                              return IconButton(
                                tooltip: 'Eliminar puesto',
                                onPressed: _puesto == null || running ? null : _confirmDeletePuesto,
                                icon: running
                                    ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                                    : Icon(Icons.delete_outline),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  DateFormField(
                    decoration: InputDecoration(labelText: 'FECHA DE ALTA'),
                    required: true,
                    fourDigitYear: true,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    initialValue: _formatDate(_fechaAlta!),
                    onDateSaved: (value) => _fechaAlta = value,
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<Escolaridad>(
                          initialValue: _escolaridad,
                          decoration: InputDecoration(labelText: 'ESCOLARIDAD'),
                          items: Escolaridad.values
                              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                              .toList(),
                          onChanged: (value) => setState(() => _escolaridad = value),
                          validator: (value) => value == null ? 'Selecciona una escolaridad' : null,
                        ),
                      ),
                      Expanded(
                        child: _text(
                          'Salario diario',
                          _salarioDiario,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          validator: _decimalValidator,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      Expanded(child: _text('CLABE interbancaria', _clabeInterbancaria)),
                      Expanded(
                        child: _text(
                          'Monto retención infonavit',
                          _montoRetencionInfonavit,
                          required: false,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          validator: _decimalValidator,
                        ),
                      ),
                    ],
                  ),
                  ListenableBuilder(
                    listenable: widget.viewmodel.loadCatalogos,
                    builder: (context, _) {
                      return Column(
                        crossAxisAlignment: .start,
                        spacing: 12,
                        children: [
                          DropdownButtonFormField<String>(
                            key: ValueKey(_rol),
                            initialValue: _rol,
                            decoration: InputDecoration(labelText: 'ROL (USUARIO)'),
                            items: rolOptions
                                .map((r) => DropdownMenuItem(value: r.$1, child: Text(r.$2)))
                                .toList(),
                            onChanged: (value) => setState(() => _rol = value),
                            validator: (value) => value == null ? 'Selecciona un rol' : null,
                          ),
                          Text('DEPARTAMENTOS (USUARIO)', style: TextTheme.of(context).labelMedium),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: widget.viewmodel.departamentos.map((d) {
                              final selected = _departamentosSeleccionados.contains(d.id);
                              return FilterChip(
                                label: Text(d.nombre),
                                selected: selected,
                                onSelected: (sel) => setState(() {
                                  if (sel) {
                                    _departamentosSeleccionados.add(d.id);
                                  } else {
                                    _departamentosSeleccionados.remove(d.id);
                                  }
                                }),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              IconCard(
                icon: Icons.contact_phone,
                title: 'Contacto y Dirección',
                children: [
                  _text('Teléfono del empleado', _telefono),
                  Row(
                    spacing: 24,
                    children: [
                      Expanded(child: _text('Nombre de contacto de emergencia', _numeroContacto)),
                      Expanded(child: _text('Teléfono de contacto de emergencia', _contactoEmergencia)),
                    ],
                  ),
                  _text('Dirección completa', _direccionCompleta, maxLines: 3),
                  _text(
                    'Correo',
                    _correo,
                    required: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return null;
                      if (!value.contains('@')) return 'Correo inválido';
                      return null;
                    },
                  ),
                ],
              ),
              IconCard(
                icon: Icons.folder,
                title: 'Documentos',
                children: [
                  for (final (sectionTitle, fields) in _documentSections)
                    _documentSection(sectionTitle, fields),
                ],
              ),
              ListenableBuilder(
                listenable: widget.viewmodel.create,
                builder: (context, _) {
                  final running = widget.viewmodel.create.running;
                  return Align(
                    alignment: .centerRight,
                    child: ElevatedButton(
                      onPressed: running ? null : _submit,
                      child: running
                          ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : Text('Dar de alta'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
