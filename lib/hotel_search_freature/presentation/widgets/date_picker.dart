import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerExampleState extends State<DatePickerExample>
    with RestorationMixin {
  DateTime? _startDate;
  DateTime? _endDate;
  TextEditingController _dateController = TextEditingController();
  DateTime? picked;
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        picked = newSelectedDate;

        if (_startDate == null || picked!.isBefore(_startDate!)) {
          _startDate = picked;
          _endDate = null; // Reset end date if selecting a new start date
        } else {
          _endDate = picked;
        }
        updateDateControllerText();

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
    }
  }

  void updateDateControllerText() {
    print('................');
    if (_startDate != null) {
      if (_endDate != null) {
        _dateController.text =
            'Date Range: ${DateFormat('yyyy-MM-dd').format(_startDate!)} - ${DateFormat('yyyy-MM-dd').format(_endDate!)}';

        print(_dateController.text);
      } else {
        _dateController.text =
            'Start Date: ${DateFormat('yyyy-MM-dd').format(_startDate!)}';
        print(_dateController.text);
      }
    } else {
      _dateController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: UniqueKey(), // Ensure a new key to force the rebuild
      controller: _dateController,
      onTap: () {
        _restorableDatePickerRouteFuture.present();
        // Rebuild the StatefulBuilder
      },
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Select Date  please',
      ),
    );
  }
}
