import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/ui/core/themes/rh_colores.dart';
import 'package:ri_rh_v2/ui/core/ui/form/image_picker.dart';
import 'package:ri_rh_v2/utils/plataforma.dart';

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
    final movil = esNavegadorMovil;
    // En celular los campos (380/400 px en computadora) no caben: ocupan el
    // ancho de la pantalla menos insetPadding (16) y padding (20) por lado.
    final anchoMovil = MediaQuery.sizeOf(context).width - 2 * 16 - 2 * 20;

    return Dialog(
      insetPadding: movil
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 24)
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(32),
      ),
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(movil ? 20 : 32),
          decoration: BoxDecoration(
            color: context.rh.superficie,
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
                    width: movil ? anchoMovil : 380,
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
                    width: movil ? anchoMovil : 380,
                    height: 95,
                    initialValue: widget.aviso?.attachment,
                    onChanged: _onChangedImageHandler,
                  ),
                ],
              ),
              SizedBox(
                width: movil ? anchoMovil : 400,
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
