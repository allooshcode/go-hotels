import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../hotel_search_mian_page_freature/presentation/pages/testPage.dart';
import '../../domain/entities/room_details_entity.dart';

part 'room_booking_bloc_event.dart';
part 'room_booking_bloc_state.dart';

class RoomBookingBloc extends Bloc<RoomBookingEvent, RoomBookingBlocState> {
  List<RoomDetails> rooms = [
    RoomDetails(
      roomNumber: 1,
      adultNumber: 1,
      childrenNumber: 0,
      childrenAges: [],
    ),
  ];

  RoomBookingBloc() : super(RoomBookingInitialState()) {
    on<IncrementRoomNumberEvent>((event, emit) {});
  }
}
