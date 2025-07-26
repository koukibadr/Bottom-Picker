import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final CupertinoTimerPickerMode mode;
  final int minuteInterval;
  final TextStyle? textStyle;
  final double itemExtent;
  final Function(Duration) onChange;
  final Duration? initialDuration;
  final int secondInterval;
  final CupertinoTextThemeData? pickerThemeData;

  const TimePicker({
    super.key,
    this.minuteInterval = 1,
    required this.mode,
    required this.textStyle,
    required this.itemExtent,
    required this.onChange,
    required this.initialDuration,
    this.secondInterval = 1,
    this.pickerThemeData,
  });

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
