import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/config/assets.dart';
import 'package:ri_rh_v2/domain/models/asistencia/asistencia.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/mensaje_registro.dart';
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
                onPressed: () => context.go(Routes.ingresoManual),
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
            color: context.rh.exito,
            width: 1.6,
          ),
          gradient: LinearGradient(
            begin: .centerLeft,
            end: .centerRight,
            colors: [
              context.rh.segun(claro: Color(0xFFD4EDDA), oscuro: Color(0xFF173222)),
              context.rh.segun(claro: Color(0xFFC3E6CB), oscuro: Color(0xFF1C3B28)),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset(Assets.scanSuccess),
      );
    }
    else if (scanFingerprint.error || register.error) {
      return Container(
        padding: EdgeInsets.all(48),
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: context.rh.error,
            width: 1.6,
          ),
          gradient: LinearGradient(
            begin: .centerLeft,
            end: .centerRight,
            colors: [
              context.rh.segun(claro: Color(0xFFFFF8F0), oscuro: Color(0xFF241B13)),
              context.rh.fondo,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset(Assets.scanFailure)
      );
    }
    
    return Container(
      padding: EdgeInsets.all(48),
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: context.rh.bordeAcento,
          width: 1.6,
        ),
        gradient: LinearGradient(
          begin: .centerLeft,
          end: .centerRight,
          colors: [
            context.rh.segun(claro: Color(0xFFFFF8F0), oscuro: Color(0xFF241B13)),
            context.rh.fondo,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SvgPicture.asset(Assets.fingerprint),
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
        style: baseStyle?.copyWith(color: context.rh.error),
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
        style: baseStyle?.copyWith(color: context.rh.error),
        textAlign: .center,
      );
    }
    else if (register.completed) {
      return Text(
        mensajeRegistro((register.result! as Ok<Asistencia>).value.type),
        style: baseStyle?.copyWith(color: context.rh.exito),
        textAlign: .center,
      );
    }

    return Text(
      'Toca el sensor para registrar',
      style: baseStyle?.copyWith(color: context.rh.etiquetaSuave),
      textAlign: .center,
    );
  }
}