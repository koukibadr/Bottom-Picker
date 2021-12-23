import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final Function(DateTime) onDateChanged;
  final DateTime? intialDateTime;
  final DateTime? maxDateTime;
  final DateTime? minDateTime;
  final bool use24hFormat;
  final DatePickerDateOrder? dateOrder;

  const DatePicker({
    Key? key,
    required this.intialDateTime,
    required this.maxDateTime,
    required this.minDateTime,
    required this.mode,
    required this.onDateChanged,
    required this.use24hFormat,
    this.dateOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      mode: mode,
      onDateTimeChanged: onDateChanged,
      initialDateTime: intialDateTime,
      maximumDate: maxDateTime,
      minimumDate: minDateTime,
      use24hFormat: use24hFormat,
      dateOrder: dateOrder,
    );
  }
}
