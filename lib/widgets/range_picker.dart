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
  final int? minuteInterval;
  final double? itemExtent;
  final bool showTimeSeperator;

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
    this.minuteInterval,
    this.itemExtent,
    this.showTimeSeperator = false,
  }) : super(key: key);

  @override
  State<RangePicker> createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  late DateTime? minSecondDateTime = widget.minSecondDateTime;
  late DateTime? initialSecondDateTime = widget.initialSecondDateTime;

  late DateTime? initialFirstDateTime = widget.initialFirstDateTime;
  late DateTime? minFirstDateTime = widget.minFirstDateTime;

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
      initialFirstDateTime = widget.initialFirstDateTime ?? minFirstDateTime;
      minSecondDateTime = widget.minSecondDateTime ??
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          );
      initialSecondDateTime = widget.initialSecondDateTime ?? minSecondDateTime;

      widget.onFirstDateChanged(initialFirstDateTime!);
      widget.onSecondDateChanged(initialSecondDateTime!);
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
            minuteInterval: widget.minuteInterval ?? 1,
            mode: widget.mode,
            itemExtent: widget.itemExtent,
            showTimeSeperator: widget.showTimeSeperator,
            onDateChanged: (date) {
              widget.onFirstDateChanged.call(date);
              if (initialSecondDateTime!.isBefore(date)) {
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
            minuteInterval: widget.minuteInterval ?? 1,
            itemExtent: widget.itemExtent,
            showTimeSeperator: widget.showTimeSeperator,
          ),
        ),
      ],
    );
  }
}
