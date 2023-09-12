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
  late DateTime minSecondDate;
  late DateTime initialSecondDate;

  late DateTime initialFirstDate;
  late DateTime minFirstDate;

  @override
  void initState() {
    super.initState();
    minFirstDate = widget.minFirstDate ??
        DateTime.now().add(
          const Duration(days: 1),
        );
    initialFirstDate = widget.initialFirstDateTime ??
        minFirstDate.add(
          const Duration(days: 1),
        );
    minSecondDate = widget.minSecondDate ??
        DateTime.now().add(
          const Duration(days: 1),
        );
    initialSecondDate = widget.initialSecondDateTime ??
        minSecondDate.add(
          const Duration(days: 1),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePicker(
            initialDateTime: initialFirstDate,
            maxDateTime: widget.maxFirstDate,
            minDateTime: minFirstDate,
            mode: CupertinoDatePickerMode.date,
            onDateChanged: (date) {
              widget.onFirstDateChanged.call(date);
              if (initialSecondDate.isBefore(date)) {
                widget.onSecondDateChanged.call(date);
                setState(() {
                  initialSecondDate = date;
                  minSecondDate = date;
                });
              } else {
                setState(() {
                  minSecondDate = date;
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
            initialDateTime: initialSecondDate,
            maxDateTime: widget.maxSecondDate,
            minDateTime: minSecondDate,
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
