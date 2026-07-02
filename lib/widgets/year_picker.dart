import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/cupertino.dart';

/// A year picker widget that can be used to select a year.
class BottomYearDatePicker extends StatefulWidget {
  /// The callback function that is called when the selected year changes.
  final Function(DateTime) onDateChanged;

  /// The initial date to be displayed in the picker.
  final DateTime? initialDateTime;

  /// The maximum date that can be selected in the picker.
  final DateTime? maxDateTime;

  /// The minimum date that can be selected in the picker.
  final DateTime? minDateTime;

  /// The height of each item in the picker.
  final double? itemExtent;

  /// The theme data to be used for the picker.
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
