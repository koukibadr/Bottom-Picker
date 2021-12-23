import 'package:flutter/cupertino.dart';

class DatePicker extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final Function(DateTime) onDateChanged;
  final DateTime? intialDateTime;
  final DateTime? maxDateTime;
  final DateTime? minDateTime;
  final bool use24hFormat;
  final DatePickerDateOrder? dateOrder;
  final TextStyle textStyle;

  const DatePicker({
    Key? key,
    required this.intialDateTime,
    required this.maxDateTime,
    required this.minDateTime,
    required this.mode,
    required this.onDateChanged,
    required this.use24hFormat,
    required this.textStyle,
    this.dateOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: textStyle,
        ),
     ),
      child: CupertinoDatePicker(
        mode: mode,
        onDateTimeChanged: onDateChanged,
        initialDateTime: intialDateTime,
        maximumDate: maxDateTime,
        minimumDate: minDateTime,
        use24hFormat: use24hFormat,
        dateOrder: dateOrder,
      ),
    );
  }
}
