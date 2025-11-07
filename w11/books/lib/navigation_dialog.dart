import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text("Navigation First Screen GEOOO")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Change Color"),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    color = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Choose a color'),
          actions: <Widget>[
            TextButton(
              child: Text("red"),
              onPressed: () {
                color = Colors.red;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: Text("green"),
              onPressed: () {
                color = Colors.green;
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: Text("blue"),
              onPressed: () {
                color = Colors.blue;
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }
}
