import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _cart = [];

  // getters
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      cart.add(foodItem);
    }
    
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food foodItem) {
    cart.remove(foodItem);

    notifyListeners();
  }
}