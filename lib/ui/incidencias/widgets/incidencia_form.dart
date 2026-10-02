import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/api_error_codes.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_date_option.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/verify_identity_dialog.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/video_testimonio_dialog.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/field_switcher.dart';
import 'package:ri_rh_v2/ui/core/ui/form/date_form_field.dart';
import 'package:ri_rh_v2/ui/core/ui/form/field_label.dart';
import 'package:ri_rh_v2/ui/core/ui/form/time_form_field.dart';
import 'package:ri_rh_v2/utils/result.dart';

const _fieldMargin = 32.0;
const _labelMargin = 16.0;

class IncidenciaForm extends StatefulWidget {
  const IncidenciaForm({
    super.key,
    required this.viewmodel,
    required this.category,
  });

  final NewIncidenciaViewmodel viewmodel;
  final IncidenciaCategory category;

  @override
  State<IncidenciaForm> createState() => _IncidenciaFormState();
}

class _IncidenciaFormState extends State<IncidenciaForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _startDateController;
  late final TextEditingController _endDateController;
  late final TextEditingController _startTimeController;
  late final TextEditingController _endTimeController;

  // Capturado una sola vez: los datos del formulario (fechas, motivo,
  // archivos) viven dentro del viewmodel. Si el router reconstruye esta
  // ruta a medio flujo (ej. refreshListenable de GoRouter al completarse el
  // login por huella al enviar), widget.viewmodel pasaría a apuntar a una
  // instancia nueva y vacía — se perdería todo lo ya capturado. Usar
  // siempre esta misma instancia lo evita.
  late final NewIncidenciaViewmodel _viewmodel;

  Widget fileContainer(int index, PlatformFile file) {
    return Container(
      width: 200,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: inputFillColor,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: borderColor, width: 0.8),
      ),
      child: Row(
        spacing: 12,
        children: [
          Icon(LucideIcons.fileText, color: primaryColor, size: 16),
          SizedBox(
            width: 100,
            child: Text(
              file.name,
              style: TextStyle(
                color: Color(0xFF2D1E0F),
                fontSize: 12,
                fontWeight: .w600,
                height: 1.3,
                overflow: .ellipsis,
              ),
            ),
          ),
          InkWell(
            onTap: () => _viewmodel.removeFile(index),
            child: Icon(LucideIcons.x, color: errorColor, size: 20),
          ),
        ],
      ),
    );
  }

  /// El video de verificacion solo aplica a remotos entrando desde
  /// navegador -- sustituye ahi la verificacion por huella digital, que no
  /// tienen disponible (sin lector de huella en navegador). El flujo de
  /// kiosko (escritorio, con huella) no cambia en nada.
  bool get _isRemoteWeb => kIsWeb && (_viewmodel.currentUser?.isRemote ?? false);

  Future<bool> _validateAuth() async {
    final isAuthenticated = await _viewmodel.isAuthenticated;

    if (!isAuthenticated) {
      final authenticated = await showDialog<Result<bool>>(
        context: context,
        builder: (context) => VerifyIdentityDialog(
          viewmodel: _viewmodel,
        ),
        barrierDismissible: false,
      );
      if (authenticated == null) return false;

      switch (authenticated) {
        case Ok():
          // If the authentication was canceled
          if (!authenticated.value) return false;
        case Error():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ha ocurrido un error con la autenticación'),
            ),
          );
          return false;
      }
    }

    return true;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final isRemoteWeb = _isRemoteWeb;
      if (kIsWeb && !isRemoteWeb) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lo sentimos, pero no puedes completar este proceso en el navegador.'),
          ),
        );
        return;
      }

      if (isRemoteWeb) {
        // En web ya llego con su sesion normal (por eso puede ver esta
        // pantalla) -- no hay lector de huella que ofrecerle, asi que se
        // omite _validateAuth(). El video grabado es lo que sustituye esa
        // verificacion de identidad.
        if (_viewmodel.video == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Debes grabar el video de verificación antes de enviar tu solicitud.'),
            ),
          );
          return;
        }
      } else {
        final authenticated = await _validateAuth();
        if (!authenticated) return;
      }

      final result = await _viewmodel.submitData(widget.category);
      switch (result) {
        case Error():
          _handleSubmitError(result.error);
          return;
        case Ok():
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incidencia creada'),
          ),
        );

        context.go(Routes.incidencias);
      }
    }
  }

  Future<void> _handleFilePicker() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      withData: true,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) _viewmodel.addFiles(result.files);
  }

  Future<void> _handleRecordVideo() async {
    final video = await showDialog<XFile?>(
      context: context,
      builder: (context) => VideoTestimonioDialog(category: widget.category),
    );
    if (video != null) _viewmodel.onVideoRecorded(video);
  }

  void _handleSubmitError(Exception e) {
    if (e is InvalidForm) {
      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, e.message),
      );
      return;
    }

    if (e is ApiException && e.errorCode == ApiErrorCodes.noJefe) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Jefe directo no asignado'),
            content: Text(
              'No cuentas con un jefe directo asignado. '
              'Contacta al departamento de Recursos Humanos para que te asignen uno.'
            ),
            actions: [
              ElevatedButton(
                onPressed: () => context.pop(),
                child: Text('Entendido'),
              ),
            ],
          );
        }
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      errorSnackBar(context, 'Ha ocurrido un error', error: e),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewmodel = widget.viewmodel;
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();

    // Force horas extra y retardo to only allow hour input
    switch (widget.category) {
      case IncidenciaCategory.horasextra:
      case IncidenciaCategory.retardo:
        _viewmodel.onDateOptionChanged(1);
      default:
    }
  }

  @override
  void didUpdateWidget(covariant IncidenciaForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewmodel != _viewmodel) {
      // Instancia huérfana creada por la reconstrucción de la ruta: se
      // descarta de inmediato para que no se quede escuchando el sensor de
      // huella para siempre.
      widget.viewmodel.dispose();
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            FieldLabel(labelText: 'Fecha', required: true),
            const SizedBox(height: _labelMargin),
            if (widget.category != IncidenciaCategory.horasextra)
              ...[
                Row(
                  children: [
                    FieldSwitcher(
                      selectedIndex: _viewmodel.dateOption.index,
                      onSelected: _viewmodel.onDateOptionChanged,
                      options: _viewmodel.dateOptionLabels,
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            if (_viewmodel.dateOption == IncidenciaDateOption.DATE_RANGE)
              Row(
                spacing: 16,
                children: [
                  Flexible(
                    flex: 1,
                    child: DateFormField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        labelText: 'DESDE',
                        hintText: 'dd/mm/aa',
                      ),
                      required: true,
                      onDateSaved: _viewmodel.onStartDateSaved,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: DateFormField(
                      controller: _endDateController,
                      decoration: InputDecoration(
                        labelText: 'HASTA (OPCIONAL)',
                        hintText: 'dd/mm/aa',
                      ),
                      onDateSaved: _viewmodel.onEndDateSaved,
                    ),
                  ),
                ],
              ),
            if (_viewmodel.dateOption == IncidenciaDateOption.HOUR_RANGE)
              Row(
                spacing: 16,
                children: [
                  Flexible(
                    flex: 1,
                    child: DateFormField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        labelText: 'DÍA',
                        hintText: 'dd/mm/aa',
                      ),
                      onDateSaved: _viewmodel.onStartDateSaved,
                      required: true,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TimeFormField(
                      controller: _startTimeController,
                      decoration: InputDecoration(
                        labelText: 'HORA INICIO',
                        hintText: '--:--',
                      ),
                      onTimeSaved: _viewmodel.onStartTimeSaved,
                      required: true,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TimeFormField(
                      controller: _endTimeController,
                      decoration: InputDecoration(
                        labelText: 'HORA FIN',
                        hintText: '--:--',
                      ),
                      onTimeSaved: _viewmodel.onEndTimeSaved,
                      required: true,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: _fieldMargin),
            FieldLabel(labelText: 'Motivo', required: true),
            const SizedBox(height: _labelMargin),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Describe detalladamente el motivo de tu solicitud',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Motivo requerido';
                }
                return null;
              },
              onChanged: _viewmodel.onReasonChanged,
            ),
            const SizedBox(height: _fieldMargin),
            FieldLabel(labelText: 'Documentos'),
            Row(
              children: [
                OutlinedButton(
                  onPressed: _handleFilePicker,
                  child: Row(
                    spacing: 12,
                    children: [
                      Icon(LucideIcons.paperclip),
                      Text('Agregar documentos'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: _labelMargin),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                for (final (index, file) in _viewmodel.files.indexed)
                  fileContainer(index, file),
              ],
            ),
            if (_isRemoteWeb) ...[
              const SizedBox(height: _fieldMargin),
              FieldLabel(labelText: 'Video de verificación', required: true),
              const SizedBox(height: _labelMargin),
              Text(
                'Al ser una solicitud remota, graba un video corto diciendo tu nombre completo, '
                'el tipo de incidencia que estás solicitando y el motivo.',
                style: TextTheme.of(context).bodySmall,
              ),
              const SizedBox(height: _labelMargin),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: _handleRecordVideo,
                    icon: Icon(_viewmodel.video == null ? LucideIcons.video : LucideIcons.check),
                    label: Text(_viewmodel.video == null ? 'Grabar video' : 'Video grabado'),
                  ),
                  if (_viewmodel.video != null) ...[
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: _viewmodel.removeVideo,
                      child: Text('Volver a grabar'),
                    ),
                  ],
                ],
              ),
            ],
            const SizedBox(height: _fieldMargin),
            Row(
              spacing: 16,
              mainAxisAlignment: .end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Row(
                    spacing: 12,
                    children: [
                      Icon(LucideIcons.send),
                      Text('Enviar Solicitud'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
