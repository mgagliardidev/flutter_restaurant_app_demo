  import 'package:flutter/material.dart';
  
  class AddSubBtn extends StatelessWidget {

  final String symbol;
  
  const AddSubBtn({
    super.key, required this.symbol,
  });

  @override
  Widget build(BuildContext context) {

    IconData btnIcon = symbol == '+' ? 
                          Icons.add 
                        : (symbol == '-') ? Icons.remove
                        : Icons.add;

    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: Color.fromARGB(120, 215, 218, 223), // <-- Button color
        foregroundColor: Colors.red, // <-- Splash color
      ),
      child: Icon(
        btnIcon,
        color: Colors.white
      ), 
    );
  }
}