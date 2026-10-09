import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/video_testimonio/web_video_recorder.dart';
import 'package:ri_rh_v2/ui/incidencias/widgets/video_testimonio/web_video_recorder_factory.dart';
import 'package:video_player/video_player.dart';

/// Duracion maxima de grabacion -- se detiene sola al llegar a este limite
/// en vez de depender unicamente de que el usuario la corte, para no
/// terminar con clips arbitrariamente largos (ver limite de subida en
/// `ri_project/settings.py`, FILE_UPLOAD_MAX_MEMORY_SIZE/DATA_UPLOAD_MAX_MEMORY_SIZE).
const _maxRecordingDuration = Duration(seconds: 60);

/// Dialogo para grabar (NUNCA subir un archivo ya existente) el video
/// testimonial que se requiere al crear una incidencia siendo un
/// solicitante remoto desde navegador -- sustituye ahi la verificacion por
/// huella digital.
///
/// Habla directo con el navegador vía [WebVideoRecorder] (`dart:js_interop`
/// + `package:web`) en vez de usar los paquetes `camera`/`camera_web` --
/// esos paquetes fallaban de forma reproducible en ciertos webcams:
/// `availableCameras()` hace varias llamadas `getUserMedia` seguidas que
/// algunos drivers no toleran (sale `cameraNotReadable` aunque la camara
/// funcione perfecto en cualquier otro programa), y su
/// `stopVideoRecording()` depende por completo de que el navegador dispare
/// un evento que a veces nunca llega, dejando la grabacion "guardando"
/// para siempre sin ningun recurso.
class VideoTestimonioDialog extends StatefulWidget {
  const VideoTestimonioDialog({
    super.key,
    required this.category,
  });

  final IncidenciaCategory category;

  @override
  State<VideoTestimonioDialog> createState() => _VideoTestimonioDialogState();
}

class _VideoTestimonioDialogState extends State<VideoTestimonioDialog> {
  late final WebVideoRecorder _recorder;
  late Future<List<CameraOption>> _availableCameras;
  String? _currentDeviceId;
  bool _cameraReady = false;

  bool _recording = false;
  // Evita que _detenerGrabacion se ejecute dos veces en paralelo -- ej. el
  // usuario toca "Detener" justo cuando el timer de maxima duracion tambien
  // dispara, o hace doble-tap.
  bool _stopping = false;
  Timer? _maxDurationTimer;
  Duration _elapsed = Duration.zero;
  Timer? _elapsedTicker;

  // Una vez grabado, se entra al paso de revision -- el usuario puede
  // reproducirlo y decidir confirmarlo o volver a grabar antes de que se
  // adjunte a la incidencia.
  XFile? _recordedVideo;
  VideoPlayerController? _playbackController;

  Future<List<CameraOption>> _openCamera() async {
    final cameras = await _recorder.open();
    if (mounted) setState(() => _cameraReady = true);
    return cameras;
  }

  @override
  void initState() {
    super.initState();
    _recorder = createWebVideoRecorder();
    _availableCameras = _openCamera();
  }

