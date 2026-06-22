import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ri_rh_v2/ui/core/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/asistencia/widgets/picture_modal.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';

class FingerprintButton extends StatelessWidget {
  const FingerprintButton({
    super.key,
    required this.viewmodel,
  });

  final AsistenciaViewmodel viewmodel;
  final columnSpacing = 20.0;

  void onTapHandler() {
    viewmodel.registerEntry();
  }

  Future<void> onPressedRegistroManualHandler(BuildContext context) async {
    final cameras = await availableCameras();

    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => PictureModal(camera: cameras.first),
      );
    }                
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewmodel.scanResult == null ? onTapHandler : null,
      child: ListenableBuilder(
        listenable: viewmodel,
        builder: (context, _) {
          if (viewmodel.scanResult == true) {
            return Column(
              spacing: columnSpacing,
              children: [
                Container(
                  padding: EdgeInsets.all(48),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      color: Color(0xFF52C41A),
                      width: 1.6,
                    ),
                    gradient: LinearGradient(
                      begin: .centerLeft,
                      end: .centerRight,
                      colors: [
                        Color(0xFFD4EDDA),
                        Color(0xFFC3E6CB),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset('icons/scan_success.svg'),
                ),
                Text(
                  '¡Entrada registrada exitosamente!',
                  style: TextTheme.of(context).bodyMedium?.copyWith(color: successColor),
                  textAlign: .center,
                ),
              ],
            );
          }
      
          if (viewmodel.scanResult == false) {
            return Column(
              spacing: columnSpacing,
              children: [
                Container(
                  padding: EdgeInsets.all(48),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      color: errorColor,
                      width: 1.6,
                    ),
                    gradient: LinearGradient(
                      begin: .centerLeft,
                      end: .centerRight,
                      colors: [
                        Color(0xFFFFF8F0),
                        Color(0xFFFFF0DC),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SvgPicture.asset('icons/scan_failure.svg')
                ),
                Text(
                  'No se identifico tu huella, prueba con el dedo ${viewmodel.fingerName}',
                  style: TextTheme.of(context).bodyMedium?.copyWith(color: errorColor),
                  textAlign: .center,
                ),
              ],
            );
          }
      
          return Column(
            spacing: columnSpacing,
            children: [
              Container(
                padding: EdgeInsets.all(48),
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                    color: Color(0xFFFDDEB0),
                    width: 1.6,
                  ),
                  gradient: LinearGradient(
                    begin: .centerLeft,
                    end: .centerRight,
                    colors: [
                      Color(0xFFFFF8F0),
                      Color(0xFFFFF0DC),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset('icons/fingerprint.svg'),
              ),
              Text(
                viewmodel.scanning ? 'Leyendo huella...' : 'Toca el sensor para registrar',
                style: TextTheme.of(context).bodyMedium?.copyWith(color: viewmodel.scanning ? primaryColor : Color(0xFFC4A47A)),
                textAlign: .center,
              ),
              // if (viewmodel.manualEntryEnabled)
                TextButton(
                  onPressed: () => onPressedRegistroManualHandler(context),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text('Registro Manual', style: TextStyle(color: Colors.white)),
                ),
            ],
          );
        }
      ),
    );
  }
}
