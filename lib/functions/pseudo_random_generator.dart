import 'dart:math';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class PseudoRandomGenerator {
  bool init = true;
  static final String key = "randomKey";
  static final List<int> hash = sha256.convert(utf8.encode(key)).bytes;
  // Use first 4 bytes of hash as an int
  static int seed = hash.sublist(0, 4).fold(0, (a, b) => (a << 8) + b);
  static int generate([int min = 0, int max = 100]) {
    //return Random().nextInt(max) + min;
    return Random.secure().nextInt(max - min) + min;
  }

  static int generateAscii(int min, int max) {
    seed = (1103515245 * seed + 12345) & 0x7fffffff;

    return (((seed / 0x7fffffff) * (max - min)) + min).toInt();
  }
}
