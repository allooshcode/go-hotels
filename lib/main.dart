import 'package:flutter/material.dart';
import 'package:go_hotels/global/app_theme/app_theme_light.dart';

import 'hotel_search_freature/presentation/pages/hotel_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Hotels',
      theme: getAppThemeDataLight(context),
      home: const HotelSearchPage(),
    );
  }
}
