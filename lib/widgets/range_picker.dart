import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';

class RangePicker extends StatelessWidget {
  final Function(DateTime) onFirstDateChanged;
  final Function(DateTime) onSecondDateChanged;
  final DateTime? initialFirstDateTime;
  final DateTime? initialSecondDateTime;
  final DateTime? maxFirstDate;
  final DateTime? maxSecondDate;
  final DateTime? minFirstDate;
  final DateTime? minSecondDate;
  final DatePickerDateOrder? dateOrder;
  final TextStyle textStyle;

  const RangePicker({
    Key? key,
    required this.initialFirstDateTime,
    required this.initialSecondDateTime,
    required this.maxFirstDate,
    required this.minFirstDate,
    required this.maxSecondDate,
    required this.minSecondDate,
    required this.onFirstDateChanged,
    required this.onSecondDateChanged,
    required this.textStyle,
    this.dateOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePicker(
            initialDateTime: initialFirstDateTime,
            maxDateTime: maxFirstDate,
            minDateTime: minFirstDate,
            mode: CupertinoDatePickerMode.date,
            onDateChanged: onFirstDateChanged,
            dateOrder: dateOrder,
            textStyle: textStyle,
          ),
        ),
        Expanded(
          child: DatePicker(
            initialDateTime: initialSecondDateTime,
            maxDateTime: maxSecondDate,
            minDateTime: minSecondDate,
            mode: CupertinoDatePickerMode.date,
            onDateChanged: onSecondDateChanged,
            dateOrder: dateOrder,
            textStyle: textStyle,
          ),
        ),
      ],
    );
  }
}
