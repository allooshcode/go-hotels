// // data_provider.dart
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
//
// class DateRangeDataProvider {
//   Future<DateTime?> pickDate(DateTime initialDate) async {
//     // Implement date picking logic here
//     return Future.delayed(Duration(seconds: 1), () => DateTime.now());
//   }
// }
//
// // date_range_repository.dart
//
// abstract class DateRangeRepository {
//   final DateRangeDataProvider dataProvider;
//
//   DateRangeRepository(this.dataProvider);
//
//   Future<DateTime?> pickDate(DateTime initialDate);
// }
//
// // date_range_bloc.dart
//
// // Events
// abstract class DateRangeEvent extends Equatable {
//   const DateRangeEvent();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class DateSelectedEvent extends DateRangeEvent {
//   final DateTime selectedDate;
//
//   DateSelectedEvent(this.selectedDate);
//
//   @override
//   List<Object?> get props => [selectedDate];
// }
//
// // States
// class DateRangeState extends Equatable {
//   final DateTime? startDate;
//   final DateTime? endDate;
//
//   const DateRangeState(this.startDate, this.endDate);
//
//   @override
//   List<Object?> get props => [startDate, endDate];
// }
//
// // BLoC
// class DateRangeBloc extends Bloc<DateRangeEvent, DateRangeState> {
//   final DateRangeRepository dateRangeRepository;
//
//   DateRangeBloc(this.dateRangeRepository) : super(DateRangeState(null, null));
//
//   on<DateRangeEvent>((event, emit) async {
//   emit(NationalityInitial());
//   final response = await fetchNationalityUseCase.execute();
//
//   response.fold((l) => emit(ErrorNationalityState(l.msgError)),
//   (r) => emit(LoadedNationalitiesState(r)));
// });
//   @override
//   Stream<DateRangeState> mapEventToState(DateRangeEvent event) async* {
//     if (event is DateSelectedEvent) {
//       yield* _mapDateSelectedToState(event);
//     }
//   }
//
//   Stream<DateRangeState> _mapDateSelectedToState(
//       DateSelectedEvent event) async* {
//     if (state.startDate == null ||
//         event.selectedDate.isBefore(state.startDate!)) {
//       yield DateRangeState(event.selectedDate, null);
//     } else {
//       yield DateRangeState(state.startDate, event.selectedDate);
//     }
//   }
// }
//
// // main.dart
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Date Range Selector Test'),
//         ),
//         body: BlocProvider(
//           create: (context) =>
//               DateRangeBloc(DateRangeRepository(DateRangeDataProvider())),
//           child: DateRangeSelector(),
//         ),
//       ),
//     );
//   }
// }
//
// class DateRangeSelector extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DateRangeBloc, DateRangeState>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 key: UniqueKey(),
//                 readOnly: true,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Select Date Range',
//                 ),
//                 onTap: () async {
//                   DateTime? pickedDate =
//                       await BlocProvider.of<DateRangeBloc>(context)
//                           .dateRangeRepository
//                           .pickDate(
//                             state.startDate ?? DateTime.now(),
//                           );
//
//                   if (pickedDate != null) {
//                     BlocProvider.of<DateRangeBloc>(context)
//                         .add(DateSelectedEvent(pickedDate));
//                   }
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
