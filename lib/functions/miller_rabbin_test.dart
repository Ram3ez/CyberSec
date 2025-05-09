import 'dart:math';

class MillerRabbinTest {
  static bool test(BigInt n, {int k = 1}) {
    if (n < BigInt.from(2)) return false;
    if (n == BigInt.from(2) || n == BigInt.from(3)) return true;
    if (n % BigInt.from(2) == BigInt.from(0)) return false;

    int r = 0;
    BigInt d = n - BigInt.from(1);
    while (d % BigInt.from(2) == BigInt.from(0)) {
      d ~/= BigInt.from(2);
      r++;
    }

    var rand = Random();

    for (int i = 0; i < k; i++) {
      BigInt a = BigInt.from(2 + rand.nextInt(1000));
      BigInt x = a.modPow(d, n);

      if (x == BigInt.from(1) || x == n - BigInt.from(1)) continue;

      bool roundPassed = false;
      for (int j = 0; j < r - 1; j++) {
        x = x.modPow(BigInt.from(2), n);
        if (x == n - BigInt.from(1)) {
          roundPassed = true;
          break;
        }
      }

      if (!roundPassed) return false;
    }
    return true;
  }

  static int modPow(int base, int exponent, int mod) {
    int result = 1;
    base %= mod;
    while (exponent > 0) {
      if (exponent % 2 == 1) result = (result * base) % mod;
      exponent = exponent ~/ 2;
      base = (base * base) % mod;
    }
    return result;
  }
}
