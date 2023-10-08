import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String imagePath;

  const ImageBanner({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60)
      ),
      width: 380,
      height: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}