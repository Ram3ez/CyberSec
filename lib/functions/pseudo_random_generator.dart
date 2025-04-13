import 'dart:math';

class PseudoRandomGenerator {
  static int generate([int min = 0, int max = 100]) {
    //return Random().nextInt(max) + min;
    return Random.secure().nextInt(max - min) + min;
  }
}
