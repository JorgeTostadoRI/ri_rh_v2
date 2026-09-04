import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/api_error_codes.dart';
import 'package:ri_rh_v2/routing/routes.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/scanner_status.dart';
import 'package:ri_rh_v2/utils/result.dart' as result;
import 'package:ri_rh_v2/ui/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/fingerprint_button.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/motd_list.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/clock.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/debouncer.dart';

class AsistenciaScreen extends StatefulWidget {
  const AsistenciaScreen({
    super.key,
    required this.viewmodel,  
  });

  final AsistenciaViewmodel viewmodel;

  @override
  State<AsistenciaScreen> createState() => _AsistenciaScreenState();
}

class _AsistenciaScreenState extends State<AsistenciaScreen> {
  CameraController? _controller;
  late Future<List<CameraDescription>> _getAvailableCameras;
  final Debouncer _debouncer = Debouncer(milliseconds: 60000); // 1 minute

  void _onRegisterResult() {
    if (widget.viewmodel.register.completed) {
      Future.delayed(const Duration(seconds: 2), () => widget.viewmodel.register.clearResult());
    }

    if (widget.viewmodel.register.error) {
      final error = (widget.viewmodel.register.result as result.Error).error;
      Future.delayed(const Duration(seconds: 2), () => widget.viewmodel.register.clearResult());

      if (error is ApiException) {
        if (error.errorCode == ApiErrorCodes.lateEntry) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Fuera de Horario'),
                content: Text(
                  'No se ha registrado tu entrada debido a que intentaste registrar fuera de tu hora permitida de entrada. '
                  'Ten en cuenta que tienes 10 minutos de gracia para tu entrada. '
                  'No entré a laborar hoy porque NO se le dará compensación por el trabajo.'
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

        if (error.errorCode == ApiErrorCodes.noHorario) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Horario no asignado'),
                content: Text(
                  'No cuentas con un horario de entrada asignado. '
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
      }

      ScaffoldMessenger.of(context).showSnackBar(
        errorSnackBar(context, 'Error al registrar asistencia', error: error),
      );
    }
  }

  Future<void> _onScanResult() async {
    if (widget.viewmodel.scanFingerprint.completed) {
      widget.viewmodel.scanFingerprint.clearResult();
      await _initializeCamera();

      if (mounted) {
        if (_controller != null) {
          try {
            final imageFile = await _controller!.takePicture();
            widget.viewmodel.register.execute(imageFile);
            // Dispose the camera after a while if it isn't used
            _debouncer.run(_disposeCamera);
          } on CameraException {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('No se pudo capturar imagen, se registrará asistencia sin imagen'),
              ),
            );
            widget.viewmodel.register.execute(null);
          }
        } else {
          widget.viewmodel.register.execute(null);
        }
      }
    }

    if (widget.viewmodel.scanFingerprint.error) {
      Future.delayed(const Duration(seconds: 2), () => widget.viewmodel.scanFingerprint.clearResult());
    }
  }

  Future<void> _initializeCamera() async { 
    if (kIsWeb) return;

    final cameras = await _getAvailableCameras;
    if (_controller == null) {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      await _controller!.initialize();
    }
  }

  void _disposeCamera() {
    if (_controller == null) {
      return;
    }

    _controller!.dispose();
    _controller = null;
  }

  @override
  void initState() {
    super.initState();
    widget.viewmodel.register.addListener(_onRegisterResult);
    widget.viewmodel.scanFingerprint.addListener(_onScanResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!kIsWeb) {
        _getAvailableCameras = availableCameras();
      }
    });
  }

  @override
  void didUpdateWidget(covariant AsistenciaScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.register.removeListener(_onRegisterResult);
    widget.viewmodel.register.addListener(_onRegisterResult);

    widget.viewmodel.scanFingerprint.removeListener(_onScanResult);
    widget.viewmodel.scanFingerprint.addListener(_onScanResult);
  }

  @override
  void dispose() {
    widget.viewmodel.dispose();
    _debouncer.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48.0),
              child: Flex(
                direction: .horizontal,
                children: [
                  // FECHA-HORA Y AVISOS
                  Flexible(
                    flex: 70,
                    fit: .tight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64.0),
                      child: Column(
                        mainAxisAlignment: .start,
                        mainAxisSize: .max,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'SISTEMA DE REGISTRO',
                            style: TextTheme.of(context).titleSmall?.copyWith(
                              color: primaryColor,
                              letterSpacing: 0.35,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '¡Bienvenido!',
                            style: TextTheme.of(context).displayLarge?.copyWith(
                              color: headingTextColor,
                              fontSize: 72,
                              fontWeight: .w900,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Clock(),
                          MotdList(viewmodel: widget.viewmodel),
                        ],
                      ),
                    ),
                  ),
                  // DIVIDER
                  Center(
                    child: Container(
                      width: 1,
                      height: 600,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: .topCenter,
                          end: .bottomCenter,
                          colors: [
                            Color(0xFFFDDEB0).withAlpha(0),
                            Color(0xFFFDDEB0),
                            Color(0xFFFDDEB0),
                            Color(0xFFFDDEB0).withAlpha(0),
                          ],
                          stops: [0, 0.3, 0.7, 1],
                        ),
                      ),
                    ),
                  ),
                  // LECTOR DE HUELLA
                  Flexible(
                    flex: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: .max,
                          crossAxisAlignment: .center,
                          spacing: 32,
                          children: [
                            Column(
                              spacing: 8,
                              children: [
                                Text(
                                  'Registra tu entrada',
                                  style: TextTheme.of(context).bodyMedium?.copyWith(
                                    color: headingTextColor,
                                    fontSize: 24,
                                    fontWeight: .w700,
                                  ),
                                  textAlign: .center,
                                ),
                                Text(
                                  'con tu huella y foto',
                                  style: TextTheme.of(context).bodyMedium?.copyWith(
                                    color: labelTextColor,
                                    fontWeight: .w500,
                                  ),
                                  textAlign: .center,
                                ),
                              ],
                            ),
                            FingerprintButton(
                              viewmodel: widget.viewmodel,
                            ),
                            Text(
                              'Si tienes problemas con el registro, contacta a Recursos Humanos.',
                              style: TextTheme.of(context).bodySmall?.copyWith(color: Color(0xFFC4A47A)),
                              textAlign: .center,
                            ),
                            if (kIsWeb)
                              Text.rich(
                                TextSpan(
                                  style: TextTheme.of(context).bodySmall?.copyWith(
                                    color: Color(0xFFC4A47A),
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: '¿Eres posición remota?\n',
                                    ),
                                    TextSpan(
                                      text: 'Registra tu asistencia aquí',
                                      style: TextTheme.of(context).bodySmall?.copyWith(color: primaryColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          final currentUser = widget.viewmodel.currentUser;
                                          if (currentUser != null && !currentUser.isRemote) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Lo sentimos pero no estás permitido para registrar tu asistencia remotamente.'),
                                              ),
                                            );
                                            return;
                                          }
        
                                          context.go(Routes.ingresoManual);
                                        },
                                    ),
                                  ],
                                ),
                                textAlign: .center,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Align(
            alignment: .bottomCenter,
            child: ScannerStatus(viewmodel: widget.viewmodel),
          ),
        ),
      ],
    );
  }
}
