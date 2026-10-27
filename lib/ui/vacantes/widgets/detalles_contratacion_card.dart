import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ri_rh_v2/data/repositories/vacantes/vacantes_repository.dart';
import 'package:ri_rh_v2/domain/models/vacantes/candidato_detalle.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/icon_card.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/datetime_extensions.dart';

/// Tarjeta editable de "Detalles de contratación" (Fase F): RH llena todo
/// lo que falta para armar la Solicitud de contrato (y el Anexo II si
/// aplica) antes de presionar "Solicitar contrato". Guarda su propio estado
/// local (controllers) inicializado desde `candidato`, independiente del
/// resto de la pantalla (de solo lectura).
class DetallesContratacionCard extends StatefulWidget {
  const DetallesContratacionCard({
    super.key,
    required this.candidato,
    required this.guardarDetalles,
    required this.solicitarContrato,
    required this.rechazarDocumentacion,
    required this.vistaPreviaDocumentos,
  });

  final CandidatoDetalle candidato;
  final Command1<CandidatoDetalle, DetalleContratacionParams> guardarDetalles;
  final Command0<CandidatoDetalle> solicitarContrato;
  final Command1<CandidatoDetalle, String> rechazarDocumentacion;
  final Command0<VistaPreviaDocumentos> vistaPreviaDocumentos;

  @override
  State<DetallesContratacionCard> createState() =>
      _DetallesContratacionCardState();
}

class _EquipoControllers {
  _EquipoControllers({CandidatoEquipo? inicial})
    : descripcion = TextEditingController(text: inicial?.descripcion ?? ''),
      marca = TextEditingController(text: inicial?.marca ?? ''),
      modelo = TextEditingController(text: inicial?.modelo ?? ''),
      numeroSerie = TextEditingController(text: inicial?.numeroSerie ?? ''),
      accesorios = TextEditingController(text: inicial?.accesorios ?? ''),
      condicionesEntrega = TextEditingController(
        text: inicial?.condicionesEntrega ?? '',
      );

  final TextEditingController descripcion;
  final TextEditingController marca;
  final TextEditingController modelo;
  final TextEditingController numeroSerie;
  final TextEditingController accesorios;
  final TextEditingController condicionesEntrega;

  CandidatoEquipo toEquipo() => CandidatoEquipo(
    descripcion: descripcion.text.trim(),
    marca: marca.text.trim(),
    modelo: modelo.text.trim(),
    numeroSerie: numeroSerie.text.trim(),
    accesorios: accesorios.text.trim(),
    condicionesEntrega: condicionesEntrega.text.trim(),
  );

  void dispose() {
    descripcion.dispose();
    marca.dispose();
    modelo.dispose();
    numeroSerie.dispose();
    accesorios.dispose();
    condicionesEntrega.dispose();
  }
}

class _DetallesContratacionCardState extends State<DetallesContratacionCard> {
  final _salario = TextEditingController();
  final _montoRetencionInfonavit = TextEditingController(text: '0.00');
  final _rotacionDetalle = TextEditingController();
  final _diasLaborados = TextEditingController();
  final _diaDescanso = TextEditingController();
  final _bonoAsistencia = TextEditingController();
  final _bonoPuntualidad = TextEditingController();
  final _comisionesDetalle = TextEditingController();
  final _herramientas = TextEditingController();
  // Solo se usa (y se muestra) cuando el tipo de contrato es "determinado".
  final _duracionDias = TextEditingController();

  DateTime? _fechaIngreso;
  String? _tipoContrato;
  String? _tipoJornada;
  TimeOfDay? _horaEntrada;
  TimeOfDay? _horaComidaInicio;
  TimeOfDay? _horaComidaFin;
  TimeOfDay? _horaSalida;
  String? _formaPago;
  String? _modalidadPago;
  bool? _valesMonedero;
  bool? _percibeComisiones;
  bool _entregaEquipo = false;
  final List<_EquipoControllers> _equipos = [];

  @override
  void initState() {
    super.initState();
    _inicializarDesde(widget.candidato);
  }

