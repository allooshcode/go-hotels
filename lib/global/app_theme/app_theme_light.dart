import 'package:flutter/material.dart';
import 'package:go_hotels/global/app_colors/app_colors_light_theme.dart';
import 'package:go_hotels/global/utils/constants.dart';

ThemeData getAppThemeDataLight(BuildContext context) {
  return ThemeData(
      colorScheme: const ColorScheme.light()
          .copyWith(primary: Colors.white, secondary: Colors.blue),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:
          const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
      textTheme: TextTheme(
          bodySmall: const TextStyle(
              color: Color.fromARGB(255, 15, 16, 1),
              fontWeight: FontWeight.bold,
              fontSize: 13),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 242, 241, 247),
              fontSize: AppConstants.unitWidthValu(context) *
                  AppConstants.headerText)),
      iconTheme: const IconThemeData(color: AppColorsLight.primaryColor),
      primaryIconTheme:
          const IconThemeData(color: Color.fromARGB(255, 14, 14, 11)),
      listTileTheme: const ListTileThemeData(
        iconColor: Color.fromARGB(255, 13, 13, 8),
      ));
}
