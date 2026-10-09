import 'package:cross_file/cross_file.dart';

/// Contrato para grabar un video testimonial desde la camara del navegador,
/// sin pasar por los paquetes `camera`/`camera_web` -- ver
/// `video_testimonio_dialog.dart` para el porque (esos paquetes fallan de
/// forma reproducible en ciertos webcams: `availableCameras()` hace varias
/// llamadas `getUserMedia` seguidas que algunos drivers no toleran, y
/// `stopVideoRecording()` depende por completo de un evento del navegador
/// que a veces nunca llega).
///
/// Sin implementacion para plataformas que no sean web -- ver
/// `web_video_recorder_factory.dart`/`web_video_recorder_stub.dart`. Nunca
/// se usa fuera de web porque `VideoTestimonioDialog` solo se construye tras
/// un chequeo `kIsWeb` en `incidencia_form.dart`.
abstract interface class WebVideoRecorder {
  /// viewType ya registrado para mostrar el preview en vivo via
  /// `HtmlElementView(viewType: previewViewType)` -- unico para la vida de
  /// esta instancia, un cambio de camara solo reemplaza el `srcObject` del
  /// mismo elemento `<video>`, nunca se vuelve a registrar.
  String get previewViewType;

  /// Pide la camara/microfono por defecto (una sola llamada a
  /// `getUserMedia`) y arranca el preview en vivo. Lista las demas camaras
  /// disponibles llamando `enumerateDevices()` DESPUES de ya tener permiso
  /// -- sus nombres ya vienen poblados sin necesitar una llamada
  /// `getUserMedia` adicional por dispositivo (a diferencia de
  /// `camera_web`, que es justo lo que rompe en ciertos webcams).
  Future<List<CameraOption>> open();

  /// Cambia a la camara indicada -- una sola llamada `getUserMedia` nueva,
  /// iniciada por el usuario (nunca automatica/en cadena).
  Future<void> switchCamera(String deviceId);

  /// Arranca a grabar sobre el stream ya activo (debe llamarse despues de
  /// [open]).
  void startRecording();

  /// Detiene la grabacion y regresa el clip grabado. Nunca se queda
  /// esperando para siempre aunque el navegador no dispare el evento
  /// `'stop'` del grabador -- ver implementacion web para el mecanismo de
  /// respaldo.
  Future<XFile> stopRecording();

  /// Libera camara/microfono y cualquier recurso del grabador. Idempotente.
  void dispose();
}

/// Una camara disponible, para mostrar en el selector.
class CameraOption {
  const CameraOption({required this.deviceId, required this.label});

  final String deviceId;
  final String label;
}

/// Error de [WebVideoRecorder]. `code` es uno de:
/// 'permission-denied' | 'not-readable' | 'not-found' | 'overconstrained' |
/// 'unsupported-mime-type' | 'empty-recording' | 'unknown'.
class WebVideoRecorderException implements Exception {
  const WebVideoRecorderException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => message;
}
