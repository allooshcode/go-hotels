import 'package:flutter/material.dart';

class AppConstants {
  static double unitHeightValue(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.01;
  }

  static double unitWidthValu(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.01;
  }

  static const double headerText = 4;
  static const double secondaryText = 3;
}
