// lib/domain/entities/room_details.dart

class RoomDetails {
  int roomNumber;
  int adultNumber;
  int childrenNumber;
  List<int> childrenAges;

  RoomDetails({
    required this.roomNumber,
    required this.adultNumber,
    required this.childrenNumber,
    required this.childrenAges,
  });
}
