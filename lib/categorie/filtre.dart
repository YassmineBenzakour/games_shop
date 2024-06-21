import 'package:app1/categorie/card.dart';
import 'package:flutter/material.dart';

class GameSection extends StatefulWidget {
  @override
  _GameSectionState createState() => _GameSectionState();
}

class _GameSectionState extends State<GameSection> {
  String selectedCategory = 'All';

  final List gameList = [
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
      'title': 'The Sims 4y',
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

  @override
  Widget build(BuildContext context) {
    List filteredGameList = selectedCategory == 'All'
        ? gameList
        : gameList.where((game) {
            return game['category'] == selectedCategory;
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Game Categories'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Games found',
                      ),
                      Row(
                        children: [
                          DropdownButton<String>(
                            value: selectedCategory,
                            items: <String>[
                              'All',
                              'Action',
                              'Adventure',
                              'Strategy',
                              'RPG',
                              'Sports',
                              'Puzzle',
                              'Simulation'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue!;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.filter_list_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                            onPressed: null,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: filteredGameList.map((game) {
                    return GameCard(game);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
