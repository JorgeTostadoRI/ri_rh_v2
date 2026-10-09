import 'package:cross_file/cross_file.dart';

import 'web_video_recorder.dart';

/// Se selecciona para cualquier target que no sea web (ver
/// `web_video_recorder_factory.dart`). Nunca se alcanza en la practica --
/// `VideoTestimonioDialog` solo se construye tras un chequeo `kIsWeb` en
/// `incidencia_form.dart` -- pero el split condicional es obligatorio de
/// todas formas: `dart:js_interop`/`package:web` no existen como target de
/// compilacion para plataformas nativas (Windows, etc.), asi que un import
/// sin condicionar rompe esos builds aunque nunca se use en tiempo de
/// ejecucion.
class WebVideoRecorderImpl implements WebVideoRecorder {
  Never _unsupported() => throw UnsupportedError(
    'WebVideoRecorder solo esta disponible compilando para web',
  );

  @override
  String get previewViewType => _unsupported();

  @override
  Future<List<CameraOption>> open() => _unsupported();

  @override
  Future<void> switchCamera(String deviceId) => _unsupported();

  @override
  void startRecording() => _unsupported();

  @override
  Future<XFile> stopRecording() => _unsupported();

  @override
  void dispose() {}
}
