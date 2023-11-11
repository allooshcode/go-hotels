import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeSelector extends StatefulWidget {
  const DateRangeSelector({super.key});

  @override
  _DateRangeSelectorState createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateTime? _startDate;
  DateTime? _endDate;
  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();
  bool _isStartDateSelected = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
        if (_isStartDateSelected) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date Range'),
          TextFormField(
            controller: _dateController,
            onTap: () => _selectDate(context),
            readOnly: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select date range',
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Start Date: ${_startDate ?? 'Not selected'}'),
              Text('End Date: ${_endDate ?? 'Not selected'}'),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isStartDateSelected = !_isStartDateSelected;
                _dateController.clear();
                _selectedDate = null;
              });
            },
            child: Text(
                _isStartDateSelected ? 'Select End Date' : 'Select Start Date'),
          ),
        ],
      ),
    );
  }
}