  @override
  void dispose() {
    _maxDurationTimer?.cancel();
    _elapsedTicker?.cancel();
    _recorder.dispose();
    _playbackController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return AlertDialog(
      title: Text('Video de verificación'),
      content: Column(
        mainAxisSize: .min,
        spacing: 24,
        children: [
          Text(
            'Grábate diciendo tu nombre completo, que estás solicitando un(a) '
            '${widget.category.label} y el motivo de tu solicitud.',
            style: textTheme.bodyMedium,
          ),
          if (_recordedVideo != null)
            _buildPlaybackPreview()
          else if (_stopping)
            // Mientras se detiene la grabacion y se prepara la vista previa
            // (stopRecording + playback.initialize, ver _detenerGrabacion)
            // la camara ya no esta en vivo -- sin este indicador la
            // pantalla se queda viendo el ultimo frame congelado sin
            // ninguna señal de que sigue trabajando.
            _buildSavingIndicator()
          else
            _buildCameraPreview(),
          if (_recording)
            Text(
              '${_elapsed.inMinutes.toString().padLeft(2, '0')}:${(_elapsed.inSeconds % 60).toString().padLeft(2, '0')} / '
              '${_maxRecordingDuration.inMinutes.toString().padLeft(2, '0')}:${(_maxRecordingDuration.inSeconds % 60).toString().padLeft(2, '0')}',
              style: textTheme.bodySmall,
            ),
          if (_recordedVideo == null && !_recording)
            FutureBuilder(
              future: _availableCameras,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox.shrink();
                }

                if (snapshot.hasError) {
                  return _buildErrorDescription(snapshot.error);
                }

                final cameras = snapshot.data!;
                if (cameras.length <= 1) {
                  // Solo una camara (o ninguna reportada todavia por el
                  // navegador) -- no tiene caso mostrar un selector con un
                  // solo elemento.
                  return SizedBox.shrink();
                }

                return DropdownButtonFormField<CameraOption>(
                  initialValue: cameras.firstWhere(
                    (c) => c.deviceId == _currentDeviceId,
                    orElse: () => cameras.first,
                  ),
                  items: cameras.map((camera) => DropdownMenuItem(value: camera, child: Text(camera.label))).toList(),
                  onChanged: (camera) async {
                    if (camera == null) return;
                    try {
                      await _recorder.switchCamera(camera.deviceId);
                      _currentDeviceId = camera.deviceId;
                      if (mounted) {
                        setState(() {});
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar(context, 'No se pudo cambiar de cámara'),
                        );
                      }
                    }
                  },
                );
              },
            ),
        ],
      ),
      actions: _buildActions(),
    );
  }

  List<Widget> _buildActions() {
    if (_recordedVideo != null) {
      return [
        OutlinedButton(
          onPressed: _volverAGrabar,
          child: Text('Volver a grabar'),
        ),
        ElevatedButton(
          onPressed: () => context.pop(_recordedVideo),
          child: Text('Usar este video'),
        ),
      ];
    }

    return [
      OutlinedButton(
        onPressed: () => context.pop(),
        child: Text('Cancelar'),
      ),
      ElevatedButton(
        onPressed: !_cameraReady || _stopping ? null : (_recording ? _detenerGrabacion : _iniciarGrabacion),
        child: Text(_recording ? 'Detener' : 'Iniciar grabación'),
      ),
    ];
  }

  Widget _buildSavingIndicator() {
    const double width = 500;
    const double height = 300;

    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(BorderSide(
          color: borderColor,
          width: 0.8,
        )),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 16,
          children: [
            CircularProgressIndicator(color: primaryColor),
            Text('Guardando video...'),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraPreview() {
    const double width = 500;
    const double height = 300;

    if (!_cameraReady) {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide(
            color: borderColor,
            width: 0.8,
          )),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Center(child: CircularProgressIndicator(color: primaryColor)),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: HtmlElementView(viewType: _recorder.previewViewType),
      ),
    );
  }

  Widget _buildPlaybackPreview() {
    const double width = 500;
    const double height = 300;

    final playback = _playbackController;
    if (playback == null || !playback.value.isInitialized) {
      return SizedBox(
        width: width,
        height: height,
        child: Center(child: CircularProgressIndicator(color: primaryColor)),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          alignment: .center,
          children: [
            AspectRatio(
              aspectRatio: playback.value.aspectRatio,
              child: VideoPlayer(playback),
            ),
            IconButton(
              iconSize: 48,
              color: Colors.white,
              icon: Icon(playback.value.isPlaying ? LucideIcons.pause : LucideIcons.play),
              onPressed: () {
                setState(() {
                  playback.value.isPlaying ? playback.pause() : playback.play();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorDescription(Object? e) {
    final String title;
    final String subtitle;
    if (e is WebVideoRecorderException) {
      if (e.code == 'permission-denied') {
        title = 'Acceso a cámara denegado';
        subtitle = 'Asegurate de permitir el uso de la cámara en el sitio y recargar.';
      } else {
        // Ej. not-readable -- la camara esta ocupada por otra pestaña/app.
        // Es transitorio casi siempre, asi que se deja reintentar en vez de
        // forzar a cerrar todo el formulario y volver a entrar.
        title = e.code;
        subtitle = e.message;
      }
    } else {
      title = 'Error desconocido';
      subtitle = e.toString();
    }

    return Column(
      mainAxisSize: .min,
      children: [
        ListTile(
          iconColor: Colors.red,
          leading: Icon(LucideIcons.circleX),
          title: Text(title),
          subtitle: Text(subtitle, overflow: .ellipsis, maxLines: 2),
        ),
        OutlinedButton.icon(
          onPressed: _reintentarCamara,
          icon: Icon(LucideIcons.rotateCcw),
          label: Text('Reintentar'),
        ),
      ],
    );
  }

  void _reintentarCamara() {
    setState(() {
      _cameraReady = false;
      _availableCameras = _openCamera();
    });
  }

  void _iniciarGrabacion() {
    try {
      _recorder.startRecording();
      _elapsed = Duration.zero;
      setState(() => _recording = true);

      _elapsedTicker = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() => _elapsed += const Duration(seconds: 1));
      });
      _maxDurationTimer = Timer(_maxRecordingDuration, _detenerGrabacion);
    } on WebVideoRecorderException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, e.message),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo iniciar la grabación'),
        );
      }
    }
  }

  void _detenerGrabacion() async {
    // Debe quedar antes de cualquier `await` -- Dart corre este prefijo
    // sincrono de un tiron, asi que ninguna otra invocacion concurrente
    // (doble-tap, o el timer de maxima duracion disparando casi al mismo
    // tiempo) puede colarse entre el check y el cancel/set de abajo.
    if (!_recording || _stopping) return;
    _maxDurationTimer?.cancel();
    _elapsedTicker?.cancel();
    setState(() => _stopping = true);

    // Con stop+preview envueltos en un timeout, un fallo silencioso
    // preparando la vista previa (ej. el blob del video grabado nunca
    // dispara "loadedmetadata") ya no deja el dialogo congelado para
    // siempre sin ningun aviso -- a los 15s se cae a un error con opcion de
    // volver a intentar. stopRecording() en si ya tiene su propia red de
    // seguridad interna de 5s (ver web_video_recorder_web.dart), asi que
    // este timeout de aqui rara vez deberia llegar a activarse.
    VideoPlayerController? playback;
    try {
      final video = await _recorder.stopRecording().timeout(const Duration(seconds: 15));
      playback = VideoPlayerController.networkUrl(Uri.parse(video.path));
      await playback.initialize().timeout(const Duration(seconds: 15));

      if (mounted) {
        setState(() {
          _recording = false;
          _stopping = false;
          _recordedVideo = video;
          _playbackController = playback;
        });
      }
    } on WebVideoRecorderException catch (e) {
      if (mounted) {
        setState(() {
          _recording = false;
          _stopping = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, e.message),
        );
      }
    } on TimeoutException catch (_) {
      await playback?.dispose();
      if (mounted) {
        setState(() {
          _recording = false;
          _stopping = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo preparar la vista previa del video -- intenta grabar de nuevo'),
        );
      }
    } catch (e) {
      // Red de seguridad final -- cualquier otro tipo de error no
      // contemplado arriba (ej. video_player al inicializar el preview con
      // VideoPlayerController.initialize(), que puede tronar con otros
      // tipos de excepcion) tambien debe quedar manejado aqui, en vez de
      // escaparse como un error sin atrapar hacia la consola del navegador.
      await playback?.dispose();
      if (mounted) {
        setState(() {
          _recording = false;
          _stopping = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo terminar de grabar el video -- intenta de nuevo'),
        );
      }
    }
  }

  void _volverAGrabar() {
    _playbackController?.dispose();
    setState(() {
      _recordedVideo = null;
      _playbackController = null;
    });
  }
}
