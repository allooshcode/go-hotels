import 'package:flutter/material.dart';

class BuildDropdown extends StatelessWidget {
  const BuildDropdown({super.key, required this.nationalities});
  final List<String> nationalities;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        items: nationalities.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle the selected nationality as needed
          print('Selected Nationality: $newValue');
        },
        decoration: const InputDecoration(
          labelText: 'Nationality',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
