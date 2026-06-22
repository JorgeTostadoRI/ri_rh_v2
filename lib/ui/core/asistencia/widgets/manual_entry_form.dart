import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/ui/core/asistencia/view_models/asistencia_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/utils/result.dart';

class ManualEntryForm extends StatefulWidget {
  const ManualEntryForm({
    super.key,
    required this.camera,
    required this.viewmodel,
  });

  final CameraDescription camera;
  final AsistenciaViewmodel viewmodel;

  @override
  State<ManualEntryForm> createState() => _ManualEntryFormState();
}

class _ManualEntryFormState extends State<ManualEntryForm> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  XFile? _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future<void> takePictureHandler() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller.takePicture();

      setState(() => _image = image);
    } on Exception catch(error) {
      // If an error occurs, log the error to the console.
      print(error);
    }
  }

  Future<Result<void>> confirmEntryHandler() async {
    setState(() => _loading = true);
    final result = await widget.viewmodel.registerManualEntry(_image!);

    switch(result) {
      case Ok():
        Navigator.pop(context);
      case Error():
        print(result.error);
    }

    setState(() => _loading = false);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final primaryButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
      shadowColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      textStyle: TextStyle(
        fontWeight: .w700,
        fontSize: 14,
      ),
    );

    final secondaryButtonStyle = TextButton.styleFrom(
      foregroundColor: labelTextColor,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: labelTextColor,
        ),
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      textStyle: TextStyle(
        fontWeight: .w700,
        fontSize: 14,
      ),
    );

    final textFieldDecoration = InputDecoration(
      fillColor: Color(0xFFFDFBF7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Color(0xFFF5E8D8),
        ),
      )
    );

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Material(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100,),
                color: Color(0xFFFDF6EE),
                child: Column(
                  spacing: 20.0,
                  children: [
                    Align(
                      alignment: .topStart,
                      child: Text(
                        'Registro manual de ingreso',
                        style: TextTheme.of(context).headlineLarge?.copyWith(
                          fontWeight: .w900,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        spacing: 20,
                        children: [
                          if (_image == null)
                            SizedBox(
                              width: 400,
                              height: 350,
                              child: CameraPreview(_controller),
                            ),
                          if (_image != null)
                            SizedBox(
                              width: 400,
                              height: 350,
                              child: Image.network(_image!.path),
                            ),
                          Align(
                            alignment: .topStart,
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Nombre de usuario',
                                  style: TextTheme.of(context).labelLarge?.copyWith(
                                    color: Color(0xFF2D1E0F),
                                    fontWeight: .bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextField(
                                  controller: usernameController,
                                  decoration: textFieldDecoration,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: .topStart,
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  'Contraseña',
                                  style: TextTheme.of(context).labelLarge?.copyWith(
                                    color: Color(0xFF2D1E0F),
                                    fontWeight: .bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: textFieldDecoration,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              ElevatedButton(
                                style: primaryButtonStyle,
                                onPressed: takePictureHandler,
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Icon(LucideIcons.camera),
                                    Text('Tomar foto'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: .center,
                            spacing: 20,
                            children: [
                              TextButton(
                                style: secondaryButtonStyle,
                                onPressed: () => Navigator.pop(context),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Icon(LucideIcons.x),
                                    Text('Cancelar'),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: primaryButtonStyle,
                                onPressed: usernameController.text.isNotEmpty && passwordController.text.isNotEmpty && _image != null && !_loading ? confirmEntryHandler : null,
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Icon(LucideIcons.check),
                                    Text('Registrar'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}