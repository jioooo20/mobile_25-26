import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Legend Skin CS 2",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "layouting biasa",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    cardSenjata("img/awp.png", "AWP | Dragon Lore"),
                    const SizedBox(width: 8.0),
                    cardSenjata("img/m4.png", "M4A4 | Howl"),
                  ],
                ),
                const SizedBox(height: 8.0),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    cardSenjata("img/ak47.png", "AK 47 | Fire Serpent"),
                    const SizedBox(width: 8.0),
                    cardSenjata("img/piso.png", "Knife | Bayonet Fade"),
                  ],
                ),
                SizedBox(height: 16.0),
                Divider(color: Colors.grey, thickness: 1.0),
                SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "layouting pake GridView",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: [
                    Image.asset("img/awp.png", width: 100),
                    Image.asset("img/m4.png", width: 100),
                    Image.asset("img/ak47.png", width: 100),
                    Image.asset("img/piso.png", width: 100),
                    Image.asset("img/57.png", width: 100),
                    Image.asset("img/famaz.png", width: 100),
                    Image.asset("img/mac10.png", width: 100),
                    Image.asset("img/degel.png", width: 100),
                    Image.asset("img/xm.png", width: 100),
                  ],
                ),

                SizedBox(height: 16.0),
                Divider(color: Colors.grey, thickness: 1.0),
                SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "stacking things",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                _buildStack(),
                SizedBox(height: 16.0),
                Divider(color: Colors.grey, thickness: 1.0),
                SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ListView",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: SizedBox(height: 300, child: _buildList())),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildStack() {
  return Stack(
    alignment: const Alignment(0, 0.7),
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage('img/mireg.png'),
        radius: 100,
      ),
      Container(
        decoration: const BoxDecoration(color: Colors.black45),
        child: const Text(
          'Map Mirage',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

Widget _buildList() {
  return ListView(
    children: [
      _tile('AK-47', 'Asiimov', Icons.gamepad_outlined),
      _tile('AWP', 'Dragon lore', Icons.gamepad_outlined),
      _tile('Mac10', 'Fade', Icons.gamepad_outlined),
      _tile('Famaz', 'Crimson Web', Icons.gamepad_outlined),
    ],
  );
}

ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    subtitle: Text(subtitle),
    leading: Icon(icon, color: Colors.blue[500]),
  );
}

Widget cardSenjata(String img, String senjata) {
  return Expanded(
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Center(child: Image.asset(img, width: 100))],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(senjata, style: TextStyle(fontSize: 16))),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
