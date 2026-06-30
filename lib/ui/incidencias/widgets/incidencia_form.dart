import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_category.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia_date_option.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/incidencias/view_models/new_incidencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/verify_identity_dialog.dart';
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
            onTap: () => widget.viewmodel.removeFile(index),
            child: Icon(LucideIcons.x, color: errorColor, size: 20),
          ),
        ],
      ),
    );
  }

  Future<bool> _validateAuth() async {
    final isAuthenticated = await widget.viewmodel.isAuthenticated;

    if (!isAuthenticated) {
      final authenticated = await showDialog<Result<bool>>(
        context: context,
        builder: (context) => VerifyIdentityDialog(
          viewmodel: widget.viewmodel,
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
      final authenticated = await _validateAuth();
      if (!authenticated) return;

      final result = await widget.viewmodel.submitData(widget.category);
      if (result is Ok) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Incidencia creada'),
            ),
          );

          context.go(Routes.incidencias);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ha ocurrido un error'),
          ),
        );
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

    if (result != null) widget.viewmodel.addFiles(result.files);
  }

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
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
            Row(
              children: [
                FieldSwitcher(
                  selectedIndex: widget.viewmodel.dateOption.index,
                  onSelected: widget.viewmodel.onDateOptionChanged,
                  options: widget.viewmodel.dateOptionLabels,
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 8),
            if (widget.viewmodel.dateOption == IncidenciaDateOption.DATE_RANGE)
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
                      onDateSaved: widget.viewmodel.onStartDateSaved,
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
                      onDateSaved: widget.viewmodel.onEndDateSaved,
                    ),
                  ),
                ],
              ),
            if (widget.viewmodel.dateOption == IncidenciaDateOption.HOUR_RANGE)
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
                      onDateSaved: widget.viewmodel.onStartDateSaved,
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
                      onTimeSaved: widget.viewmodel.onStartTimeSaved,
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
                      onTimeSaved: widget.viewmodel.onEndTimeSaved,
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
              onChanged: widget.viewmodel.onReasonChanged,
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
                for (final (index, file) in widget.viewmodel.files.indexed)
                  fileContainer(index, file),
              ],
            ),
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
