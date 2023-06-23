import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //* list of items on sale
  final List _shopItems = const [
    //* [itemName, itemPrice, imagenPath, color]
    ["Avocado", "4.00", "imgs/avocado.png", Colors.green],
    ["Banana", "5.00", "imgs/banana.png", Colors.yellow],
    ["Chicken", "6.00", "imgs/avocado.png", Colors.green],
    ["Water", "7.00", "imgs/avocado.png", Colors.green],
  ];

  //* List of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  //* add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //* remove item for cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //* calculate total price
  String calcularTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
