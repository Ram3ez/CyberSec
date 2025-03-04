import 'dart:math';

import 'package:cyber_sec/functions/miller_rabbin_test.dart';

BigInt generateRandomOdd(int bits) {
  final Random random = Random.secure();
  var bytes = List<int>.generate((bits / 8).ceil(), (_) => random.nextInt(256));
  bytes[0] |= 0x80;
  bytes[bytes.length - 1] |= 0x01;
  return BigInt.parse(
    bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(),
    radix: 16,
  );
}

BigInt generateLargePrime(int bits, int k) {
  while (true) {
    BigInt candidate = generateRandomOdd(bits);
    if (millerRabinTest(candidate, k: k)) return candidate;
  }
}
