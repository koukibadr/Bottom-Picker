import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';

/// A time picker widget that can be used to select a time duration
/// based on the Time picker mode [CupertinoTimerPickerMode].
class TimePicker extends StatelessWidget {
  /// The mode of the time picker [CupertinoTimerPickerMode].
  ///
  /// Possible values are:
  /// - [CupertinoTimerPickerMode.hms]: Displays hours, minutes, and seconds
  /// - [CupertinoTimerPickerMode.hm]: Displays hours and minutes
  /// - [CupertinoTimerPickerMode.ms]: Displays minutes and seconds
  ///
  /// mode cannot be null and must be one of the above values.
  final CupertinoTimerPickerMode mode;

  /// The interval of the minutes in the time picker.
  /// By default minuteInterval is set to 1, which means that the user can select any minute value from 0 to 59.
  ///
  /// if minuteInterval is outside the range of 1 to 59 an assertion error will be thrown.
  final int minuteInterval;

  /// The text style to be used for the items in the picker.
  /// When the textstyle is null the default text style of the [CupertinoTimerPicker] will be used.
  final TextStyle? textStyle;

  /// The height of each item in the picker.
  /// The extent value should be greater than 0, otherwise an assertion error will be thrown.
  /// by default the itemExtent value is taking the [_kItemExtent] value of the [CupertinoTimerPicker] which is 32.0.
  final double itemExtent;

  /// The callback function that is called when the selected time changes.
  /// a required parameter that cannot be null, and it will be called with the selected time duration.
  final Function(Duration) onChange;

  /// The initial duration to be displayed in the picker.
  /// When initialDuration is null, the picker will display a duration of zero.
  final Duration? initialDuration;

  /// The interval of the seconds in the time picker.
  /// By default secondInterval is set to 1, which means that the user can select any second value from 0 to 59.
  /// if secondInterval is outside the range of 1 to 59 an assertion error will be thrown.
  final int secondInterval;

  /// The theme data to be used for the picker.
  /// When pickerThemeData is null, the default theme data of the [CupertinoTimerPicker] will be used.
  final CupertinoTextThemeData? pickerThemeData;

  const TimePicker({
    super.key,
    this.minuteInterval = 1,
    required this.mode,
    this.textStyle,
    this.itemExtent = 32.0,
    required this.onChange,
    this.initialDuration,
    this.secondInterval = 1,
    this.pickerThemeData,
  })  : assert(
          minuteInterval > 0 && minuteInterval < 60,
          'minuteInterval must be a positive integer from 1 to 59.',
        ),
        assert(itemExtent > 0, 'itemExtent must be a positive number.'),
        assert(
          secondInterval > 0 && secondInterval < 60,
          'secondInterval must be a positive integer from 1 to 59.',
        );

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: pickerThemeData ??
            CupertinoTextThemeData(
              dateTimePickerTextStyle: textStyle,
            ),
      ),
      child: CupertinoTimerPicker(
        itemExtent: itemExtent,
        mode: mode,
        onTimerDurationChanged: onChange,
        minuteInterval: minuteInterval,
        initialTimerDuration: initialDuration ?? Duration.zero,
        backgroundColor: Colors.transparent,
        secondInterval: 1,
      ),
    );
  }
}
