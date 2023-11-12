import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_hotels/hotel_search_freature/domain/usecases/fetech_nationalitiy_usecase.dart';

part 'nationality__event.dart';
part 'nationality__state.dart';

class NationalityBloc extends Bloc<NationalityEvent, NationalityState> {
  final FetchNationalityUseCase fetchNationalityUseCase;

  NationalityBloc(this.fetchNationalityUseCase) : super(NationalityInitial()) {
    on<FetchNationalitiesEvent>((event, emit) async {
      emit(NationalityInitial());
      final response = await fetchNationalityUseCase.execute();

      response.fold((l) => emit(ErrorNationalityState(l.msgError)),
          (r) => emit(LoadedNationalitiesState(r)));
    });
  }
}
