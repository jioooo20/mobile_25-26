import 'dart:async';

import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream gioo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // int _counter = 0;

  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  int lastNumber = 0;
  late NumberStream numberStream;
  late StreamController<int> numberStreamController;
  late StreamTransformer<int, int> transformer;
  late StreamSubscription subscription;

  void changeColor() async {
    // await for (var eventColor in colorStream.getColorStream()) {
    colorStream.getColorStream().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  @override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
    subscription.onError((error){
      setState(() {
        lastNumber = -1;
      });
    });
    subscription.onDone(() {
      print("OnDone was called");
    });
    super.initState();
  }

  void stopStream(){
    numberStreamController.close();
  }

  @override
  void dispose() {
    numberStream.close();
    subscription.cancel();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(randomNumber);
    }else{
      setState(() {
        lastNumber = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream gioooo')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('Add Random Number'),
            ),
            ElevatedButton(
              onPressed: ()=>stopStream(),
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
      // body: Container(decoration: BoxDecoration(color: bgColor)),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
