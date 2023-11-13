import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_hotels/nationality_select_feature/presentation/bloc/nationality__bloc.dart';
import 'package:go_hotels/nationality_select_feature/presentation/widgets/build_drop_down_nations.dart';

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
          return BuildDropdown(
            nationalities: state.nationalities,
          );
        } else if (state is ErrorNationalityState) {
          return Center(child: Text(state.error));
        } else {
          return Container(); // Handle other states as needed
        }
      },
    );
  }
}
