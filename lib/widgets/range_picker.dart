import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';

class RangePicker extends StatefulWidget {
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
  State<RangePicker> createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePicker(
            initialDateTime: widget.initialFirstDateTime,
            maxDateTime: widget.maxFirstDate,
            minDateTime: widget.minFirstDate,
            mode: CupertinoDatePickerMode.date,
            onDateChanged: widget.onFirstDateChanged,
            dateOrder: widget.dateOrder,
            textStyle: widget.textStyle,
          ),
        ),
        Expanded(
          child: DatePicker(
            initialDateTime: widget.initialSecondDateTime,
            maxDateTime: widget.maxSecondDate,
            minDateTime: widget.minSecondDate,
            mode: CupertinoDatePickerMode.date,
            onDateChanged: widget.onSecondDateChanged,
            dateOrder: widget.dateOrder,
            textStyle: widget.textStyle,
          ),
        ),
      ],
    );
  }
}
