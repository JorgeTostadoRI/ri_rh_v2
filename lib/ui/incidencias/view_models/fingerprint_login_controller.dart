import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/utils/command.dart';

abstract class FingerprintLoginController implements Listenable {
  Command1<void, Uint8List> get login;
  bool get scannerAvailable;

  /// Solo mientras sea true se usa una huella escaneada para iniciar sesion
  /// -- lo activa/desactiva VerifyIdentityDialog mientras esta abierto. Sin
  /// esto, cualquier huella puesta en el lector con la pantalla abierta (ej.
  /// por costumbre del checador, a media captura del formulario) iniciaba
  /// sesion en silencio y despues ya no se pedia la huella al enviar.
  set acceptingScans(bool value);
}
