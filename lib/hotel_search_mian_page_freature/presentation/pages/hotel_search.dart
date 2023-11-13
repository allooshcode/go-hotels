import 'package:flutter/material.dart';
import 'package:go_hotels/hotel_search_mian_page_freature/presentation/widgets/info_fields.dart';

import '../widgets/hotels_search_text_header_conainer.dart';

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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const HotelsSearchText(),
              const InfoFields(),
            ],
          ),
        ),
      ),
    ]);
  }
}
