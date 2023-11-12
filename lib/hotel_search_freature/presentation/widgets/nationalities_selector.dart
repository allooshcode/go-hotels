import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/nationality__bloc.dart';

class NationalitySelector extends StatelessWidget {
  const NationalitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NationalityBloc, NationalityState>(
      builder: (context, state) {
        if (state is NationalityInitial) {
          BlocProvider.of<NationalityBloc>(context)
              .add(FetchNationalitiesEvent());
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedNationalitiesState) {
          return buildDropdown(state.nationalities);
        } else if (state is ErrorNationalityState) {
          return Center(child: Text(state.error));
        } else {
          return Container(); // Handle other states as needed
        }
      },
    );
  }

  Widget buildDropdown(List<String> nationalities) {
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
