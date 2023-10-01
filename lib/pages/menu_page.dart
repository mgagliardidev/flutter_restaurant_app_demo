import 'package:flutter/material.dart';
import '../components/food_tile.dart';
import '../models/food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // food menu
  List<Food> foodMenu = [
    // pizza
    Food(name: 'Pizza', price: '5,00', imagePath: 'assets/images/food_icons/pizza.png', rating: '5'),
    Food(name: 'Lasagne', price: '6,99', imagePath: 'assets/images/food_icons/lasagne.png', rating: '4'),
    Food(name: 'Spaghetti', price: '3.99', imagePath: 'assets/images/food_icons/spaghetti.png', rating: '5'),
    Food(name: 'Tiramisu', price: '6.00', imagePath: 'assets/images/food_icons/tiramisu.png', rating: '3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black87
        ),
        title: const Text(
          'MAMMA MIA! Restaurant',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.black87
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60)
            ),
            width: 380,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/misc/promo_banner.jpg',
                fit: BoxFit.cover,
              )
            ),
          ),

          const SizedBox(height: 20),

          ConstrainedBox(
            constraints: const BoxConstraints.expand(height: 240), 
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('menu').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                // parse items
                var items = snapshot.data!.docs;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    var item = items[index].data();
                    Food foodItem = Food(name: item['name'], price: item['price'].toString(), rating: item['rating'].toString());
                    return FoodTile(food: foodItem);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}