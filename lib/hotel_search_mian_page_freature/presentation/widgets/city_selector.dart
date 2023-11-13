import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_hotels/global/shared_widgets/custom_container.dart';
import 'package:go_hotels/global/shared_widgets/text_form_field_box_decoration.dart';
import 'package:go_hotels/global/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//>>>>>>>>>>>>>>>>>>>>>>>>
//   <<          <<<       <<<<
//HERE CAN BE ACHEIVED BY CLEAN ARCHETICHER ALSO BUT FOR quick reply i did like that , the same thing also for date selector and room booking details
// btw select nationality was done in clean architecture .....
//   >>  >>> >>>>>
//<<<<<<<<<<<<<<<<<<<<<<<<<<<

// ignore: must_be_immutable
class CitySelector extends StatelessWidget {
  CitySelector({super.key});

  Future<List<String>> getSuggestions(String query) async {
    final response = await http.get(
      Uri.parse(
          'http://api.geonames.org/searchJSON?q=$query&maxRows=5&username=alaa'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> cities = data['geonames'];
      return cities.map((city) => city['name']).cast<String>().toList();
    } else {
      throw Exception('Failed to load cities');
    }
  }

  TextEditingController? textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        child: TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
          controller: textEditingController,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: decoration(context, 'Select City')),
      suggestionsCallback: (pattern) => getSuggestions(pattern),
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(
            suggestion,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
      onSuggestionSelected: (suggestion) {
        textEditingController?.text = suggestion;
        // Handle the selected suggestion as needed
        print('Selected: $suggestion');
      },
    ));
  }
}
