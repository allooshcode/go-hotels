import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height); // Start at the bottom-left corner

    // Define the slanted side
    path.lineTo(size.width, size.height);
    path.lineTo(
      size.width - size.width / 2,
      -size.height,
    );
    path.lineTo(0, -size.height);
    path.lineTo(0, size.height);
    path.close(); // Close the path to form a triangle

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
