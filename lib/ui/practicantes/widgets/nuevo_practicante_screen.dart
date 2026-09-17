import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/credenciales_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/document_picker_row.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/practicantes/viewmodels/nuevo_practicante_viewmodel.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

const _documentSections = [
  (
    'Identificación y datos personales',
    [
      ('identificacionOficial', 'Identificación oficial'),
      ('actaNacimiento', 'Acta de nacimiento'),
      ('pdfCurp', 'CURP (PDF)'),
      ('pdfRfc', 'RFC (PDF)'),
    ],
  ),
  (
    'Seguro social y domicilio',
    [
      ('pdfNumeroSeguroSocial', 'Número de seguro social (PDF)'),
      ('comprobanteDomicilio', 'Comprobante de domicilio'),
      ('estadoCuenta', 'Estado de cuenta'),
    ],
  ),
  (
    'Documentos académicos',
    [
      ('cartaPresentacion', 'Carta de presentación'),
      ('curriculumVitae', 'Curriculum vitae'),
    ],
  ),
];

final _documentFields = [
  for (final (_, fields) in _documentSections) ...fields,
];

// Mismas opciones (y mismo criterio de exclusión de MASTER/ADMINISTRADOR/
// COMPRADOR) que ya usa home_screen.dart para el auto-cambio de rol.
const _rolOptions = [
  ('OPERADOR', 'Operador'),
  ('LIDER', 'Lider'),
];

class NuevoPracticanteScreen extends StatefulWidget {
  const NuevoPracticanteScreen({
    super.key,
    required this.viewmodel,
  });

  final NuevoPracticanteViewmodel viewmodel;

  @override
  State<NuevoPracticanteScreen> createState() => _NuevoPracticanteScreenState();
}

class _NuevoPracticanteScreenState extends State<NuevoPracticanteScreen> {
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

  DateTime? _fechaNacimiento;
  DateTime? _fechaAlta = DateTime.now();
  Puesto? _puesto;
  Universidad? _universidad;
  Departamento? _departamento;
  String? _rol;
  TypePracticante _tipo = TypePracticante.practicante;

  final Map<String, PlatformFile?> _files = {
    for (final (key, _) in _documentFields) key: null,
  };

  @override
  void initState() {
    super.initState();
    widget.viewmodel.create.addListener(_onCreateResult);
  }

  @override
  void dispose() {
    widget.viewmodel.create.removeListener(_onCreateResult);
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
    super.dispose();
  }

