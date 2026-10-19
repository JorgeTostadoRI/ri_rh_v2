import 'dart:async';
import 'dart:js_interop';
import 'dart:ui_web' as ui_web;

import 'package:cross_file/cross_file.dart';
import 'package:web/web.dart' as web;

import 'web_video_recorder.dart';

/// Mismo orden de preferencia de codec que ya usa `camera_web` (confirmado
/// que cubre bien Chrome/Firefox/Edge/Safari), y dentro de lo que acepta el
/// backend (`FileExtensionValidator(['webm', 'mp4'])` en
/// `ri_rh/models/incidencias.py`).
const _candidateMimeTypes = [
  'video/webm;codecs="vp9,opus"',
  'video/mp4',
  'video/webm',
];

const _getUserMediaRetryDelays = [Duration(seconds: 1), Duration(seconds: 2)];

// Red de seguridad para que stopRecording() nunca se quede esperando para
// siempre -- mas corta que el timeout externo de 15s que ya tiene
// video_testimonio_dialog.dart, asi que esta es la que entra en accion en
// la practica si el evento 'stop' del navegador nunca llega.
const _stopFallbackGrace = Duration(seconds: 5);

class WebVideoRecorderImpl implements WebVideoRecorder {
  WebVideoRecorderImpl() : _viewType = 'video-testimonio-recorder-${_nextId++}' {
    _videoElement = web.HTMLVideoElement()
      ..autoplay = true
      ..muted = true
      ..setAttribute('playsinline', '');
    _divElement = web.HTMLDivElement()
      ..style.setProperty('object-fit', 'cover')
      ..style.setProperty('height', '100%')
      ..style.setProperty('width', '100%')
      ..append(_videoElement);
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) => _divElement);
  }

  static int _nextId = 0;
  final String _viewType;
  late final web.HTMLVideoElement _videoElement;
  late final web.HTMLDivElement _divElement;

  web.MediaStream? _stream;
  web.MediaRecorder? _recorder;
  String? _mimeType;

  @override
  String get previewViewType => _viewType;

  @override
  Future<List<CameraOption>> open() async {
    final stream = await _getUserMediaWithRetry(video: true.toJS);
    _stream = stream;
    _videoElement.srcObject = stream;
    return _listCameras();
  }

  @override
  Future<void> switchCamera(String deviceId) async {
    final newStream = await _getUserMediaWithRetry(
      video: web.MediaTrackConstraints(
        deviceId: web.ConstrainDOMStringParameters(exact: deviceId.toJS),
      ),
    );
    _stopTracks(_stream);
    _stream = newStream;
    _videoElement.srcObject = newStream;
  }

  Future<List<CameraOption>> _listCameras() async {
    // El permiso ya se otorgo en open() -- a diferencia de camera_web, aqui
    // no hace falta ninguna llamada getUserMedia adicional por dispositivo
    // para que las etiquetas vengan pobladas.
    final devices = (await web.window.navigator.mediaDevices.enumerateDevices().toDart).toDart;
    return devices
        .where((d) => d.kind == 'videoinput')
        .map((d) => CameraOption(deviceId: d.deviceId, label: d.label.isEmpty ? 'Cámara' : d.label))
        .toList();
  }

  Future<web.MediaStream> _getUserMediaWithRetry({required JSAny video}) async {
    for (var attempt = 0; ; attempt++) {
      try {
        return await web.window.navigator.mediaDevices
            .getUserMedia(web.MediaStreamConstraints(video: video, audio: true.toJS))
            .toDart;
      } catch (e) {
        final mapped = _mapError(e);
        if (mapped.code != 'not-readable' || attempt >= _getUserMediaRetryDelays.length) {
          throw mapped;
        }
        await Future.delayed(_getUserMediaRetryDelays[attempt]);
      }
    }
  }

  WebVideoRecorderException _mapError(Object e) {
    // (e as JSAny?).isA<T>() en vez de `e is web.DOMException` -- un `is`
    // directo sobre un tipo de interop JS puede comportarse distinto entre
    // dart2js/dartdevc/dart2wasm, `isA` es la forma soportada de hacer este
    // chequeo de forma consistente.
    final asJS = e as JSAny?;
    final name = asJS.isA<web.DOMException>() ? (asJS as web.DOMException).name : '';
    switch (name) {
      case 'NotAllowedError':
        return const WebVideoRecorderException('permission-denied', 'Acceso a cámara denegado');
      case 'NotReadableError':
        return const WebVideoRecorderException(
          'not-readable',
          'La cámara no está disponible (en uso por otra app/pestaña)',
        );
      case 'NotFoundError':
        return const WebVideoRecorderException('not-found', 'No se encontró ninguna cámara');
      case 'OverconstrainedError':
        return const WebVideoRecorderException('overconstrained', 'La cámara seleccionada ya no está disponible');
      default:
        return WebVideoRecorderException('unknown', e.toString());
    }
  }

  String _pickSupportedMimeType() {
    for (final type in _candidateMimeTypes) {
      if (web.MediaRecorder.isTypeSupported(type)) return type;
    }
    throw const WebVideoRecorderException('unsupported-mime-type', 'El navegador no soporta grabar video');
  }

  @override
  void startRecording() {
    final stream = _stream;
    if (stream == null) {
      throw const WebVideoRecorderException('not-readable', 'La cámara no está lista');
    }
    final mimeType = _pickSupportedMimeType();
    _mimeType = mimeType;
    final recorder = web.MediaRecorder(stream, web.MediaRecorderOptions(mimeType: mimeType));
    _recorder = recorder;
    recorder.start();
  }

  @override
  Future<XFile> stopRecording() {
    // ignore: avoid_print
    print('[VideoDiag] stopRecording() llamado, recorder.state=${_recorder?.state}');
    final recorder = _recorder;
    if (recorder == null) {
      return Future.error(const WebVideoRecorderException('not-readable', 'No hay grabación en curso'));
    }

    final completer = Completer<XFile>();
    final chunks = <web.Blob>[];
    var finished = false;
    Timer? fallbackTimer;

    // finish() corre tanto desde los callbacks del navegador (onstop/
    // onerror, invocados directo por el navegador, fuera de cualquier
    // try/catch de Dart) como desde el timer de respaldo -- si algo adentro
    // truena sin este try/catch, se vuelve un error genuinamente sin
    // atrapar a nivel navegador (exactamente el bug reportado: salia
    // "Uncaught Error" en consola en vez de un mensaje manejado).
    void finish() {
      // ignore: avoid_print
      print('[VideoDiag] finish() invocado, finished=$finished chunks=${chunks.length}');
      if (finished) return;
      finished = true;
      try {
        fallbackTimer?.cancel();
        recorder.ondataavailable = null;
        recorder.onstop = null;
        recorder.onerror = null;

        if (chunks.isEmpty) {
          // ignore: avoid_print
          print('[VideoDiag] finish(): chunks vacio, completando con empty-recording');
          completer.completeError(
            const WebVideoRecorderException('empty-recording', 'La grabación no produjo datos'),
          );
          return;
        }
        final blob = web.Blob(chunks.toJS, web.BlobPropertyBag(type: _mimeType ?? 'video/webm'));
        // ignore: avoid_print
        print('[VideoDiag] finish(): blob armado, size=${blob.size}, leyendo arrayBuffer...');
        blob.arrayBuffer().toDart.then((buffer) {
          final bytes = buffer.toDart.asUint8List();
          // ignore: avoid_print
          print('[VideoDiag] finish(): arrayBuffer listo, bytes=${bytes.length}, completando XFile');
          completer.complete(XFile.fromData(bytes, mimeType: _mimeType, name: 'testimonio.webm'));
        }).catchError((Object e) {
          // ignore: avoid_print
          print('[VideoDiag] finish(): arrayBuffer().catchError -> $e');
          completer.completeError(WebVideoRecorderException('unknown', '$e'));
        });
      } catch (e) {
        // ignore: avoid_print
        print('[VideoDiag] finish(): catch -> $e');
        completer.completeError(_mapError(e));
      }
    }

    try {
      recorder.ondataavailable = ((web.Event e) {
        // Tambien blindado -- este callback lo invoca el navegador
        // directamente, un cast fallido aqui no debe tronar crudo.
        try {
          final blobEvent = e as web.BlobEvent;
          // ignore: avoid_print
          print('[VideoDiag] ondataavailable, size=${blobEvent.data.size}');
          if (blobEvent.data.size > 0) chunks.add(blobEvent.data);
        } catch (e) {
          // ignore: avoid_print
          print('[VideoDiag] ondataavailable cast catch -> $e');
        }
      }).toJS;
      recorder.onstop = ((web.Event _) {
        // ignore: avoid_print
        print('[VideoDiag] evento onstop recibido');
        finish();
      }).toJS;
      recorder.onerror = ((web.Event _) {
        // ignore: avoid_print
        print('[VideoDiag] evento onerror recibido');
        finish();
      }).toJS;

      // Mitigacion conocida para la inconsistencia de WebKit/Safari con el
      // evento 'stop' de MediaRecorder: forzar un volcado de los datos
      // justo antes de detener, para que aunque 'stop' nunca dispare ya
      // queden chunks utilizables en `chunks`.
      // ignore: avoid_print
      print('[VideoDiag] llamando requestData()...');
      recorder.requestData();
      // ignore: avoid_print
      print('[VideoDiag] requestData() OK, llamando stop()...');
      recorder.stop();
      // ignore: avoid_print
      print('[VideoDiag] stop() OK, armando fallbackTimer de ${_stopFallbackGrace.inSeconds}s');

      // Respaldo final: si ni 'stop' ni 'error' disparan nunca, arma el
      // video de todas formas con lo que haya llegado hasta este punto --
      // este es el bug exacto que se esta corrigiendo (antes dependia
      // unicamente del timeout externo de 15s del dialogo, sin ningun
      // intento de recuperar los datos ya grabados).
      fallbackTimer = Timer(_stopFallbackGrace, () {
        // ignore: avoid_print
        print('[VideoDiag] fallbackTimer disparo');
        finish();
      });
      // ignore: avoid_print
      print('[VideoDiag] fallbackTimer creado OK, saliendo del try de stopRecording()');
    } catch (e) {
      // requestData()/stop() pueden tronar sincronamente (ej.
      // InvalidStateError si el navegador considera que el grabador ya no
      // esta en estado "recording") -- sin este catch, esa excepcion se
      // escapaba cruda de stopRecording() en vez de completar el Future
      // con un WebVideoRecorderException manejable.
      // ignore: avoid_print
      print('[VideoDiag] catch en setup de stopRecording() -> $e');
      completer.completeError(_mapError(e));
    }

    return completer.future;
  }

  void _stopTracks(web.MediaStream? stream) {
    if (stream == null) return;
    for (final track in stream.getTracks().toDart) {
      track.stop();
    }
  }

  @override
  void dispose() {
    _stopTracks(_stream);
    _stream = null;
    _videoElement.srcObject = null;
    _recorder = null;
  }
}
