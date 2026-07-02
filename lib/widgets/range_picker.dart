import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';

/// A range picker widget that can be used to select a range of dates or times.
class RangePicker extends StatefulWidget {
  /// The callback function that is called when the first date changes.
  final Function(DateTime) onFirstDateChanged;

  /// The callback function that is called when the second date changes.
  final Function(DateTime) onSecondDateChanged;

  /// The initial date to be displayed in the first picker.
  final DateTime? initialFirstDateTime;

  /// The initial date to be displayed in the second picker.
  final DateTime? initialSecondDateTime;

  /// The maximum date that can be selected in the first picker.
  final DateTime? maxFirstDate;

  /// The maximum date that can be selected in the second picker.
  final DateTime? maxSecondDate;

  /// The minimum date that can be selected in the first picker.
  final DateTime? minFirstDateTime;

  /// The minimum date that can be selected in the second picker.
  final DateTime? minSecondDateTime;

  /// The order in which the date components are displayed in the picker.
  final DatePickerDateOrder? dateOrder;

  /// The text style to be used for the items in the picker.
  final TextStyle? textStyle;

  /// The mode of the date picker [CupertinoDatePickerMode].
  final CupertinoDatePickerMode mode;

  /// Whether to use 24-hour format for the time picker.
  final bool use24hFormat;

  /// The interval of the minutes in the time picker.
  final int? minuteInterval;

  /// The height of each item in the picker.
  final double? itemExtent;

  /// Whether to show the time separator in the time picker.
  final bool showTimeSeperator;

  /// The theme data to be used for the picker.
  final CupertinoTextThemeData? pickerThemeData;

  const RangePicker({
    super.key,
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
    this.pickerThemeData,
  });

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
            showTimeSeparator: widget.showTimeSeperator,
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
            pickerThemeData: widget.pickerThemeData,
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
            showTimeSeparator: widget.showTimeSeperator,
            pickerThemeData: widget.pickerThemeData,
          ),
        ),
      ],
    );
  }
}
