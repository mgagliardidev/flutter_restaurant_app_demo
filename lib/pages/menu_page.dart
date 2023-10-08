import 'package:flutter/material.dart';
import '../components/food_tile.dart';
import '../models/food.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'food_details_page.dart';
import 'cart_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black87
        ),
        actions: [
          // cart btn
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
            }, 
            icon: Icon(Icons.shopping_cart_sharp),
            color: Colors.black,
          )
        ],
        title: const Text(
          'MAMMA MIA!',
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
                    Food foodItem = Food(name: item['name'], price: item['price'], rating: item['rating'].toString());
                    return FoodTile(
                      food: foodItem,
                      onTap: () => navigateToFoodDetails(foodItem)
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
  
  void navigateToFoodDetails(Food food) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails(food: food)));
  }
}