import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/game_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

final List<Map<String, dynamic>> gameList = [
  {
    'title': 'Call of Duty: Mobile',
    'category': 'Action',
    'age': '17+',
    'review': 36,
    'picture': 'images/1.jpg',
    'price': '60',
  },
  {
    'title': 'Fortnite',
    'category': 'Action',
    'age': '12+',
    'review': 13,
    'picture': 'images/2.jpg',
    'price': '0',
  },
  {
    'title': 'Minecraft',
    'category': 'Aventure',
    'age': '17+',
    'review': 13,
    'picture': 'images/minecraft-1-20-4.jpeg',
    'price': '0',
  },
  {
    'title': 'The Legend of Zelda: Breath of the Wild',
    'category': 'Aventure',
    'age': '10+',
    'review': 13,
    'picture': 'images/17.jpeg',
    'price': '0',
  },
  {
    'title': 'Civilization VI',
    'category': 'Strategy',
    'age': '10+',
    'review': 88,
    'picture': 'images/5.jpg',
    'price': '0',
  },
  {
    'title': 'Clash of Clans',
    'category': 'Strategy',
    'age': '10+',
    'review': 88,
    'picture': 'images/6.jpg',
    'price': '0',
  },
  {
    'title': 'The Witcher 3: Wild Hunt',
    'category': 'RPG',
    'age': '18+',
    'review': 34,
    'picture': 'images/7.jpg',
    'price': '50',
  },
  {
    'title': 'Final Fantasy XV',
    'category': 'RPG',
    'age': '15+',
    'review': 34,
    'picture': 'images/8.jpg',
    'price': '50',
  },
  {
    'title': 'FIFA 23',
    'category': 'Sport',
    'age': '10+',
    'review': 34,
    'picture': 'images/18.png',
    'price': '50',
  },
  {
    'title': 'NBA 2K24',
    'category': 'Sport',
    'age': '15+',
    'review': 34,
    'picture': 'images/10.jpg',
    'price': '50',
  },
  {
    'title': 'Candy Crush Saga',
    'category': 'Puzzle',
    'age': '3+',
    'review': 50,
    'picture': 'images/11.jpg',
    'price': '60',
  },
  {
    'title': 'Monument Valley',
    'category': 'Puzzle',
    'age': '7+',
    'review': 50,
    'picture': 'images/12.jpg',
    'price': '60',
  },
  {
    'title': 'The Sims 4',
    'category': 'Simulation',
    'age': '12+',
    'review': 50,
    'picture': 'images/15.png',
    'price': '60',
  },
  {
    'title': 'Animal Crossing: New Horizons',
    'category': 'Simulation',
    'age': '3+',
    'review': 50,
    'picture': 'images/19.png',
    'price': '60',
  },
];

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _HomePageState();
}

class _HomePageState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 24.0),
        ),
        title: Text(
          'Game Store',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.login_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white, // Change this to your desired color
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Welcome to the Game Store,'),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Find and purchase your favorite games",
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Available Games",
            ),
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: gameList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GameTile(
                      itemName: gameList[index]['title'],
                      itemPrice: gameList[index]['price'],
                      imagePath: gameList[index]['picture'],
                      onPressed: () {
                        cart.addItemToCart(index, gameList);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
