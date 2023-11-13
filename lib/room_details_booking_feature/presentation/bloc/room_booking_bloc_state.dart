part of 'room_booking_bloc_bloc.dart';

abstract class RoomBookingBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

final class RoomBookingInitialState extends RoomBookingBlocState {}

class RoomBookingUpdatedState extends RoomBookingBlocState {
  final List<RoomDetails> rooms;
  final String mainButtonText;
  final bool isPetFriendly;

  RoomBookingUpdatedState({
    required this.rooms,
    required this.mainButtonText,
    required this.isPetFriendly,
  });
}
