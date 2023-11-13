// presentation/widgets/booking_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_hotels/room_details_booking_feature/presentation/bloc/room_booking_bloc_bloc.dart';

import '../../../container_injection.dart';

class RoomBookingDetail extends StatelessWidget {
  const RoomBookingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomBookingBloc(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            // Button to show booking details
            ElevatedButton(
              onPressed: () => _showBookingDetails(context),
              child: BlocBuilder<RoomBookingBloc, RoomBookingBlocState>(
                builder: (context, state) {
                  if (state is RoomBookingUpdatedState) {
                    return Text(state.mainButtonText);
                  } else {
                    return const Text(
                        'Loading...'); // Placeholder for loading state
                  }
                },
              ),
            ),
          ],
        ),
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
            return BlocBuilder<RoomBookingBloc, RoomBookingBlocState>(
              builder: (context, state) {
                if (state is RoomBookingUpdatedState) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < state.rooms.length; i++)
                          _buildRoomDetailsSection(i, setState),
                        _buildPetFriendlyCard(setState),
                        const Expanded(child: SizedBox()),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            BlocProvider.of<RoomBookingBloc>(context)
                                .add(UpdateMainButtonEvent());
                          },
                          child: const Text('Apply'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(); // Placeholder for loading state
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildRoomDetailsSection(int index, Function setState) {
    final roomBookingBloc = sl<RoomBookingBloc>();
    final room = roomBookingBloc.rooms[index];
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
                    onPressed: () => setState(() =>
                        roomBookingBloc.add(IncrementRoomNumberEvent(index))),
                    icon: const Icon(Icons.add),
                  ),
                  Text(room.roomNumber.toString()),
                  IconButton(
                    onPressed: () {
                      if (room.roomNumber > 1) {
                        setState(() => roomBookingBloc
                            .add(DecrementRoomNumberEvent(index)));
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
                  onIncrease: () => setState(() =>
                      roomBookingBloc.add(IncrementAdultNumberEvent(index))),
                  onDecrease: () {
                    if (room.adultNumber > 1) {
                      setState(() => roomBookingBloc
                          .add(DecrementAdultNumberEvent(index)));
                    }
                  },
                ),
                _buildCounterRow(
                  title: 'Children Number',
                  value: room.childrenNumber,
                  onIncrease: () => setState(() =>
                      roomBookingBloc.add(IncrementChildrenNumberEvent(index))),
                  onDecrease: () {
                    if (room.childrenNumber > 0) {
                      setState(() => roomBookingBloc
                          .add(DecrementChildrenNumberEvent(index)));
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
    final roomBookingBloc = sl<RoomBookingBloc>();

    final room = roomBookingBloc.rooms[index];
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
                          roomBookingBloc
                              .add(UpdateChildrenAgeEvent(index, i, value!));
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
    final roomBookingBloc = sl<RoomBookingBloc>();
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
            BlocBuilder<RoomBookingBloc, RoomBookingBlocState>(
              builder: (context, state) {
                if (state is RoomBookingUpdatedState) {
                  return Switch(
                    value: state.isPetFriendly,
                    onChanged: (value) {
                      setState(() {
                        roomBookingBloc.add(UpdatePetFriendlyEvent(value));
                      });
                    },
                  );
                }
                return Switch(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      roomBookingBloc.add(UpdatePetFriendlyEvent(value));
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
