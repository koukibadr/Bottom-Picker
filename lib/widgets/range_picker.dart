import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';

class RangePicker extends StatefulWidget {
  final Function(DateTime) onFirstDateChanged;
  final Function(DateTime) onSecondDateChanged;
  final DateTime? initialFirstDateTime;
  final DateTime? initialSecondDateTime;
  final DateTime? maxFirstDate;
  final DateTime? maxSecondDate;
  final DateTime? minFirstDateTime;
  final DateTime? minSecondDateTime;
  final DatePickerDateOrder? dateOrder;
  final TextStyle textStyle;
  final CupertinoDatePickerMode mode;
  final bool use24hFormat;

  const RangePicker({
    Key? key,
    required this.initialFirstDateTime,
    required this.initialSecondDateTime,
    required this.maxFirstDate,
    required this.minFirstDateTime,
    required this.maxSecondDate,
    required this.minSecondDateTime,
    required this.onFirstDateChanged,
    required this.onSecondDateChanged,
    this.dateOrder,
    required this.textStyle,
    required this.mode,
    required this.use24hFormat,
  }) : super(key: key);

  @override
  State<RangePicker> createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  late DateTime minSecondDateTime;
  late DateTime initialSecondDateTime;

  late DateTime initialFirstDateTime;
  late DateTime minFirstDateTime;

  @override
  void initState() {
    super.initState();
    if (widget.mode == CupertinoDatePickerMode.time) {
      // If it is a time range, the minimum time uses the date of the day, ignores the date, and only needs the time
      // The default is 0:0:0
      minFirstDateTime = widget.minFirstDateTime ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          );
      initialFirstDateTime = widget.initialFirstDateTime ??
          minFirstDateTime;
      minSecondDateTime = widget.minSecondDateTime ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          );
      initialSecondDateTime = widget.initialSecondDateTime ??
          minSecondDateTime;

      widget.onFirstDateChanged(initialFirstDateTime);
      widget.onSecondDateChanged(initialSecondDateTime);
    } else {
      minFirstDateTime = widget.minFirstDateTime ??
          DateTime.now().add(
            const Duration(days: 1),
          );
      initialFirstDateTime = widget.initialFirstDateTime ??
          minFirstDateTime.add(
            const Duration(days: 1),
          );
      minSecondDateTime = widget.minSecondDateTime ??
          DateTime.now().add(
            const Duration(days: 1),
          );
      initialSecondDateTime = widget.initialSecondDateTime ??
          minSecondDateTime.add(
            const Duration(days: 1),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePicker(
            use24hFormat: widget.use24hFormat,
            initialDateTime: initialFirstDateTime,
            maxDateTime: widget.maxFirstDate,
            minDateTime: minFirstDateTime,
            mode: widget.mode,
            onDateChanged: (date) {
              widget.onFirstDateChanged.call(date);
              if (initialSecondDateTime.isBefore(date)) {
                widget.onSecondDateChanged.call(date);
                setState(() {
                  initialSecondDateTime = date;
                  minSecondDateTime = date;
                });
              } else {
                setState(() {
                  minSecondDateTime = date;
                });
              }
            },
            dateOrder: widget.dateOrder,
            textStyle: widget.textStyle,
          ),
        ),
        Expanded(
          child: DatePicker(
            key: UniqueKey(),
            use24hFormat: widget.use24hFormat,
            initialDateTime: initialSecondDateTime,
            maxDateTime: widget.maxSecondDate,
            minDateTime: minSecondDateTime,
            mode: widget.mode,
            onDateChanged: widget.onSecondDateChanged,
            dateOrder: widget.dateOrder,
            textStyle: widget.textStyle,
          ),
        ),
      ],
    );
  }
}
