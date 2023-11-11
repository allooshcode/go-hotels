import 'package:flutter/material.dart';
import 'package:go_hotels/hotel_search_freature/presentation/widgets/city_selector.dart';
import 'package:go_hotels/hotel_search_freature/presentation/widgets/date_selector.dart';

class InfoFields extends StatelessWidget {
  const InfoFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue,
              Colors.tealAccent,
            ],
          )),
      child: Column(
        children: [
          CitySelector(),
          const DateRangeSelector(),
          CitySelector(),
          CitySelector(),
        ],
      ),
    );
  }
}
