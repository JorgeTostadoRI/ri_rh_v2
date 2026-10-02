import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/domain/models/incidencias/incidencia.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:video_player/video_player.dart';

/// Duracion maxima de grabacion -- se detiene sola al llegar a este limite
/// en vez de depender unicamente de que el usuario la corte, para no
/// terminar con clips arbitrariamente largos (ver limite de subida en
/// `ri_project/settings.py`, FILE_UPLOAD_MAX_MEMORY_SIZE/DATA_UPLOAD_MAX_MEMORY_SIZE).
const _maxRecordingDuration = Duration(seconds: 60);

/// Dialogo para grabar (NUNCA subir un archivo ya existente) el video
/// testimonial que se requiere al crear una incidencia siendo un
/// solicitante remoto desde navegador -- sustituye ahi la verificacion por
/// huella digital. Mismo esqueleto que el `_CameraDialog` de
/// `ingreso_manual_screen.dart` (seleccion de camara, preview en vivo,
/// manejo de errores), pero grabando video en vez de tomar una foto, con un
/// paso de revision antes de confirmar.
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
  late Future<List<CameraDescription>> _availableCameras;
  CameraDescription? _currentCamera;
  CameraController? _controller;

  final ResolutionPreset _resolution = ResolutionPreset.medium;

  bool _recording = false;
  Timer? _maxDurationTimer;
  Duration _elapsed = Duration.zero;
  Timer? _elapsedTicker;

  // Una vez grabado, se entra al paso de revision -- el usuario puede
  // reproducirlo y decidir confirmarlo o volver a grabar antes de que se
  // adjunte a la incidencia.
  XFile? _recordedVideo;
  VideoPlayerController? _playbackController;

  Future<void> _initializeCamera() async {
    final cameras = await _availableCameras;
    _currentCamera ??= cameras[0];

    if (_controller == null) {
      _controller = CameraController(
        _currentCamera!,
        _resolution,
      );
      await _controller!.initialize();
    }
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _availableCameras = availableCameras();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCamera();
    });
  }

  @override
  void dispose() {
    _maxDurationTimer?.cancel();
    _elapsedTicker?.cancel();
    _controller?.dispose();
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

                return DropdownButtonFormField<CameraDescription>(
                  initialValue: _currentCamera,
                  items: snapshot.data!.map((camera) => DropdownMenuItem(value: camera, child: Text(camera.name))).toList(),
                  onChanged: (camera) async {
                    if (camera != null) {
                      await _controller?.dispose();
                      _currentCamera = camera;
                      _controller = CameraController(
                        _currentCamera!,
                        _resolution,
                      );
                      await _controller?.initialize();

                      if (mounted) {
                        setState(() {});
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
        onPressed: _controller == null ? null : (_recording ? _detenerGrabacion : _iniciarGrabacion),
        child: Text(_recording ? 'Detener' : 'Iniciar grabación'),
      ),
    ];
  }

  Widget _buildCameraPreview() {
    const double width = 500;
    const double height = 300;

    if (_controller == null) {
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
        child: CameraPreview(_controller!),
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
    if (e is CameraException) {
      if (e.code == 'CameraAccessDenied') {
        return ListTile(
          iconColor: Colors.red,
          leading: Icon(LucideIcons.circleX),
          title: Text('Acceso a cámara denegado'),
          subtitle: Text('Asegurate de permitir el uso de la cámara en el sitio y recargar.'),
        );
      }
      return ListTile(
        iconColor: Colors.red,
        leading: Icon(LucideIcons.circleX),
        title: Text(e.code),
        subtitle: Text(e.description ?? "Sin información adicional"),
      );
    }
    return ListTile(
      iconColor: Colors.red,
      leading: Icon(LucideIcons.circleX),
      title: Text('Error desconocido'),
      subtitle: Text(e.toString(), overflow: .ellipsis, maxLines: 2),
    );
  }

  void _iniciarGrabacion() async {
    try {
      await _controller!.startVideoRecording();
      _elapsed = Duration.zero;
      setState(() => _recording = true);

      _elapsedTicker = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() => _elapsed += const Duration(seconds: 1));
      });
      _maxDurationTimer = Timer(_maxRecordingDuration, _detenerGrabacion);
    } on CameraException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, e.description ?? 'No se pudo iniciar la grabación'),
        );
      }
    }
  }

  void _detenerGrabacion() async {
    _maxDurationTimer?.cancel();
    _elapsedTicker?.cancel();

    if (!_recording) return;

    try {
      final video = await _controller!.stopVideoRecording();
      final playback = VideoPlayerController.networkUrl(Uri.parse(video.path));
      await playback.initialize();

      if (mounted) {
        setState(() {
          _recording = false;
          _recordedVideo = video;
          _playbackController = playback;
        });
      }
    } on CameraException catch (e) {
      if (mounted) {
        setState(() => _recording = false);
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, e.description ?? 'No se pudo detener la grabación'),
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
