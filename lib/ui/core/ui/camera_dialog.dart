import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/asistencia/widgets/image_preview.dart';

class CameraDialog extends StatefulWidget {
  const CameraDialog({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  State<CameraDialog> createState() => _CameraDialogState();
}

class _CameraDialogState extends State<CameraDialog> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? _image;

  Future<void> takePictureHandler() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller.takePicture();

      setState(() => _image = image);
    } on Exception catch(error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AlertDialog(
            constraints: const BoxConstraints(maxWidth: 800),
            contentPadding: const EdgeInsets.all(32),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: .min,
              spacing: 20,
              children: [
                if (_image == null)
                  SizedBox(
                    width: 400,
                    child: CameraPreview(_controller),
                  ),
                if (_image != null)
                  ImagePreview(
                    width: 400,
                    image: _image!,
                  ),
                Row(
                  spacing: 20,
                  mainAxisSize: .min,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                    if (_image == null)
                      ElevatedButton.icon(
                        onPressed: takePictureHandler,
                        icon: Icon(LucideIcons.camera),
                        label: Text('Tomar foto'),
                      ),
                    if (_image != null)
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pop(context, _image!),
                        icon: Icon(LucideIcons.check),
                        label: Text('Registrar'),
                      ),
                  ],
                ),
              ],
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      }
    );
  }
}