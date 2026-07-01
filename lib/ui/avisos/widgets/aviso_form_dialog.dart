import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/ui/core/ui/form/image_picker.dart';

class AvisoFormDialog extends StatefulWidget {
  const AvisoFormDialog({
    super.key,
    this.aviso,
    required this.day,
  });

  final Aviso? aviso;
  final DateTime day;

  @override
  State<AvisoFormDialog> createState() => _AvisoFormDialogState();
}

class _AvisoFormDialogState extends State<AvisoFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _content;
  PlatformFile? _image;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final aviso = _constructAviso();
      Navigator.pop(context, aviso);
    }
  }

  Aviso _constructAviso() {
    if (_isEdit) {
      return widget.aviso!.copyWith(
        content: _content.value.text,
        showAt: widget.day,
        attachmentFile: _image,
        attachment: null,
      );
    } else {
      return Aviso(
        content: _content.value.text,
        showAt: widget.day,
        attachmentFile: _image,
      );
    }
  }

  void _onChangedImageHandler(PlatformFile? file) {
    setState(() => _image = file);
  }

  bool get _isEdit => widget.aviso != null;
  
  @override
  void initState() {
    super.initState();
    _content = TextEditingController(text: widget.aviso?.content);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(32),
      ),
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 25),
                blurRadius: 50,
                spreadRadius: -12,
              ),
            ],
          ),
          child: Column(
            spacing: 24,
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                _isEdit ? 'Editar aviso' : 'Nuevo aviso',
                style: TextTheme.of(context).headlineSmall,
              ),
              Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'CONTENIDO DEL AVISO',
                    style: TextTheme.of(context).labelMedium?.copyWith(
                      fontWeight: .w900,
                    ),
                  ),
                  SizedBox(
                    width: 380,
                    child: TextFormField(
                      controller: _content,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Ingrese el mensaje';
                        return null;
                      },
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'IMAGEN ADJUNTA (OPCIONAL)',
                    style: TextTheme.of(context).labelMedium?.copyWith(
                      fontWeight: .w900,
                    ),
                  ),
                  ImagePicker(
                    width: 380,
                    height: 95,
                    initialValue: widget.aviso?.attachment,
                    onChanged: _onChangedImageHandler,
                  ),
                ],
              ),
              SizedBox(
                width: 400,
                child: ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: Icon(LucideIcons.check),
                  label: Text(_isEdit ? 'Actualizar aviso' : 'Guardar aviso')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
