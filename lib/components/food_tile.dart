import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function() onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap
  });
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            // image
            Image.asset(
                food.getImagePath,
                height: 140,
              ),
          
            // text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 20),
            ),
          
            // rating and price
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price
                  Text('${food.price}\$'),
                            
                  // rating
                  Row(
                    children: [
                      Text(
                        food.rating,
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20)
                      ),
                      const Icon(Icons.star)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
