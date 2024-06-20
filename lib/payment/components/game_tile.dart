import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final void Function()? onPressed;

  const GameTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                itemName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$${itemPrice}'),
            ),
          ],
        ),
      ),
    );
  }
}