  void _onCreateResult() {
    if (widget.viewmodel.create.completed) {
      final practicante = (widget.viewmodel.create.result as Ok<Practicante>).value;
      widget.viewmodel.create.clearResult();
      _showCredencialesAndNavigate(practicante);
      return;
    }

    if (widget.viewmodel.create.error) {
      final error = (widget.viewmodel.create.result as Error).error;
      widget.viewmodel.create.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'No se pudo dar de alta al practicante', error: error),
      );
    }
  }

  Future<void> _showCredencialesAndNavigate(Practicante practicante) async {
    final credenciales = practicante.credencialesGeneradas;
    if (credenciales != null) {
      await CredencialesDialog.show(context, nombre: practicante.base.nombre, credenciales: credenciales);
    }

    if (!mounted) return;
    context.go(Routes.expedienteOfPracticante(practicante));
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
      builder: (context) => _CreatePuestoDialog(createPuesto: widget.viewmodel.createPuesto),
    );
    if (puesto != null) {
      setState(() => _puesto = puesto);
    }
  }

  Future<void> _openCreateUniversidadDialog() async {
    final universidad = await showDialog<Universidad>(
      context: context,
      builder: (context) => _CreateUniversidadDialog(createUniversidad: widget.viewmodel.createUniversidad),
    );
    if (universidad != null) {
      setState(() => _universidad = universidad);
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
    if (_universidad == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecciona una universidad')),
      );
      return;
    }
    if (_fechaNacimiento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ingresa la fecha de nacimiento')),
      );
      return;
    }
    if (_departamento == null || _rol == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecciona el departamento y rol del usuario')),
      );
      return;
    }

    final params = PracticanteCreateParams(
      nombreCompleto: _nombreCompleto.text.trim(),
      tipo: _tipo,
      universidadId: _universidad!.id,
      puestoId: _puesto!.id!,
      fechaNacimiento: _fechaNacimiento!,
      salarioDiario: _parseDecimal(_salarioDiario.text)!,
      clabeInterbancaria: _clabeInterbancaria.text.trim(),
      numeroContacto: _numeroContacto.text.trim(),
      contactoEmergencia: _contactoEmergencia.text.trim(),
      rfc: _rfc.text.trim(),
      curp: _curp.text.trim(),
      numeroSeguroSocial: _numeroSeguroSocial.text.trim(),
      direccionCompleta: _direccionCompleta.text.trim(),
      telefono: _telefono.text.trim(),
      correo: _correo.text.trim().isEmpty ? null : _correo.text.trim(),
      departamentoId: _departamento!.id,
      rol: _rol,
      fechaAlta: _fechaAlta,
      identificacionOficial: _files['identificacionOficial'],
      actaNacimiento: _files['actaNacimiento'],
      estadoCuenta: _files['estadoCuenta'],
      pdfRfc: _files['pdfRfc'],
      pdfCurp: _files['pdfCurp'],
      pdfNumeroSeguroSocial: _files['pdfNumeroSeguroSocial'],
      comprobanteDomicilio: _files['comprobanteDomicilio'],
      cartaPresentacion: _files['cartaPresentacion'],
      curriculumVitae: _files['curriculumVitae'],
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
                title: 'Nuevo Practicante',
                subtitle:
                    'Da de alta a un nuevo practicante o residente. El sistema creará y vinculará su usuario automáticamente.',
                showBackButton: true,
              ),
              IconCard(
                icon: Icons.person,
                title: 'Datos Generales',
                children: [
                  SegmentedButton<TypePracticante>(
                    segments: const [
                      ButtonSegment(value: TypePracticante.practicante, label: Text('Practicante')),
                      ButtonSegment(value: TypePracticante.residente, label: Text('Residente')),
                    ],
                    selected: {_tipo},
                    onSelectionChanged: (value) => setState(() => _tipo = value.first),
                  ),
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
                      return Column(
                        spacing: 16,
                        children: [
                          Row(
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
                                  onChanged: (value) => setState(() => _puesto = value),
                                  validator: (value) => value == null ? 'Selecciona un puesto' : null,
                                ),
                              ),
                              IconButton(
                                tooltip: 'Crear puesto nuevo',
                                onPressed: _openCreatePuestoDialog,
                                icon: Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 12,
                            crossAxisAlignment: .end,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<Universidad>(
                                  initialValue: _universidad,
                                  decoration: InputDecoration(labelText: 'UNIVERSIDAD'),
                                  items: widget.viewmodel.universidades
                                      .map((u) => DropdownMenuItem(value: u, child: Text(u.nombre)))
                                      .toList(),
                                  onChanged: (value) => setState(() => _universidad = value),
                                  validator: (value) => value == null ? 'Selecciona una universidad' : null,
                                ),
                              ),
                              IconButton(
                                tooltip: 'Crear universidad nueva',
                                onPressed: _openCreateUniversidadDialog,
                                icon: Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 24,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<Departamento>(
                                  initialValue: _departamento,
                                  decoration: InputDecoration(labelText: 'DEPARTAMENTO (USUARIO)'),
                                  items: widget.viewmodel.departamentos
                                      .map((d) => DropdownMenuItem(value: d, child: Text(d.nombre)))
                                      .toList(),
                                  onChanged: (value) => setState(() => _departamento = value),
                                  validator: (value) => value == null ? 'Selecciona un departamento' : null,
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  initialValue: _rol,
                                  decoration: InputDecoration(labelText: 'ROL (USUARIO)'),
                                  items: _rolOptions
                                      .map((r) => DropdownMenuItem(value: r.$1, child: Text(r.$2)))
                                      .toList(),
                                  onChanged: (value) => setState(() => _rol = value),
                                  validator: (value) => value == null ? 'Selecciona un rol' : null,
                                ),
                              ),
                            ],
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
                    lastDate: DateTime.now(),
                    initialValue: _formatDate(_fechaAlta!),
                    onDateSaved: (value) => _fechaAlta = value,
                  ),
                  Row(
                    spacing: 24,
                    children: [
                      Expanded(
                        child: _text(
                          'Salario diario',
                          _salarioDiario,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          validator: _decimalValidator,
                        ),
                      ),
                      Expanded(child: _text('CLABE interbancaria', _clabeInterbancaria)),
                    ],
                  ),
                ],
              ),
              IconCard(
                icon: Icons.contact_phone,
                title: 'Contacto y Dirección',
                children: [
                  _text('Teléfono del practicante', _telefono),
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

class _CreatePuestoDialog extends StatefulWidget {
  const _CreatePuestoDialog({required this.createPuesto});

  final Command1<Puesto, PuestoCreateParams> createPuesto;

  @override
  State<_CreatePuestoDialog> createState() => _CreatePuestoDialogState();
}

class _CreatePuestoDialogState extends State<_CreatePuestoDialog> {
  final _nombre = TextEditingController();
  TipoPuesto _tipo = TipoPuesto.administrativo;

  @override
  void initState() {
    super.initState();
    widget.createPuesto.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.createPuesto.removeListener(_onResult);
    _nombre.dispose();
    super.dispose();
  }

  void _onResult() {
    if (widget.createPuesto.completed) {
      final puesto = (widget.createPuesto.result as Ok<Puesto>).value;
      widget.createPuesto.clearResult();
      if (mounted) Navigator.of(context).pop(puesto);
      return;
    }
    if (widget.createPuesto.error) {
      final error = (widget.createPuesto.result as Error).error;
      widget.createPuesto.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo crear el puesto', error: error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.createPuesto,
      builder: (context, _) {
        final running = widget.createPuesto.running;
        return AlertDialog(
          title: Text('Crear puesto'),
          content: Column(
            mainAxisSize: .min,
            spacing: 16,
            children: [
              TextField(
                controller: _nombre,
                decoration: InputDecoration(labelText: 'NOMBRE'),
              ),
              DropdownButtonFormField<TipoPuesto>(
                initialValue: _tipo,
                decoration: InputDecoration(labelText: 'TIPO'),
                items: TipoPuesto.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name))).toList(),
                onChanged: (value) => setState(() => _tipo = value ?? _tipo),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || _nombre.text.trim().isEmpty
                  ? null
                  : () => widget.createPuesto.execute((nombre: _nombre.text.trim(), tipos: _tipo.name)),
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text('Crear'),
            ),
          ],
        );
      },
    );
  }
}