  void _inicializarDesde(CandidatoDetalle c) {
    // El turno de la solicitud (si tiene uno uniforme) se usa como sugerencia
    // mientras RH no haya guardado nada propio en estos campos -- no
    // sobreescribe lo que ya se hubiera guardado antes.
    final turno = c.turnoSugerido;

    _salario.text = c.salarioDiario?.toStringAsFixed(2) ?? '';
    _montoRetencionInfonavit.text =
        c.montoRetencionInfonavit?.toStringAsFixed(2) ?? '0.00';
    _rotacionDetalle.text = c.rotacionDetalle;
    _diasLaborados.text = c.diasLaborados.isNotEmpty
        ? c.diasLaborados
        : (turno?.diasLaborados.isNotEmpty ?? false
              ? turno!.diasLaborados
              : 'Lunes a viernes');
    _diaDescanso.text = c.diaDescanso.isNotEmpty
        ? c.diaDescanso
        : (turno?.diaDescanso.isNotEmpty ?? false
              ? turno!.diaDescanso
              : 'Sábados y domingos');
    _bonoAsistencia.text = c.bonoAsistencia;
    _bonoPuntualidad.text = c.bonoPuntualidad;
    _comisionesDetalle.text = c.comisionesDetalle;
    _herramientas.text = c.herramientas;
    _fechaIngreso = c.fechaIngreso;
    _tipoContrato = c.tipoContrato.isEmpty ? null : c.tipoContrato;
    _duracionDias.text = c.duracionDias?.toString() ?? '';
    // Un turno uniforme es, por definición, horario fijo -- se sugiere
    // "fijo" solo cuando hay turno y RH no eligió nada todavía.
    _tipoJornada = c.tipoJornada.isNotEmpty
        ? c.tipoJornada
        : (turno != null ? 'fijo' : null);
    _horaEntrada = _parseHora(c.horaEntrada) ?? _parseHora(turno?.horaEntrada);
    _horaComidaInicio =
        _parseHora(c.horaComidaInicio) ?? _parseHora(turno?.horaComidaInicio);
    _horaComidaFin =
        _parseHora(c.horaComidaFin) ?? _parseHora(turno?.horaComidaFin);
    _horaSalida = _parseHora(c.horaSalida) ?? _parseHora(turno?.horaSalida);
    _formaPago = c.formaPago.isEmpty ? null : c.formaPago;
    _modalidadPago = c.modalidadPago.isEmpty ? null : c.modalidadPago;
    _valesMonedero = c.valesDespensaMonedero;
    _percibeComisiones = c.percibeComisiones;
    _entregaEquipo = c.entregaEquipo;
    for (final equipo in _equipos) {
      equipo.dispose();
    }
    _equipos
      ..clear()
      ..addAll(c.equiposEntregados.map((e) => _EquipoControllers(inicial: e)));
  }

  TimeOfDay? _parseHora(String? valor) {
    if (valor == null || valor.isEmpty) return null;
    final partes = valor.split(':');
    if (partes.length < 2) return null;
    return TimeOfDay(
      hour: int.tryParse(partes[0]) ?? 0,
      minute: int.tryParse(partes[1]) ?? 0,
    );
  }

  String? _horaToString(TimeOfDay? hora) {
    if (hora == null) return null;
    final h = hora.hour.toString().padLeft(2, '0');
    final m = hora.minute.toString().padLeft(2, '0');
    return '$h:$m:00';
  }

  @override
  void dispose() {
    _salario.dispose();
    _montoRetencionInfonavit.dispose();
    _rotacionDetalle.dispose();
    _diasLaborados.dispose();
    _diaDescanso.dispose();
    _bonoAsistencia.dispose();
    _bonoPuntualidad.dispose();
    _comisionesDetalle.dispose();
    _herramientas.dispose();
    _duracionDias.dispose();
    for (final equipo in _equipos) {
      equipo.dispose();
    }
    super.dispose();
  }

