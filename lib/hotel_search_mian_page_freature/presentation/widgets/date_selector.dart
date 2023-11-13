import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_hotels/global/utils/constants.dart';

class DateRangeSelector extends StatefulWidget {
  const DateRangeSelector({Key? key}) : super(key: key);

  @override
  _DateRangeSelectorState createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateTime? _startDate;
  DateTime? _endDate;
  TextEditingController _dateController = TextEditingController();
  DateTime? picked;

  void _updateDateControllerText() {
    if (_startDate != null) {
      if (_endDate != null) {
        _dateController.text =
            'Date Range: ${_startDate!.toLocal()} - ${_endDate!.toLocal()}';
      } else {
        _dateController.text = 'Start Date: ${_startDate!.toLocal()}';
      }
    } else {
      _dateController.text = '';
    }
  }

  Future _selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    ).then((value) {
      if (kDebugMode) {
        print(picked?.day.toString());

        print("Picked date: $picked");

        if (picked != null) {
          setState(() {
            if (_startDate == null || picked!.isBefore(_startDate!)) {
              _startDate = picked;
              _endDate = null;
            } else {
              _endDate = picked;
              return;
            }
          });
        }
        _updateDateControllerText();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppConstants.unitWidthValu(context) * 90,
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              textAlign: TextAlign.center,

              key: UniqueKey(), // Ensure a new key to force the rebuild
              controller: _dateController,
              onTap: () {
                _selectDate(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'check in | check out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
