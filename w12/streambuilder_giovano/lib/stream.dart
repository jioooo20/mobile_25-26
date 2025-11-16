import 'dart:async';
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNumber = random.nextInt(100);
      return myNumber;
    });
  }
}
