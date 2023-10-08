import 'package:flutter/material.dart';
 
class AddSubBtn extends StatelessWidget {

  final String symbol;
  final void Function()? onPressed;
  
  const AddSubBtn({
    Key? key,
    required this.symbol,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    IconData btnIcon = symbol == '+' ? 
                          Icons.add 
                        : (symbol == '-') ? Icons.remove
                        : Icons.add;

    return ElevatedButton(
      onPressed: onPressed,
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
