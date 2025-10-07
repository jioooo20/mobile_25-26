import 'package:belanja/models/item.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      image: 'img/sugar.jpg',
      stok: 12,
      rating: 4.7,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      image: 'img/salt.jpg',
      stok: 5,
      rating: 3.72,
    ),
    Item(
      name: 'Rice',
      price: 15000,
      image: 'img/rice.jpg',
      stok: 7,
      rating: 4.98,
    ),
    Item(
      name: 'Cooking Oil',
      price: 25000,
      image: 'img/oil.jpg',
      stok: 12,
      rating: 4.2,
    ),
    Item(
      name: 'Flour',
      price: 8000,
      image: 'img/flour.jpg',
      stok: 22,
      rating: 4.38,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belanja')),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Giovano Alkandri - 2341720096',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.77,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/item', arguments: item);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ItemPage(),
                settings: RouteSettings(arguments: item),
              ));
            },
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Hero(
                        tag: item.name,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              item.image,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp ${item.price}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'Stok: ${item.stok}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // Expanded(child: Text(item.name)),
                    // Expanded(
                    //   child: Text(
                    //     item.price.toString(),
                    //     textAlign: TextAlign.end,
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
