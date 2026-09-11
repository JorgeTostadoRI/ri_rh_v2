import 'package:flutter/foundation.dart';
import 'package:ri_rh_v2/utils/command.dart';

abstract class FingerprintLoginController implements Listenable {
  Command1<void, Uint8List> get login;
  bool get scannerAvailable;
}
