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

  // Capturado una sola vez: AsistenciaViewmodel guarda el candado
  // _awaitingRegistration y el match de huella en curso. Si el router
  // reconstruye esta ruta a medio flujo (ej. refreshListenable de GoRouter
  // al llamar loginViaChallenge a medio registro), widget.viewmodel pasaría
  // a apuntar a una instancia nueva sin ese candado activo — reabriendo la
  // condición de carrera entre huella y foto que ya se había cerrado. Usar
  // siempre esta misma instancia lo evita.
  late final AsistenciaViewmodel _viewmodel;

  void _onRegisterResult() {
    if (_viewmodel.register.completed) {
      Future.delayed(const Duration(seconds: 2), () => _viewmodel.register.clearResult());
    }

    if (_viewmodel.register.error) {
      final error = (_viewmodel.register.result as result.Error).error;
      Future.delayed(const Duration(seconds: 2), () => _viewmodel.register.clearResult());

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
    if (_viewmodel.scanFingerprint.completed) {
      _viewmodel.scanFingerprint.clearResult();

      XFile? imageFile;
      var cameraFailed = false;
      try {
        await _initializeCamera();
        if (_controller != null) {
          imageFile = await _controller!.takePicture();
          // Dispose the camera after a while if it isn't used
          _debouncer.run(_disposeCamera);
        }
      } catch (e) {
        // Cubre tanto fallas al inicializar la cámara (sin cámaras
        // detectadas, ocupada, sin driver) como fallas al tomar la foto.
        // Antes solo la segunda tenía manejo de error — una falla al
        // inicializar quedaba sin capturar y el registro nunca se
        // completaba, sin ningún aviso para quien estaba escaneando.
        cameraFailed = true;
      }

      if (mounted) {
        if (cameraFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No se pudo capturar imagen, se registrará asistencia sin imagen'),
            ),
          );
        }
        _viewmodel.register.execute(imageFile);
      }
    }

    if (_viewmodel.scanFingerprint.error) {
      Future.delayed(const Duration(seconds: 2), () => _viewmodel.scanFingerprint.clearResult());
    }
  }

  Future<void> _initializeCamera() async {
    if (kIsWeb) return;
    if (_controller != null) return;

    final cameras = await _getAvailableCameras;
    if (cameras.isEmpty) {
      throw CameraException('noCamerasAvailable', 'No se detectaron cámaras disponibles');
    }

    final controller = CameraController(cameras[0], ResolutionPreset.medium);
    try {
      await controller.initialize();
    } catch (_) {
      // Se descarta el controlador a medio inicializar para que el
      // siguiente intento vuelva a intentar desde cero, en vez de quedar
      // atascado permanentemente con una cámara rota hasta reiniciar la app.
      await controller.dispose();
      rethrow;
    }
    _controller = controller;
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
    _viewmodel = widget.viewmodel;
    _viewmodel.register.addListener(_onRegisterResult);
    _viewmodel.scanFingerprint.addListener(_onScanResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!kIsWeb) {
        _getAvailableCameras = availableCameras();
      }
    });
  }

  @override
  void didUpdateWidget(covariant AsistenciaScreen oldWidget) {
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
    _viewmodel.register.removeListener(_onRegisterResult);
    _viewmodel.scanFingerprint.removeListener(_onScanResult);
    _viewmodel.dispose();
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
                          MotdList(viewmodel: _viewmodel),
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
                              viewmodel: _viewmodel,
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
                                          final currentUser = _viewmodel.currentUser;
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
            child: ScannerStatus(viewmodel: _viewmodel),
          ),
        ),
      ],
    );
  }
}
