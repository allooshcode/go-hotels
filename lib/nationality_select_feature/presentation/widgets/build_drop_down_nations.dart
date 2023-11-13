import 'package:flutter/material.dart';

import '../../../global/shared_widgets/custom_container.dart';
import '../../../global/shared_widgets/text_form_field_box_decoration.dart';
import '../../../global/utils/constants.dart';

class BuildDropdown extends StatelessWidget {
  const BuildDropdown({super.key, required this.nationalities});
  final List<String> nationalities;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: DropdownButtonFormField<String>(
          items: nationalities.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          alignment: Alignment.center,
          onChanged: (String? newValue) {
            // Handle the selected nationality as needed
            print('Selected Nationality: $newValue');
          },
          decoration:
              decoration(context, '                             Nationality')),
    );
  }
}
