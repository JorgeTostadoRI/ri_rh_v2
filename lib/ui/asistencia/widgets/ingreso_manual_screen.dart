import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:ri_rh_v2/config/app_error.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/data/services/api/api_error_codes.dart';
import 'package:ri_rh_v2/ui/asistencia/view_models/ingreso_manual_viewmodel.dart';
import 'package:ri_rh_v2/ui/core/themes/app_theme_provider.dart';
import 'package:ri_rh_v2/ui/core/ui/command_button.dart';
import 'package:ri_rh_v2/ui/core/ui/confirm_action_dialog.dart';
import 'package:ri_rh_v2/ui/core/ui/elevated_container.dart';
import 'package:ri_rh_v2/ui/core/ui/page_header.dart';
import 'package:ri_rh_v2/ui/core/ui/snack_bar.dart';
import 'package:ri_rh_v2/utils/result.dart' as result;

class IngresoManualScreen extends StatefulWidget {
  const IngresoManualScreen({
    super.key,
    required this.viewmodel,
  });

  final IngresoManualViewmodel viewmodel;

  @override
  State<IngresoManualScreen> createState() => _IngresoManualScreenState();
}

class _IngresoManualScreenState extends State<IngresoManualScreen> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  XFile? _photo;

  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
    widget.viewmodel.register.addListener(_onRegister);
  }

  @override
  void didUpdateWidget(covariant IngresoManualScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.viewmodel.register.removeListener(_onRegister);
    widget.viewmodel.register.addListener(_onRegister);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final viewmodel = widget.viewmodel;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          spacing: 32,
          crossAxisAlignment: .start,
          children: [
            PageHeader(
              title: 'Ingreso Manual',
              showBackButton: true,
            ),
            ElevatedContainer(
              child: Form(
                key: _formKey,
                child: Builder(
                  builder: (context) {
                    final currentUser = viewmodel.currentUser;

                    if (currentUser != null) {
                      return Column(
                        crossAxisAlignment: .start,
                        spacing: 24,
                        children: [
                          Text(
                            '¡Hola ${currentUser.nombre}!',
                            style: textTheme.headlineMedium,
                          ),
                          Text(
                            'Se ha validado tu sesión, solo necesitamos tu foto.',
                            style: textTheme.labelLarge,
                          ),
                          _buildCameraButton(context),
                          Align(
                            alignment: .bottomEnd,
                            child: CommandButton.icon(
                              command: widget.viewmodel.register,
                              onPressed: _registerForUser,
                              icon: Icon(LucideIcons.circleCheck),
                              label: Text('Registrar'),
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      spacing: 24,
                      children: [
                        if (kIsWeb)
                          Row(
                            spacing: 12,
                            children: [
                              Icon(LucideIcons.circleQuestionMark, color: primaryColor),
                              Text(
                                'Solo podrás realizar el registro de tu asistencia si te asignaron como usuario remoto.',
                                style: textTheme.labelLarge,
                              )
                            ],
                          ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'USUARIO',
                          ),
                          controller: _username,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo es requerido';
                            }
                            return null;
                          },
                          textInputAction: .next,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'CONTRASEÑA',
                            suffixIcon: IconButton(
                              icon: hidePassword
                                ? const Icon(LucideIcons.eye)
                                : const Icon(LucideIcons.eyeOff),
                              onPressed: () => setState(() => hidePassword = !hidePassword),
                            ),
                          ),
                          controller: _password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo es requerido';
                            }
                            return null;
                          },
                          obscureText: hidePassword,
                          textInputAction: .done,
                          onFieldSubmitted: (_) => _submit(),
                        ),
                        _buildCameraButton(context),
                        Align(
                          alignment: .bottomEnd,
                          child: CommandButton.icon(
                            command: viewmodel.register,
                            onPressed: _submit,
                            icon: Icon(LucideIcons.circleCheck),
                            label: Text('Registrar'),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraButton(BuildContext context) {
    if (_photo == null) {
      return Align(
        alignment: .centerStart,
        child: OutlinedButton.icon(
          onPressed: () async {
            final photo = await showDialog<XFile?>(
              context: context,
              builder: (context) => _CameraDialog(),
            );
            if (photo != null) {
              setState(() => _photo = photo);
            }
          },
          icon: Icon(LucideIcons.camera),
          label: Text('Tomar foto')
        ),
      );
    }
    
    return Align(
      alignment: .centerStart,
      child: OutlinedButton.icon(
        onPressed: () async {
          final deletePhoto = await showDialog<bool?>(
            context: context,
            builder: (context) => ConfirmActionDialog(
              content: Text('¿Deseas eliminar la foto? Podrás capturarla nuevamente.'),
            ),
          ) ?? false;
          if (deletePhoto) {
            setState(() => _photo = null);
          }
        },
        icon: Icon(LucideIcons.check),
        label: Text('Foto capturada'),
      ),
    );
  }

  // When the user has filled out the login form
  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_photo == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Requerimos una foto para registrar tu asistencia'),
          ),
        );
        return;
      }

      final RegisterParams params = (
        username: _username.text,
        password: _password.text,
        photo: _photo!,
      );
      widget.viewmodel.register.execute(params);
    }

  }

  // When the user was already authenticated previously
  void _registerForUser() {
    if (_photo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Requerimos una foto para registrar tu asistencia'),
        ),
      );
      return;
    }

    final RegisterParams params = (
      username: '',
      password: '',
      photo: _photo!,
    );
    widget.viewmodel.register.execute(params);
  }

  void _onRegister() {
    if (widget.viewmodel.register.completed) {
      widget.viewmodel.register.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se registró tu asistencia')),
      );
      context.pop();
    }
    else if (widget.viewmodel.register.error) {
      final error = (widget.viewmodel.register.result as result.Error).error;
      widget.viewmodel.register.clearResult();

      if (error is LoginError) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No se pudo iniciar sesión, verifica tus credenciales e intenta de nuevo'),
        );
      } else if (error is NoRemoteAllowed) {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'No puedes registrar tu asistencia remotamente'),
        );
      } else if (error is ApiException && error.errorCode == ApiErrorCodes.lateEntry) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Fuera de Horario'),
              content: Text(
                'No se ha registrado tu entrada debido a que intentaste registrar fuera de tu hora permitida de entrada. '
                'Ten en cuenta que tienes 10 minutos de gracia para tu entrada. '
                'No laboré hoy porque NO se le dará compensación por el trabajo.'
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
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          errorSnackBar(context, 'Algo salió mal al intentar registrar tu asistencia', error: error),
        );
      }
    }
  }
}

class _CameraDialog extends StatefulWidget {
  const _CameraDialog();

  @override
  State<_CameraDialog> createState() => _CameraDialogState();
}

class _CameraDialogState extends State<_CameraDialog> {
  CameraController? _controller;

  Future<void> _initializeCamera() async { 
    final cameras = await availableCameras();
    if (_controller == null) {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      await _controller!.initialize();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCamera();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return AlertDialog(
      title: Text('Fotografía'),
      content: Column(
        mainAxisSize: .min,
        spacing: 24,
        children: [
          Text(
            'Requerimos una foto tuya para completar el registro de tu asistencia, ¡sonríe!',
            style: textTheme.bodyMedium,
          ),
          _buildPreview(),
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () => context.pop(),
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _controller == null ? null : _capturePhoto,
          child: Text('Capturar')
        ),
      ],
    );
  }

  Widget _buildPreview() {
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

  void _capturePhoto() async {
    if (context.mounted) {
      final photo = await _controller!.takePicture();
      // ignore: use_build_context_synchronously
      context.pop(photo);
    }
  }
}