import 'dart:convert';
import './model/pizza.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo giovano',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];

  int appCounter = 0;

  String documentsPath = '';
  String tempPath = '';

  late File myFile;
  String fileText = '';

  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('2341720096 giovaon');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getPaths() async {
    final docDit = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    setState(() {
      documentsPath = docDit.path;
      tempPath = tempDir.path;
    });
  }

  Future readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      appCounter = 0;
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist_broken.json');

    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJson(myPizzas);
    print(json);
    return myPizzas;

    // setState(() {
    //   pizzaString = myString;
    // });
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  @override
  void initState() {
    super.initState();
    getPaths().then((_) {
      myFile = File('$documentsPath/myfile.txt');
      writeFile();
    });
    // readAndWritePreference();
    // readJsonFile().then((value) {
    //   setState(() {
    //     myPizzas = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Flutter JSON Demo giovano'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(controller: pwdController),
          ElevatedButton(
            onPressed: () {
              writeToSecureStorage();
            },
            child: Text('Save value'),
          ),
          ElevatedButton(
            onPressed: () {
              readFromSecureStorage().then((value) {
                setState(() {
                  myPass = value;
                });
              });
            },
            child: Text('Read value'),
          ),
          Text(myPass),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text('You have opened the app $appCounter times'),
      //       ElevatedButton(
      //         onPressed: () {
      //           deletePreference();
      //         },
      //         child: Text('Reset counter'),
      //       ),
      //     ],
      //   ),
      // ),
      // body: ListView.builder(
      //   itemCount: myPizzas.length,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text(myPizzas[index].pizzaName),
      //     subtitle: Text(myPizzas[index].description + ''
      //         ' - \$${myPizzas[index].price.toStringAsFixed(2)}'),
      //   ),
      // ),
    );
  }
}
