import 'package:bottom_picker/cupertino/date_picker.dart';
import 'package:flutter/cupertino.dart';

class DatePicker extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final Function(DateTime) onDateChanged;
  final DateTime? initialDateTime;
  final DateTime? maxDateTime;
  final DateTime? minDateTime;
  final int minuteInterval;
  final bool use24hFormat;
  final DatePickerDateOrder? dateOrder;
  final TextStyle textStyle;
  final double? itemExtent;
  final bool showTimeSeperator;

  const DatePicker({
    Key? key,
    required this.initialDateTime,
    this.minuteInterval = 1,
    this.maxDateTime,
    this.minDateTime,
    required this.mode,
    required this.onDateChanged,
    this.use24hFormat = true,
    required this.textStyle,
    this.dateOrder,
    this.itemExtent = 0,
    this.showTimeSeperator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: textStyle,
        ),
      ),
      child: CupertinoDatePickerWidget(
        itemExtent: itemExtent ?? 0,
        showTimeSeperator: showTimeSeperator,
        mode: mode,
        onDateTimeChanged: onDateChanged,
        initialDateTime: initialDateTime,
        minuteInterval: minuteInterval,
        maximumDate: maxDateTime,
        minimumDate: minDateTime,
        use24hFormat: use24hFormat,
        dateOrder: dateOrder,
      ),
    );
  }
}
