import 'package:flutter/material.dart';

class HotelSearchPage extends StatelessWidget {
  const HotelSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.blue,
                // Adjust the height as needed

                child: const Text('Hotels Search'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height); // Start at the bottom-left corner

    // Define the slanted side
    path.lineTo(size.width, size.height - 50.0); // Line to the bottom-right
    path.lineTo(size.width, 0); // Line to the top-right
    path.close(); // Close the path to form a triangle

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
