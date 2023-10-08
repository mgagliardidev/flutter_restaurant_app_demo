import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/food.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
            style: TextStyle(
              fontSize: 24
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  
                  final Food foodItem = value.cart[index];
            
                  final String foodName = foodItem.name;
            
                  final String foodPrice = foodItem.price.toString();
            
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(150, 201, 193, 193),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ListTile(
                      title: Text(foodName),
                      subtitle: Text(foodPrice),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeItem(foodItem, context),
                      ),
                    ),
                  );
                }
              ),
            ),

            // pay btn
          Container(
            width: 250,
            height: 60,
            margin: EdgeInsets.only(bottom: 40),
            child: FloatingActionButton.extended(  
              label: const Text(
                'Pay Now',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),  
              ),  
              backgroundColor: const Color.fromARGB(255, 128, 53, 53), // <-- Button color
              foregroundColor: Colors.red, // <-- Splash color
              onPressed: (){},  
            ),
          ),  
        ],
        )
      ),
    );
  }

  void removeItem(Food foodItem, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    shop.removeFromCart(foodItem);
  }
}