import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_hotels/global/utils/constants.dart';

import '../../../global/shared_widgets/custom_container.dart';
import '../../../global/shared_widgets/text_form_field_box_decoration.dart';

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

class RoomBookingDetails extends StatefulWidget {
  const RoomBookingDetails({super.key});

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<RoomBookingDetails> {
  List<RoomDetails> rooms = [
    RoomDetails(
        roomNumber: 1, adultNumber: 1, childrenNumber: 0, childrenAges: [])
  ];
  String mainButtonText = '1 Room, 1 Adult, 0 Children';
  bool isPetFriendly = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          // Button to show booking details
          CustomContainer(
            child: TextFormField(
              onTap: () => _showBookingDetails(context),
              textAlign: TextAlign.center,
              readOnly: true,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: decoration(context, mainButtonText),
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var i = 0; i < rooms.length; i++)
                    _buildRoomDetailsSection(i, setState),
                  _buildPetFriendlyCard(setState),
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _updateMainButtonText();
                    },
                    child: Text(
                      'Apply',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildRoomDetailsSection(int index, Function setState) {
    final room = rooms[index];
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('  Room ${index + 1}'),
              Row(
                children: [
                  IconButton(
                    onPressed: () => setState(() => rooms[index].roomNumber++),
                    icon: const Icon(Icons.add),
                  ),
                  Text(room.roomNumber.toString()),
                  IconButton(
                    onPressed: () {
                      if (room.roomNumber > 1) {
                        setState(() => rooms[index].roomNumber--);
                      }
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Room ${index + 1} Details'),
                _buildCounterRow(
                  title: 'Adult Number',
                  value: room.adultNumber,
                  onIncrease: () => setState(() => rooms[index].adultNumber++),
                  onDecrease: () {
                    if (room.adultNumber > 1) {
                      setState(() => rooms[index].adultNumber--);
                    }
                  },
                ),
                _buildCounterRow(
                  title: 'Children Number',
                  value: room.childrenNumber,
                  onIncrease: () =>
                      setState(() => rooms[index].childrenNumber++),
                  onDecrease: () {
                    if (room.childrenNumber > 0) {
                      setState(() => rooms[index].childrenNumber--);
                    }
                  },
                ),
                _buildChildrenAgesRow(index, setState),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildCounterRow({
    required String title,
    required int value,
    required Function onIncrease,
    required Function onDecrease,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Row(
          children: [
            IconButton(
              onPressed: () => onDecrease(),
              icon: const Icon(Icons.remove),
            ),
            Text(value.toString()),
            IconButton(
              onPressed: () => onIncrease(),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChildrenAgesRow(int index, Function setState) {
    final room = rooms[index];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Text('Children Ages'),
          const SizedBox(width: 8.0),
          for (var i = 0; i < room.childrenNumber; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text('Child ${i + 1}:'),
                  const SizedBox(width: 8.0),
                  DropdownButton<int>(
                    value: i < room.childrenAges.length
                        ? room.childrenAges[i]
                        : null,
                    hint: const Text('Age'),
                    items: List.generate(18, (index) => index + 1)
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (i < room.childrenAges.length) {
                          room.childrenAges[i] = value!;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPetFriendlyCard(Function setState) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pet-friendly!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Only show stays that allow pets'),
              ],
            ),
            Switch(
              value: isPetFriendly,
              onChanged: (value) {
                setState(() {
                  isPetFriendly = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateMainButtonText() {
    // Logic to update the main button text with the selected values
    final totalAdults =
        rooms.map((room) => room.adultNumber).reduce((a, b) => a + b);
    final totalChildren =
        rooms.map((room) => room.childrenNumber).reduce((a, b) => a + b);

    final buttonText =
        '${rooms.length} Room${rooms.length > 1 ? 's' : ''}, $totalAdults Adult${totalAdults > 1 ? 's' : ''}, $totalChildren Child${totalChildren > 1 ? 'ren' : ''}';

    // Update the local state to reflect the changes in the UI
    setState(() {
      mainButtonText = buttonText;
    });
  }
}
