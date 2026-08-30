import 'package:bottom_picker/cupertino/cupertino_date_picker.dart';
import 'package:cupertino_ui/cupertino_ui.dart';

/// A date picker widget that can be used to select a date or time.
class DatePicker extends StatelessWidget {
  /// The mode of the date picker [CupertinoDatePickerMode].
  final CupertinoDatePickerMode mode;

  /// The callback function that is called when the selected date changes.
  final Function(DateTime) onDateChanged;

  /// The initial date to be displayed in the picker.
  final DateTime? initialDateTime;

  /// The maximum date that can be selected in the picker.
  final DateTime? maxDateTime;

  /// The minimum date that can be selected in the picker.
  final DateTime? minDateTime;

  /// The interval of the minutes in the time picker.
  final int minuteInterval;

  /// Whether to use 24-hour format for the time picker.
  final bool use24hFormat;

  /// The order in which the date components are displayed in the picker.
  final DatePickerDateOrder? dateOrder;

  /// The text style to be used for the items in the picker.
  final TextStyle? textStyle;

  /// The height of each item in the picker.
  final double? itemExtent;

  /// Whether to show the time separator in the time picker.
  final bool showTimeSeparator;

  /// The list of days to be displayed in the calendar view of the picker.
  final List<int> calendarDays;

  /// The theme data to be used for the picker.
  final CupertinoTextThemeData? pickerThemeData;

  /// The predicate function that determines whether a given hour is selectable in the time picker.
  final SelectableHourPredicate? hourPredicate;

  const DatePicker({
    super.key,
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
    this.showTimeSeparator = false,
    this.calendarDays = CupertinoDatePickerWidget.fullWeek,
    this.pickerThemeData,
    this.hourPredicate,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme:
            pickerThemeData ??
            CupertinoTextThemeData(dateTimePickerTextStyle: textStyle),
      ),
      child: CupertinoDatePickerWidget(
        itemExtent: itemExtent ?? 0,
        showTimeSeparator: showTimeSeparator,
        mode: mode,
        selectableHourPredicate: hourPredicate,
        onDateTimeChanged: onDateChanged,
        initialDateTime: initialDateTime,
        minuteInterval: minuteInterval,
        maximumDate: maxDateTime,
        minimumDate: minDateTime,
        use24hFormat: use24hFormat,
        dateOrder: dateOrder,
        calendarDays: calendarDays,
      ),
    );
  }
}
