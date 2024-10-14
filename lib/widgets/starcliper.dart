
import 'package:flutter/material.dart';

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(width * 0.5, 0);
    path.lineTo(width * 0.61, height * 0.35);
    path.lineTo(width, height * 0.35);
    path.lineTo(width * 0.68, height * 0.57);
    path.lineTo(width * 0.79, height);
    path.lineTo(width * 0.5, height * 0.75);
    path.lineTo(width * 0.21, height);
    path.lineTo(width * 0.32, height * 0.57);
    path.lineTo(0, height * 0.35);
    path.lineTo(width * 0.39, height * 0.35);
    path.close();

    return path;
  }
  
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