  Future<void> _elegirFecha() async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: _fechaIngreso ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (fecha != null) setState(() => _fechaIngreso = fecha);
  }

  Future<void> _elegirHora(
    TimeOfDay? actual,
    void Function(TimeOfDay) onElegida,
  ) async {
    final hora = await showTimePicker(
      context: context,
      initialTime: actual ?? TimeOfDay.now(),
    );
    if (hora != null) setState(() => onElegida(hora));
  }

  void _guardar() {
    widget.guardarDetalles.execute((
      id: widget.candidato.id,
      salarioDiario: double.tryParse(_salario.text.replaceAll(',', '')),
      montoRetencionInfonavit: double.tryParse(
        _montoRetencionInfonavit.text.replaceAll(',', ''),
      ),
      fechaIngreso: _fechaIngreso,
      tipoContrato: _tipoContrato ?? '',
      duracionDias: _tipoContrato == 'determinado' ? int.tryParse(_duracionDias.text.trim()) : null,
      tipoJornada: _tipoJornada ?? '',
      rotacionDetalle: _rotacionDetalle.text.trim(),
      diasLaborados: _diasLaborados.text.trim(),
      diaDescanso: _diaDescanso.text.trim(),
      horaEntrada: _horaToString(_horaEntrada),
      horaComidaInicio: _horaToString(_horaComidaInicio),
      horaComidaFin: _horaToString(_horaComidaFin),
      horaSalida: _horaToString(_horaSalida),
      formaPago: _formaPago ?? '',
      modalidadPago: _modalidadPago ?? '',
      bonoAsistencia: _bonoAsistencia.text.trim(),
      bonoPuntualidad: _bonoPuntualidad.text.trim(),
      valesDespensaMonedero: _valesMonedero,
      percibeComisiones: _percibeComisiones,
      comisionesDetalle: _comisionesDetalle.text.trim(),
      herramientas: _herramientas.text.trim(),
      entregaEquipo: _entregaEquipo,
      equiposEntregados: _equipos.map((e) => e.toEquipo()).toList(),
    ));
  }

  Future<void> _rechazar() async {
    final motivo = await showDialog<String>(
      context: context,
      builder: (context) => const _MotivoRechazoDialog(),
    );
    if (motivo != null && motivo.isNotEmpty) {
      widget.rechazarDocumentacion.execute(motivo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final yaSolicitado = widget.candidato.contratoSolicitadoEn != null;

    // Las etiquetas de los campos siempre arriba/a la izquierda -- sin esto,
    // un dropdown/campo vacío (sin valor todavía) muestra la etiqueta
    // centrada en vez de en su posición normal.
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
      child: IconCard(
        icon: Icons.description_outlined,
        title: 'Detalles de contratación',
        children: [
          if (yaSolicitado)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Contrato solicitado el ${widget.candidato.contratoSolicitadoEn!.toShortIsoString()}',
                style: const TextStyle(
                  color: Color(0xFF008236),
                  fontWeight: .w700,
                ),
              ),
            ),
          AbsorbPointer(
            absorbing: yaSolicitado,
            child: Opacity(
              opacity: yaSolicitado ? 0.6 : 1,
              child: Column(
                spacing: 16,
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _salario,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Salario diario',
                            prefixText: r'$',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: InkWell(
                          onTap: _elegirFecha,
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Fecha de ingreso',
                            ),
                            child: Text(
                              _fechaIngreso?.toShortIsoString() ?? 'Elegir fecha',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 280,
                        child: _dropdown(
                          'Tipo de contrato',
                          _tipoContrato,
                          CandidatoChoices.tipoContrato,
                          (v) => setState(() => _tipoContrato = v),
                        ),
                      ),
                      if (_tipoContrato == 'determinado')
                        SizedBox(
                          width: 160,
                          child: TextFormField(
                            controller: _duracionDias,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(
                              labelText: 'Duración (días)',
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _montoRetencionInfonavit,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Monto retención Infonavit',
                            prefixText: r'$',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width: 180,
                        child: _dropdown(
                          'Tipo de jornada',
                          _tipoJornada,
                          CandidatoChoices.tipoJornada,
                          (v) => setState(() => _tipoJornada = v),
                        ),
                      ),
                      if (_tipoJornada == 'rotativo')
                        SizedBox(
                          width: 260,
                          child: TextFormField(
                            controller: _rotacionDetalle,
                            decoration: const InputDecoration(
                              labelText: 'Detalle de rotación',
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 220,
                        child: TextFormField(
                          controller: _diasLaborados,
                          decoration: const InputDecoration(
                            labelText: 'Días laborados',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: TextFormField(
                          controller: _diaDescanso,
                          decoration: const InputDecoration(
                            labelText: 'Día(s) de descanso',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: _horaField(
                          'Hora de entrada',
                          _horaEntrada,
                          (h) => _horaEntrada = h,
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: _horaField(
                          'Inicio de comida',
                          _horaComidaInicio,
                          (h) => _horaComidaInicio = h,
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: _horaField(
                          'Fin de comida',
                          _horaComidaFin,
                          (h) => _horaComidaFin = h,
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: _horaField(
                          'Hora de salida',
                          _horaSalida,
                          (h) => _horaSalida = h,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width: 200,
                        child: _dropdown(
                          'Forma de pago',
                          _formaPago,
                          CandidatoChoices.formaPago,
                          (v) => setState(() => _formaPago = v),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: _dropdown(
                          'Modalidad de pago',
                          _modalidadPago,
                          CandidatoChoices.modalidadPago,
                          (v) => setState(() => _modalidadPago = v),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _bonoAsistencia,
                          decoration: const InputDecoration(
                            labelText: 'Bono de asistencia',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _bonoPuntualidad,
                          decoration: const InputDecoration(
                            labelText: 'Bono de puntualidad',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: _triStateDropdown(
                          'Vales de despensa (monedero)',
                          _valesMonedero,
                          (v) => setState(() => _valesMonedero = v),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: _triStateDropdown(
                          '¿Percibe comisiones?',
                          _percibeComisiones,
                          (v) => setState(() => _percibeComisiones = v),
                        ),
                      ),
                      if (_percibeComisiones == true)
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _comisionesDetalle,
                            decoration: const InputDecoration(
                              labelText: 'Procedimiento de comisiones',
                            ),
                          ),
                        ),
                    ],
                  ),
                  const Divider(),
                  TextFormField(
                    initialValue:
                        widget.candidato.puestoResponsabilidades.isEmpty
                        ? 'El puesto no tiene responsabilidades cargadas.'
                        : widget.candidato.puestoResponsabilidades,
                    readOnly: true,
                    maxLines: null,
                    style: TextStyle(color: Colors.grey[700]),
                    decoration: const InputDecoration(
                      labelText: 'Funciones (responsabilidades del puesto)',
                      helperText:
                          'Así va a salir en el documento -- se edita desde el puesto, no aquí.',
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    controller: _herramientas,
                    decoration: const InputDecoration(
                      labelText: 'Herramientas',
                    ),
                  ),
                  const Divider(),
                  _equipoSection(),
                ],
              ),
            ),
          ),
          if (!yaSolicitado)
            Wrap(
              alignment: .end,
              spacing: 12,
              runSpacing: 12,
              children: [
                ListenableBuilder(
                  listenable: widget.rechazarDocumentacion,
                  builder: (context, _) => OutlinedButton.icon(
                    onPressed: widget.rechazarDocumentacion.running
                        ? null
                        : _rechazar,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: errorColor,
                      side: BorderSide(color: errorColor),
                    ),
                    icon: const Icon(Icons.block),
                    label: const Text('Rechazar documentación'),
                  ),
                ),
                ListenableBuilder(
                  listenable: widget.guardarDetalles,
                  builder: (context, _) => OutlinedButton.icon(
                    onPressed: widget.guardarDetalles.running ? null : _guardar,
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('Guardar detalles'),
                  ),
                ),
                ListenableBuilder(
                  listenable: widget.vistaPreviaDocumentos,
                  builder: (context, _) => OutlinedButton.icon(
                    onPressed: widget.vistaPreviaDocumentos.running
                        ? null
                        : widget.vistaPreviaDocumentos.execute,
                    icon: const Icon(Icons.download_outlined),
                    label: const Text('Descargar documentos'),
                  ),
                ),
                ListenableBuilder(
                  listenable: widget.solicitarContrato,
                  builder: (context, _) => ElevatedButton.icon(
                    onPressed: widget.solicitarContrato.running
                        ? null
                        : () {
                            _guardar();
                            widget.solicitarContrato.execute();
                          },
                    icon: const Icon(Icons.send_outlined),
                    label: const Text('Solicitar contrato'),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _dropdown(
    String label,
    String? value,
    List<(String, String)> opciones,
    ValueChanged<String?> onChanged, {
    bool enabled = true,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: [
        for (final (v, l) in opciones)
          DropdownMenuItem(
            value: v,
            child: Text(l, overflow: .ellipsis),
          ),
      ],
      onChanged: enabled ? onChanged : null,
    );
  }

  Widget _triStateDropdown(
    String label,
    bool? value,
    ValueChanged<bool?> onChanged,
  ) {
    return DropdownButtonFormField<bool?>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label),
      items: const [
        DropdownMenuItem(value: null, child: Text('—')),
        DropdownMenuItem(value: true, child: Text('Sí')),
        DropdownMenuItem(value: false, child: Text('No')),
      ],
      onChanged: onChanged,
    );
  }

  Widget _horaField(
    String label,
    TimeOfDay? value,
    void Function(TimeOfDay) onElegida,
  ) {
    return InkWell(
      onTap: () => _elegirHora(value, onElegida),
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: Text(value?.format(context) ?? 'Elegir hora'),
      ),
    );
  }

  Widget _equipoSection() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 12,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('¿Se entrega equipo?'),
          subtitle: const Text(
            'Genera el Anexo II con el equipo que se agregue abajo',
          ),
          value: _entregaEquipo,
          onChanged: (v) => setState(() => _entregaEquipo = v),
        ),
        if (_entregaEquipo) ...[
          for (var i = 0; i < _equipos.length; i++) _equipoRow(i),
          OutlinedButton.icon(
            onPressed: () => setState(() => _equipos.add(_EquipoControllers())),
            icon: const Icon(Icons.add),
            label: const Text('Agregar equipo'),
          ),
        ],
      ],
    );
  }

  Widget _equipoRow(int index) {
    final equipo = _equipos[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: 220,
                child: TextFormField(
                  controller: equipo.descripcion,
                  decoration: const InputDecoration(labelText: 'Descripción'),
                ),
              ),
              SizedBox(
                width: 140,
                child: TextFormField(
                  controller: equipo.marca,
                  decoration: const InputDecoration(labelText: 'Marca'),
                ),
              ),
              SizedBox(
                width: 160,
                child: TextFormField(
                  controller: equipo.modelo,
                  decoration: const InputDecoration(labelText: 'Modelo'),
                ),
              ),
              SizedBox(
                width: 160,
                child: TextFormField(
                  controller: equipo.numeroSerie,
                  decoration: const InputDecoration(labelText: 'No. de serie'),
                ),
              ),
              SizedBox(
                width: 180,
                child: TextFormField(
                  controller: equipo.accesorios,
                  decoration: const InputDecoration(labelText: 'Accesorios'),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: equipo.condicionesEntrega,
                  decoration: const InputDecoration(
                    labelText: 'Condiciones de entrega',
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => setState(() {
                equipo.dispose();
                _equipos.removeAt(index);
              }),
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              label: const Text('Quitar', style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pide el motivo del rechazo manual -- regresa el texto (no vacío) al
/// confirmar, o null si se cancela.
class _MotivoRechazoDialog extends StatefulWidget {
  const _MotivoRechazoDialog();

  @override
  State<_MotivoRechazoDialog> createState() => _MotivoRechazoDialogState();
}

class _MotivoRechazoDialogState extends State<_MotivoRechazoDialog> {
  final _formKey = GlobalKey<FormState>();
  final _motivo = TextEditingController();

  @override
  void dispose() {
    _motivo.dispose();
    super.dispose();
  }

  void _confirmar() {
    if (!_formKey.currentState!.validate()) return;
    Navigator.of(context).pop(_motivo.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rechazar documentación'),
      content: SizedBox(
        width: 480,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            spacing: 12,
            children: [
              const Text(
                'El candidato va a poder volver a entrar a su link para corregir lo que le indiques.',
              ),
              TextFormField(
                controller: _motivo,
                autofocus: true,
                minLines: 3,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: 'Motivo del rechazo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    (value ?? '').trim().isEmpty ? 'Escribe el motivo' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _confirmar,
          style: ElevatedButton.styleFrom(backgroundColor: errorColor),
          child: const Text('Rechazar'),
        ),
      ],
    );
  }
}
