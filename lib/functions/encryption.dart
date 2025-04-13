import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';

class Encryption {
  static final String _password = "randomPass";

  static Key generateKey(String password) {
    var keyBytes = sha256.convert(utf8.encode(password)).bytes;
    return Key(Uint8List.fromList(keyBytes));
  }

  static String encrypt(String plainText) {
    final key = generateKey(_password);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    return base64.encode(iv.bytes + encrypted.bytes);
  }

  static String decrypt(String encryptedText) {
    final key = generateKey(_password);
    final data = base64.decode(encryptedText);
    final iv = IV(Uint8List.fromList(data.sublist(0, 16)));
    final encryptedBytes = Encrypted(Uint8List.fromList(data.sublist(16)));

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(encryptedBytes, iv: iv);

    return decrypted;
  }
}
