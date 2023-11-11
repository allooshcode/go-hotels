// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:go_hotels/global/utils/constants.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class TestPage extends StatelessWidget {
//   const TestPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('City Selector'),
//       ),
//       body: CitySelector(),
//     );
//   }
// }
//
// class CitySelector extends StatelessWidget {
//   CitySelector({super.key});
//
//   Future<List<String>> getSuggestions(String query) async {
//     final response = await http.get(
//       Uri.parse(
//           'http://api.geonames.org/searchJSON?q=$query&maxRows=5&username=alaa'),
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final List<dynamic> cities = data['geonames'];
//       return cities.map((city) => city['name']).cast<String>().toList();
//     } else {
//       throw Exception('Failed to load cities');
//     }
//   }
//
//   TextEditingController? textEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: SizedBox(
//         // width: AppConstants.unitWidthValu(context) * 0.8,
//         child: TypeAheadField(
//           textFieldConfiguration: TextFieldConfiguration(
//             controller: textEditingController,
//             style: Theme.of(context).textTheme.bodySmall,
//             decoration: InputDecoration(
//               fillColor: Theme.of(context).colorScheme.primary,
//               labelText: 'City',
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//             ),
//           ),
//           suggestionsCallback: (pattern) => getSuggestions(pattern),
//           itemBuilder: (context, suggestion) {
//             return ListTile(
//               title: Text(suggestion),
//             );
//           },
//           onSuggestionSelected: (suggestion) {
//             textEditingController?.text = suggestion;
//             // Handle the selected suggestion as needed
//             print('Selected: $suggestion');
//           },
//         ),
//       ),
//     );
//   }
// }
