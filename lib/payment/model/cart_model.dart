import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItemToCart(int index, List<Map<String, dynamic>> gameList) {
    _cartItems.add(gameList[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    for (var item in _cartItems) {
      total += double.parse(item['price']);
    }
    return total.toStringAsFixed(2);
  }
}
