import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Widget titleSection = Container(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          /* soal 1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* soal 2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Wisata Gunung KELUD di MBELITAR',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('Blitar, Indonesia', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        /* soal 3*/
        Container(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 32,
            top: 32,
          ),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              const Text('999'),
            ],
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Kelud adalah gunung berapi aktif yang terletak di perbatasan '
        'Kabupaten Kediri, Blitar, dan Malang, Jawa Timur. Gunung ini memiliki '
        'ketinggian 1.731 meter di atas permukaan laut dan terkenal dengan '
        'danau kawahnya yang indah. Kelud merupakan salah satu destinasi '
        'wisata alam favorit dengan pemandangan yang menakjubkan dan udara '
        'yang sejuk. Nama: Giovano Alkandri, NIM: 2341720096.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter layout: Giovano Alkandri - 2341720096',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
            Image.asset('images/kelud.png', width: 600, height: 400),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
