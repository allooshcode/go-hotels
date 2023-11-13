part of 'room_booking_bloc_bloc.dart';

abstract class RoomBookingEvent {}

class IncrementRoomNumberEvent extends RoomBookingEvent {
  final int index;

  IncrementRoomNumberEvent(this.index);
}

class DecrementRoomNumberEvent extends RoomBookingEvent {
  final int index;

  DecrementRoomNumberEvent(this.index);
}

class IncrementAdultNumberEvent extends RoomBookingEvent {
  final int index;

  IncrementAdultNumberEvent(this.index);
}

class DecrementAdultNumberEvent extends RoomBookingEvent {
  final int index;

  DecrementAdultNumberEvent(this.index);
}

class IncrementChildrenNumberEvent extends RoomBookingEvent {
  final int index;

  IncrementChildrenNumberEvent(this.index);
}

class DecrementChildrenNumberEvent extends RoomBookingEvent {
  final int index;

  DecrementChildrenNumberEvent(this.index);
}

class UpdateChildrenAgeEvent extends RoomBookingEvent {
  final int roomIndex;
  final int childIndex;
  final int value;

  UpdateChildrenAgeEvent(this.roomIndex, this.childIndex, this.value);
}

class UpdatePetFriendlyEvent extends RoomBookingEvent {
  final bool value;

  UpdatePetFriendlyEvent(this.value);
}

class UpdateMainButtonEvent extends RoomBookingEvent {}
