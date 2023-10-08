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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 0),
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

            const Text(
              'TODO: Implement food ingeredients at db',
              style: TextStyle( 
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  color: Colors.black38
                ),
            ),
            
            const SizedBox(height: 180),

            //TODO: add item bar
            //addSubBtn()
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 128, 53, 53),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(150))
                ),
                height: 70,
                width: 260,
                child: const Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    // price
                    Text(
                      '23\$',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white
                      ),
                    ),

                    SizedBox(width: 50),

                    // minus btn
                    AddSubBtn(symbol: '-'),

                    // object counter
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white
                      ),
                    ),

                    // plus btn
                    AddSubBtn(symbol: '+')
                  ],
                ),
                      ),
            )
        ]),
      ), 
    );
  }
}


