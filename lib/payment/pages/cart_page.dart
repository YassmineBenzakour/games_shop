import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.cartItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(cart.cartItems[index]['picture']),
                      title: Text(cart.cartItems[index]['title']),
                      subtitle: Text('\$${cart.cartItems[index]['price']}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          cart.removeItemFromCart(index);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '\$${cart.calculateTotal()}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality here
                  },
                  child: const Text('Checkout'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
