import 'package:flutter/material.dart';
import 'package:go_hotels/global/utils/constants.dart';

class HotelSearchPage extends StatelessWidget {
  const HotelSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('image_back.jpg', fit: BoxFit.cover),
      ),
      Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: AppConstants.unitWidthValu(context) * 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  padding: EdgeInsets.only(
                      bottom: AppConstants.unitHeightValue(context) * 3,
                      top: AppConstants.unitHeightValue(context) * 3,
                      left: AppConstants.unitWidthValu(context) * 1),
                  child: Text('Hotels Search           ',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

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
