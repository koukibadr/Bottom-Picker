import 'package:flutter/cupertino.dart';

enum BottomPickerType {
  simple,
  time,
  timer,
  dateTime,
  rangeDate,
  rangeTime,
}

enum BottomPickerTheme {
  blue(
    gradientColors: [
      Color(0xFF3366FF),
      Color(0xFF00CCFF),
    ],
  ),
  orange(
    gradientColors: [
      Color(0xFFff7e5f),
      Color(0xFFfeb47b),
    ],
  ),
  temptingAzure(
    gradientColors: [
      Color(0xFF84fab0),
      Color(0xFF8fd3f4),
    ],
  ),
  heavyRain(
    gradientColors: [
      Color(0xFFcfd9df),
      Color(0xFFe2ebf0),
    ],
  ),
  plumPlate(
    gradientColors: [
      Color(0xFF667eea),
      Color(0xFF764ba2),
    ],
  ),
  morningSalad(
    gradientColors: [
      Color(0xFFB7F8DB),
      Color(0xFF50A7C2),
    ],
  );

  final List<Color> gradientColors;

  const BottomPickerTheme({
    required this.gradientColors,
  });
}
