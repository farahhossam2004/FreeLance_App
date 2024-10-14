import 'package:flutter/material.dart';

class Payemnt_item extends StatelessWidget {
  const Payemnt_item({super.key, this.isActive = false, required this.image});

  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 103,
        height: 62,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.50,
                color: isActive ? const Color.fromARGB(255, 8, 201, 43) : Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            image,
            height: 40, // Adjust the height as needed
            width: 60, // Adjust the width as needed
            fit: BoxFit.scaleDown, // Fit the image within the given dimensions
          ),
        ),
      ),
    );
  }
}
