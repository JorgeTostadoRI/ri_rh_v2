import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/manual_entry_form.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/command.dart';
import 'package:ri_rh_v2/utils/result.dart';

class FingerprintButton extends StatefulWidget {
  const FingerprintButton({
    super.key,
    required this.viewmodel,
  });

  final AsistenciaViewmodel viewmodel;

  @override
  State<FingerprintButton> createState() => _FingerprintButtonState();
}

class _FingerprintButtonState extends State<FingerprintButton> {
  final columnSpacing = 20.0;

  late Listenable _listenable;

  Future<void> onPressedRegistroManualHandler(BuildContext context) async {
    final cameras = await availableCameras();

    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (context) => ManualEntryForm(
          camera: cameras.first,
          viewmodel: widget.viewmodel,
        ),
      );
    }                
  }

  @override
  void initState() {
    super.initState();
    _listenable = Listenable.merge([
      widget.viewmodel.scanFingerprint,
      widget.viewmodel.register,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _listenable,
      builder: (context, _) {
        return Column(
          spacing: columnSpacing,
          children: [
            _IconBuilder(
              scanFingerprint: widget.viewmodel.scanFingerprint,
              register: widget.viewmodel.register,
            ),
            _LabelBuilder(
              scanFingerprint: widget.viewmodel.scanFingerprint,
              register: widget.viewmodel.register,
              fingerName: widget.viewmodel.fingerName,
            ),
            if (widget.viewmodel.manualEntryEnabled)
              TextButton(
                onPressed: () => onPressedRegistroManualHandler(context),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: Text('Registro Manual', style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      }
    );
  }
}

class _IconBuilder extends StatelessWidget {
  const _IconBuilder({
    required this.scanFingerprint,
    required this.register,
  });

  final Command1 scanFingerprint;
  final Command1 register;

  @override
  Widget build(BuildContext context) {
    if (register.completed) {
      return Container(
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
        child: SvgPicture.asset('assets/icons/scan_success.svg'),
      );
    }
    else if (scanFingerprint.error || register.error) {
      return Container(
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
              backgroundColor,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset('assets/icons/scan_failure.svg')
      );
    }
    
    return Container(
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
      child: SvgPicture.asset('assets/icons/fingerprint.svg'),
    );
  }
}

class _LabelBuilder extends StatelessWidget {
  const _LabelBuilder({
    required this.scanFingerprint,
    required this.register,
    required this.fingerName,
  });

  final Command1 scanFingerprint;
  final Command1 register;
  final String fingerName;

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextTheme.of(context).bodyMedium;

    if (scanFingerprint.error) {
      return Text(
        'No se identifico tu huella, prueba con el dedo $fingerName',
        style: baseStyle?.copyWith(color: errorColor),
        textAlign: .center,
      );
    }
    else if (register.running) {
      return Text(
        'Registrando...',
        style: baseStyle?.copyWith(color: primaryColor),
        textAlign: .center,
      );
    }
    else if (register.error) {
      return Text(
        'No se completó el registro, intente de nuevo',
        style: baseStyle?.copyWith(color: errorColor),
        textAlign: .center,
      );
    }
    else if (register.completed) {
      return Text(
        switch ((register.result! as Ok<Asistencia>).value.type!) {
          AsistenciaType.entry => '¡Entrada registrada exitosamente!',
          AsistenciaType.exitToLunch => '¡Salida registrada exitosamente!',
          AsistenciaType.entryFromLunch => '¡Entrada registrada exitosamente!',
          AsistenciaType.exit => '¡Salida registrada exitosamente!',
        },
        style: baseStyle?.copyWith(color: successColor),
        textAlign: .center,
      );
    }

    return Text(
      'Toca el sensor para registrar',
      style: baseStyle?.copyWith(color: const Color(0xFFC4A47A)),
      textAlign: .center,
    );
  }
}