class _CreateUniversidadDialog extends StatefulWidget {
  const _CreateUniversidadDialog({required this.createUniversidad});

  final Command1<Universidad, UniversidadCreateParams> createUniversidad;

  @override
  State<_CreateUniversidadDialog> createState() => _CreateUniversidadDialogState();
}

class _CreateUniversidadDialogState extends State<_CreateUniversidadDialog> {
  final _nombre = TextEditingController();
  final _direccion = TextEditingController();
  final _numeroContacto = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.createUniversidad.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.createUniversidad.removeListener(_onResult);
    _nombre.dispose();
    _direccion.dispose();
    _numeroContacto.dispose();
    super.dispose();
  }

  void _onResult() {
    if (widget.createUniversidad.completed) {
      final universidad = (widget.createUniversidad.result as Ok<Universidad>).value;
      widget.createUniversidad.clearResult();
      if (mounted) Navigator.of(context).pop(universidad);
      return;
    }
    if (widget.createUniversidad.error) {
      final error = (widget.createUniversidad.result as Error).error;
      widget.createUniversidad.clearResult();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo crear la universidad', error: error),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.createUniversidad,
      builder: (context, _) {
        final running = widget.createUniversidad.running;
        final canSubmit = _nombre.text.trim().isNotEmpty &&
            _direccion.text.trim().isNotEmpty &&
            _numeroContacto.text.trim().isNotEmpty;
        return AlertDialog(
          title: Text('Crear universidad'),
          content: Column(
            mainAxisSize: .min,
            spacing: 16,
            children: [
              TextField(
                controller: _nombre,
                decoration: InputDecoration(labelText: 'NOMBRE'),
                onChanged: (_) => setState(() {}),
              ),
              TextField(
                controller: _direccion,
                decoration: InputDecoration(labelText: 'DIRECCIÓN'),
                onChanged: (_) => setState(() {}),
              ),
              TextField(
                controller: _numeroContacto,
                decoration: InputDecoration(labelText: 'NÚMERO DE CONTACTO'),
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: running ? null : () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: running || !canSubmit
                  ? null
                  : () => widget.createUniversidad.execute((
                      nombre: _nombre.text.trim(),
                      direccion: _direccion.text.trim(),
                      numeroContacto: _numeroContacto.text.trim(),
                    )),
              child: running
                  ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text('Crear'),
            ),
          ],
        );
      },
    );
  }
}
