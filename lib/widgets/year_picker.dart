import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/cupertino.dart';

class BottomYearDatePicker extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final DateTime? initialDateTime;
  final DateTime? maxDateTime;
  final DateTime? minDateTime;
  final double? itemExtent;
  final CupertinoTextThemeData? pickerThemeData;

  const BottomYearDatePicker({
    super.key,
    required this.onDateChanged,
    this.initialDateTime,
    this.maxDateTime,
    this.minDateTime,
    this.itemExtent = 0,
    this.pickerThemeData,
  });

  @override
  State<BottomYearDatePicker> createState() => _BottomYearDatePicker();
}

class _BottomYearDatePicker extends State<BottomYearDatePicker> {
  List<int> years = [];
  int initialYear = 0;

  @override
  void initState() {
    super.initState();
    int lastYear = widget.maxDateTime == null
        ? DateTime.now().year + 100
        : widget.maxDateTime!.year;
    int firstYear = widget.minDateTime == null
        ? DateTime.now().year - 100
        : widget.minDateTime!.year;

    years = List.generate(
      lastYear - firstYear + 1,
      (index) => firstYear + index,
    );

    if (widget.initialDateTime != null) {
      initialYear = widget.initialDateTime!.year;
    } else if (years.contains(DateTime.now().year)) {
      initialYear = DateTime.now().year;
    } else {
      initialYear = firstYear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimplePicker(
      items: years
          .map(
            (year) => Text(
              year.toString(),
            ),
          )
          .toList(),
      onChange: (index) {
        widget.onDateChanged(
          DateTime(
            years[index],
          ),
        );
      },
      selectedItemIndex: 0,
      itemExtent: widget.itemExtent ?? 0,
      pickerThemeData: widget.pickerThemeData,
      diameterRatio: 1.1,
    );
  }
}
