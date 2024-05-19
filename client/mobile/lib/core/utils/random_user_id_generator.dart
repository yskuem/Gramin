
import 'dart:math';

class RandomUserIdGenerator {
  RandomUserIdGenerator._();
  static String generateUserId(int length) {
    final buffer = StringBuffer();
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();

    for (var i = 0; i < length; i++) {
      buffer.write(letters[random.nextInt(letters.length)]);
    }

    return buffer.toString();
  }
}



















