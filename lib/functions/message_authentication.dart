import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';

class MessageAuthentication {
  static String genMAC(String message, String key) {
    Uint8List messageBytes = utf8.encode(message);
    Uint8List keyBytes = utf8.encode(key);

    Hmac mac = Hmac(sha256, keyBytes);
    return mac.convert(messageBytes).toString();
  }

  static bool checkMAC(String message, String key, String mac) {
    return genMAC(message, key) == mac;
  }
}
