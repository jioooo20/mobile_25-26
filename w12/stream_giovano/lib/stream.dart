import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.lime,
  ];
  Stream<Color> getColorStream() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  Stream<int> get stream => controller.stream;

  void addNumberToSink(int number) {
    controller.sink.add(number);
  }

  close(){
    controller.close();
  }

  addError(){
    controller.sink.addError("error");
  }

}
  