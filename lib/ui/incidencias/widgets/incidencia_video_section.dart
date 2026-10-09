import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:ri_rh_v2/data/services/logger/app_logger.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

/// Muestra el video testimonial adjunto a una incidencia (obligatorio solo
/// para solicitantes remotos, ver `video_testimonio_dialog.dart`) para que
/// quien la revisa (jefe directo / RH) lo pueda ver antes de aprobar.
///
/// Solo reproduce inline en web -- el paquete `video_player` no tiene
/// implementacion para Windows en este proyecto (ver pubspec.lock, solo
/// android/avfoundation/web), y esta seccion tambien se muestra en la app
/// de escritorio/kiosko cuando un jefe/RH revisa ahi una incidencia de un
/// remoto. En escritorio se deja un boton para abrirlo externamente, mismo
/// patron que ya usan los archivos adjuntos (`launchUrl`).
class IncidenciaVideoSection extends StatefulWidget {
  const IncidenciaVideoSection({
    super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<IncidenciaVideoSection> createState() => _IncidenciaVideoSectionState();
}

class _IncidenciaVideoSectionState extends State<IncidenciaVideoSection> {
  VideoPlayerController? _controller;
  Future<void>? _initialization;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      final controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      _controller = controller;
      _initialization = controller.initialize();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _abrirExterno() async {
    final logger = context.read<AppLogger>();
    try {
      await launchUrl(Uri.parse(widget.videoUrl));
    } catch (e, stackTrace) {
      logger.error('Failed to launch incidencia video URL', error: e, stackTrace: stackTrace);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Text('Video de verificación', style: textTheme.headlineSmall),
          if (!kIsWeb)
            OutlinedButton.icon(
              onPressed: _abrirExterno,
              icon: Icon(LucideIcons.externalLink),
              label: Text('Ver video'),
            )
          else
            _buildWebPlayer(),
        ],
      ),
    );
  }

  Widget _buildWebPlayer() {
    const double width = 500;
    const double height = 300;

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(
            width: width,
            height: height,
            child: Center(child: CircularProgressIndicator(color: primaryColor)),
          );
        }

        final controller = _controller;
        if (snapshot.hasError || controller == null) {
          return ListTile(
            iconColor: Colors.red,
            leading: Icon(LucideIcons.circleX),
            title: Text('No se pudo cargar el video'),
            trailing: IconButton(
              onPressed: _abrirExterno,
              icon: Icon(LucideIcons.externalLink),
              tooltip: 'Abrir en otra pestaña',
            ),
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
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
                IconButton(
                  iconSize: 48,
                  color: Colors.white,
                  icon: Icon(controller.value.isPlaying ? LucideIcons.pause : LucideIcons.play),
                  onPressed: () {
                    setState(() {
                      controller.value.isPlaying ? controller.pause() : controller.play();
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
