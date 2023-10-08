import 'package:flutter/material.dart';

import '../components/add_sub_btn.dart';
import '../models/food.dart';

class FoodDetails extends StatefulWidget {
  final Food food;

  const FoodDetails(
    { 
      required this.food,
      super.key
    });

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  num foodCounter = 0;
  num totalPrice = 0;

  void updateFoodCounterAndPrice(num value) {
    
    if (foodCounter == 0 && value < 0) {
      return;
    }

    setState(() {
      foodCounter += value;
      totalPrice = num.parse((foodCounter * widget.food.price).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 0),
              child: Image.asset(
                widget.food.getImagePath,
                height: 200,
              ),
            ),
            Text(
                // food name
                widget.food.name,
                style: const TextStyle(
                  height: 3, 
                  fontSize: 30,
                  fontFamily: 'Roboto'
                ),
              ),
            Row(
                children: [
                  Text(
                    widget.food.rating,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto'
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 196, 134, 35),
                  )
                ],
              ),
      
            const SizedBox(height: 20),
      
            const Text(
              'Ingredients: ',
              style: TextStyle( 
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500
                ),
            ),
      
            const SizedBox(height: 20),
      
            const Expanded(
              child: Text(
                'TODO: Implement food ingeredients at db',
                style: TextStyle( 
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    color: Colors.black38
                  ),
              ),
            ),
      
            // button row
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 128, 53, 53),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(150))
                      ),
                      height: 70,
                      width: 260,
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                    
                          const SizedBox(width: 10),
                          
                          // price
                          Text(
                            '$totalPrice\$',
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white
                            ),
                          ),
                                
                          // minus btn
                          AddSubBtn(symbol: '-', onPressed: () => updateFoodCounterAndPrice(-1)),
                    
                          // object counter
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(
                              foodCounter.toString(),
                              style: const TextStyle(
                                fontSize: 23,
                                color: Colors.white
                              ),
                            ),
                          ),
                    
                          // plus btn
                          AddSubBtn(symbol: '+', onPressed: () => updateFoodCounterAndPrice(1)),
                        ],
                      ),
                    ),
                    
                    // add to cart btn
                    ElevatedButton(
                      onPressed: (foodCounter > 0) ? (){} : null,
                        style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                        backgroundColor: const Color.fromARGB(255, 128, 53, 53), // <-- Button color
                        foregroundColor: Colors.red, // <-- Splash color
                        disabledBackgroundColor: const Color.fromARGB(150, 128, 53, 53) // <-- color when onPressed is null
                      ), 
                      child: 
                        const Icon(
                          Icons.shopping_cart_checkout_rounded,
                          color: Colors.white,
                          size: 38,
                        ),
                    )
                  ],
                ),
              ),
            )
        ]),
      ), 
    );
  }
}


