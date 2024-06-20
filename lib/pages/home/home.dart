import 'package:app1/pages/home/widgets/category.dart';
import 'package:app1/pages/home/widgets/header.dart';
import 'package:app1/pages/home/widgets/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F67EA),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(150, 50),
              child: Image.asset(
                'assets/images/bg_liquid.png',
                width: 200,
              ),
            ),
            Positioned(
              right: 0,
              top: 200,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(180, 100),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200,
                ),
              ),
            ),
            Column(
              children: [
                const HeaderSection(),
                const SearchSection(),
                CategorySection(),
                
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF5F67EA),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              switch (index) {
                case 0:
                  // Vous êtes déjà sur la page d'accueil, pas besoin de naviguer
                  break;
                case 1:
                  Navigator.pushNamed(context, '/categorie-games');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/payment'); // Naviguer vers la page d'achat des jeux
                  break;
                case 3:
                  Navigator.pushNamed(context, '/welcome'); // Naviguer vers la page de bienvenue
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: "Categorie",
                icon: Icon(
                  Icons.category,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: "Acheter",
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: "Login",
                icon: Icon(
                  Icons.login,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
