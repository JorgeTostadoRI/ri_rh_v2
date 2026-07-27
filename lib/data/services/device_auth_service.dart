import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceAuthService {
  final _storage = const FlutterSecureStorage();
  final _algorithm = Ed25519();

  final _keyName = 'ri_rh_private_key';
  final _pubkeyKey = 'PUBKEY';

  /// Creates a new keypair for the Windows app if one does not exist.
  /// 
  /// Returns the public key if a keypair was created.
  Future<String?> initializeDevice() async {
    // Don't create a keypair for web;
    if (kIsWeb) {
      return null;
    }

    String? privateExistingKey = await _storage.read(key: _keyName);

    if (privateExistingKey == null) {
      final keyPair = await _algorithm.newKeyPair();
      final privKey = await keyPair.extractPrivateKeyBytes();
      final pubKey = await keyPair.extractPublicKey();

      await _savePubKey(base64.encode(pubKey.bytes));
      _storage.write(
        key: _keyName,
        value: base64.encode(privKey),
      );

      return base64.encode(pubKey.bytes);
    }

    // Already initialized a keypair before.
    return null;
  }

  /// Signs a payload using the device's private key
  Future<String> signPayload(String payload) async {
    String? privKeyBase64 = await _storage.read(key: _keyName);
    if (privKeyBase64 == null) {
      throw Exception('Device not initialized, ensure device was initialized');
    }

    final privKeyBytes = base64.decode(privKeyBase64);
    
    // Reconstruct keypair
    final keyPair = await _algorithm.newKeyPairFromSeed(privKeyBytes);
    final signature = await _algorithm.signString(payload, keyPair: keyPair);

    return base64.encode(signature.bytes);
  }

  Future<void> _savePubKey(String pubKey) async {
    final sharedPreferences = SharedPreferencesAsync();
    await sharedPreferences.setString(_pubkeyKey, pubKey);
  }
}