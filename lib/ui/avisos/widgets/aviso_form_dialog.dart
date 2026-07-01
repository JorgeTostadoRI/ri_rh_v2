import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/form/image_picker.dart';

class AvisoFormDialog extends StatefulWidget {
  const AvisoFormDialog({super.key});

  @override
  State<AvisoFormDialog> createState() => _AvisoFormDialogState();
}

class _AvisoFormDialogState extends State<AvisoFormDialog> {
  late final _content;
  
  @override
  void initState() {
    super.initState();
    _content = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(32),
      ),
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
              'Nuevo aviso',
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
                  child: TextField(
                    controller: _content,
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
                SizedBox(
                  width: 380,
                  height: 96,
                  child: ImagePicker(),
                ),
              ],
            ),
            SizedBox(
              width: 400,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(LucideIcons.check),
                label: Text('Guardar aviso')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
